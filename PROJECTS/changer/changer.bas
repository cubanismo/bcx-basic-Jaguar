' Changer - an rB+ sample project by sh3-rg
'
' Changer is an example of manually altering a sprite's frame
'   display by altering the address of the bitmap pointed to in
'   the sprite definition.
'
' We change the place the graphics are read from by rB+ to make
'   the sprite appear different depending on our own conditions,
'   rather than rB+'s automatic sprite animation.

' ****************************************************
' * OBJECT NAMES IN ORDER OF APPEARANCE IN rapinit.s *
' ****************************************************

' particle/text layer                                        0

DIM stars%          :stars=1        '  1 object     total    1
DIM ship%           :ship=2         '  1 object     total    2


' *******************************************************
' * REMAINING VARIABLES                                 *
' *******************************************************

DIM     framecounter%       :   framecounter=0                              ' It's always nice to have a frame counter.
DIM     pad1%               :   pad1=0                                      ' This is where we store the state of the joypad.
DIM     ship_pos%           :   ship_pos=0                                  ' This is where we'll store the location of the ship in x.
DIM     stars_gfx_loc%      :   stars_gfx_loc=0                             ' The location of stars graphics in the Jaguar's memory (the address of the bitmap).
DIM     ship_gfx_loc%       :   ship_gfx_loc=0                              ' The location of ship graphics in the Jaguar's memory (the address of the bitmap).
DIM     stars_gfx_size%     :   stars_gfx_size=0                            ' The size of one frame of stars sprite graphics, we entered this in rapinit.s.
DIM     ship_gfx_size%      :   ship_gfx_size=0                             ' The size of one frame of stars sprite graphics, we entered this in rapinit.s.

' *******************************************************
' * FIND WHERE THE JAG HAS STORED THE GRAPHICS          *
' *    AND HOW BIG EACH SPRITE IS IN MEMORY             *
' *******************************************************

stars_gfx_loc=RGETOBJ(stars,R_sprite_gfxbase)                               ' R_sprite_gfxbase is the property of the sprite that says where the graphics live
                                                                            '   in the Jaguar's memory. Remember the nickname we gave the graphics in the
                                                                            '   assets.txt file? The one we then used in the sprite definition? This holds that
                                                                            '   memory location that we set by entering, in this case, "STARS". Once we have
                                                                            '   this, we can use it to calculate the locations of the other frames that
                                                                            '   follow it rather easily.
                                                                            ' Remember the little calculation we type in to tell rB+ how big each sprite is?
                                                                            '   A-ha! If we grab that, or simply work it out again, we'll know the place where
                                                                            '   the next sprite frame lives by adding it to stars_gfx_loc! And the next one and
                                                                            '   and the next and so on. So let's use the result of the calculation we entered
                                                                            '   in the sprite definition instead of calculating it again here, we're smarter
                                                                            '   than that! :0)
stars_gfx_size=RGETOBJ(stars,R_sprite_framesz)                              ' R_sprite_framesz is this sprite property, we now know how large in memory a single
                                                                            '   frame of sprite graphics is. So, stars_gfx_loc+stars_gfx_size=the place in memory
                                                                            '   where the 2nd frame lives. stars_gfx_loc+(stars_gfx_size*2)= the next frame, and
                                                                            '   so on all the way up to stars_gfx_loc+(stars_gfx_size*11) for the 12th frame. Easy!
                                                                            ' Let's do the same for the Ship sprite:
ship_gfx_loc=RGETOBJ(ship,R_sprite_gfxbase)                                 ' Memory location of ship sprite graphic.
ship_gfx_size=RGETOBJ(ship,R_sprite_framesz)                                ' Memory size of each ship graphic, to be used as an offset to each frame.

' *******************************************************
' * SET UP COLOUR TABLE WITH PALETTES FROM ASSETS       *
' *******************************************************

LOADCLUT(strptr(STARS_clut),15,16)                                          ' This pops the colours from the stars graphic into the last 16 of the CLUT
LOADCLUT(strptr(SHIP_clut),14,16)                                           ' This pops the colours from the ship graphic into the 2nd to last 16 of the CLUT

' *******************************************************
' * SET UP SOME STUFF BEFORE THE MAIN PROGRAM BEGINS    *
' *******************************************************

RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*5))            ' Set the stars graphic to use the 5th frame of animation as a start point.

' *******************************************************
' * START OF PROGRAM                                    *
' *******************************************************

DO
    ship_pos=RGETOBJ(ship,R_sprite_x)                                       ' Read current ship x co-ordinate into the ship_pos variable.
    
    pad1=GETPAD(1)                                                          ' Read state of joypad 1 into pad1 variable.
    
    CALL check_pad_movement                                                 ' We've read the pad, so now it's time to see if anything was pressed.
                                                                            '   and move the ship accordingly and change the sprite frame to match.
    CALL choose_stars_frame                                                 ' Once the ship is moved, we can see where it is on screen and decide
                                                                            '   which frame of stars to display.    
    VSYNC                                                                   ' Wait for the VB
    
    framecounter++                                                          ' We don't actually use this here, but it's always nice to have :0)
    IF framecounter=60 THEN
        framecounter=0
    ENDIF
LOOP


' *******************************************************
' * SUBROUTINES                                         *
' *******************************************************

SUB check_pad_movement

    IF pad1 BAND PAD_L AND ship_pos>(86<<16) THEN
        RSETOBJ(ship,R_sprite_x,ship_pos-(2<<16))
        RSETOBJ(ship,R_sprite_gfxbase,ship_gfx_loc+ship_gfx_size)
    ENDIF
    
    IF pad1 BAND PAD_R AND ship_pos<(208<<16) THEN
        RSETOBJ(ship,R_sprite_x,ship_pos+(2<<16))
        RSETOBJ(ship,R_sprite_gfxbase,ship_gfx_loc+(ship_gfx_size*2))
    ENDIF
    
    IF pad1=0 THEN
        RSETOBJ(ship,R_sprite_gfxbase,ship_gfx_loc)
    ENDIF


END SUB

' *******************************************************

SUB choose_stars_frame
    ship_pos=RGETOBJ(ship,R_sprite_x)

    IF ship_pos<=(100<<16) THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*0))
    ENDIF   
    IF ship_pos>(100<<16)  AND ship_pos <=(110<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*1))
    ENDIF   
    IF ship_pos>(110<<16)  AND ship_pos <=(120<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*2))
    ENDIF   
    IF ship_pos>(120<<16)  AND ship_pos <=(130<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*3))
    ENDIF   
    IF ship_pos>(130<<16)  AND ship_pos <=(140<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*4))
    ENDIF   
    IF ship_pos>(140<<16)  AND ship_pos <=(150<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*5))
    ENDIF   
    IF ship_pos>(150<<16)  AND ship_pos <=(160<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*6))
    ENDIF   
    IF ship_pos>(160<<16)  AND ship_pos <=(170<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*7))
    ENDIF   
    IF ship_pos>(170<<16)  AND ship_pos <=(180<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*8))
    ENDIF   
    IF ship_pos>(180<<16)  AND ship_pos <=(190<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*9))
    ENDIF   
    IF ship_pos>(190<<16)  AND ship_pos <=(200<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*10))
    ENDIF   
    IF ship_pos>(200<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*11))
    ENDIF
END SUB

' *******************************************************
