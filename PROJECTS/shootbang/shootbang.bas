' Shootbang - an rB+ sample project by sh3-rg
'
' Shootbang takes the "Changer" project and adds in some
'   player, missile, enemy, collision type stuff.
'
' Enemy pixels from a -huge- original by MillionthVector:
'       blog http://millionthvector.blogspot.de
'
' He shoots, he hits, he scores!

' ****************************************************
' * OBJECT NAMES IN ORDER OF APPEARANCE IN rapinit.s *
' ****************************************************

' particle/text layer                                        0

DIM stars%          :stars=1        '  1 object     total    1
DIM ship%           :ship=2         '  1 object     total    2
DIM enemy1%         :enemy1=3       '  1 object     total    3
DIM enemy2%         :enemy2=4       '  1 object     total    4
DIM enemy3%         :enemy3=5       '  1 object     total    5
DIM enemy4%         :enemy4=6       '  1 object     total    6
DIM enemy5%         :enemy5=7       '  1 object     total    7
DIM bullets%[11]
                    bullets[0]=0    '''''''''''''''''''''''''''
                    bullets[1]=8    '  1 object     total    8
                    bullets[2]=9    '  1 object     total    9
                    bullets[3]=10   '  1 object     total    10
                    bullets[4]=11   '  1 object     total    11
                    bullets[5]=12   '  1 object     total    12
                    bullets[6]=13   '  1 object     total    13
                    bullets[7]=14   '  1 object     total    14
                    bullets[8]=15   '  1 object     total    15
                    bullets[9]=16   '  1 object     total    16
                    bullets[10]=17  '  1 object     total    17
DIM explosions%[6]
                    explosions[0]=0     '''''''''''''''''''''''''''
                    explosions[1]=18    '  1 object     total    18
                    explosions[2]=19    '  1 object     total    19
                    explosions[3]=20    '  1 object     total    20
                    explosions[4]=21    '  1 object     total    21
                    explosions[5]=22    '  1 object     total    22
DIM bigsplosions%[6]
                    bigsplosions[0]=0       '''''''''''''''''''''''''''
                    bigsplosions[1]=23  '  1 object     total    23
                    bigsplosions[2]=24  '  1 object     total    24
                    bigsplosions[3]=25  '  1 object     total    25
                    bigsplosions[4]=26  '  1 object     total    26
                    bigsplosions[5]=27  '  1 object     total    27

' *******************************************************
' * REMAINING VARIABLES                                 *
' *******************************************************

DIM     framecounter%       :   framecounter=0                              ' It's always nice to have a frame counter.
DIM     pad1%               :   pad1=0                                      ' This is where we store the state of the joypad.
DIM     ship_pos%           :   ship_pos=0                                  ' This is where we'll store the location of the ship in x.
DIM     stars_gfx_loc%      :   stars_gfx_loc=0                             ' The location of stars graphics in the Jaguar's memory (the address of the bitmap).
DIM     ship_gfx_loc%       :   ship_gfx_loc=0                              ' The location of ship graphics in the Jaguar's memory (the address of the bitmap).
DIM     stars_gfx_size%     :   stars_gfx_size=0                            ' The size of one frame of stars sprite graphics, we entered this in rapinit.s.
DIM     ship_gfx_size%      :   ship_gfx_size=0                             ' The size of one frame of ship sprite graphics, we entered this in rapinit.s.
DIM     xunt%               :   xunt=0
DIM     enemy_x%            :   enemy_x=160
DIM     ticker%             :   ticker=0
DIM     tocker%             :   tocker=0
DIM     tucker%             :   tucker=0
DIM     check_enemy_active% :   check_enemy_active=0
DIM     check_for_hit_enemy%:   check_for_hit_enemy=0
DIM     bulletctr%          :   bulletctr=1
DIM     bullettime%         :   bullettime=0
DIM     bulletdelay%        :   bulletdelay=3
DIM     maxbullets%         :   maxbullets=10
DIM     randy%              :   randy=0
DIM     exp_max%            :   exp_max=0
DIM     exp_multiplier%     :   exp_multiplier=0
DIM     cd_flag%            :   cd_flag=0
DIM     i%                  :   i=0
DIM     j%                  :   j=0
DIM     pie!                :   pie=3.1415926535897932384626433832795       ' 8)
DIM     rads!               :   rads=(pie/180)

DIM sins%[720]
    FOR i=0 to 359
        sins[i]=(int)INT((sin(i*rads))*64)
        sins[i+360]=sins[i]
    NEXT

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

LOADCLUT(strptr(STARS_clut),10,16)                                          ' This pops the colours from the stars graphic into the last 16 of the CLUT
LOADCLUT(strptr(SHIP_clut),14,16)                                           ' This pops the colours from the ship graphic into the 2nd to last 16 of the CLUT
LOADCLUT(strptr(ENEMY_clut),13,16)                                          ' enemy colours
LOADCLUT(strptr(BULLET_clut),12,16)                                         ' bullet colours
LOADCLUT(strptr(BOOM_clut),11,16)                                           ' explosion colours

' *******************************************************
' * SET UP SOME STUFF BEFORE THE MAIN PROGRAM BEGINS    *
' *******************************************************

RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*5))            ' Set the stars graphic to use the 5th frame of animation as a start point.

exp_max=RGETOBJ(explosions[1],R_sprite_maxframe)
'DPOKE BG,6144

' ***********************************************************************************************************************************************
' * START OF PROGRAM                                                                                                                            *
' ***********************************************************************************************************************************************

DO

    CALL move_enemies

    ship_pos=RGETOBJ(ship,R_sprite_x)                                       ' Read current ship x co-ordinate into the ship_pos variable.
    
    pad1=GETPAD(1)                                                          ' Read state of joypad 1 into pad1 variable.
    
    CALL check_pad                                                          ' We've read the pad, so now it's time to see if anything was pressed.
                                                                            '   and move the ship accordingly and change the sprite frame to match.
    CALL choose_stars_frame                                                 ' Once the ship is moved, we can see where it is on screen and decide
                                                                            '   which frame of stars to display.    
    VSYNC                                                                   ' Wait for the VB

    CALL check_collision
    
    framecounter++                                                          ' 
    IF framecounter=60 THEN
        framecounter=0
    ENDIF
    ticker=ticker+2
    IF ticker=360 THEN
        ticker=0
    ENDIF
    tocker=tocker+1
    IF tocker=1080 THEN
        tocker=0
    ENDIF
    bullettime++
LOOP


' *******************************************************
' * SUBROUTINES                                         *
' *******************************************************
SUB check_collision
    cd_flag=RHIT(bullets[1],bullets[10],enemy1,enemy5)
                
    IF cd_flag>-1 THEN                                                                  ' -1 means *BAM* - *something* was it!
                
        FOR i=0 TO 4            
            check_for_hit_enemy=RGETOBJ(enemy1+i,R_sprite_was_hit)                  '   see if it is flagged as being hit (i.e.<>-1)
            IF check_for_hit_enemy<>-1 THEN     
                RSETOBJ(enemy1+i,R_sprite_was_hit,-1)                               ' reset hit flag for enemy
                xunt=RGETOBJ(enemy1+i,R_sprite_x)                                   '   read the x position of the enemy that was hit
                RSETOBJ(i+1[explosions],R_sprite_x,xunt)                                '   and set our explosion to spawn at the same x coordinate
                RSETOBJ(i+1[bigsplosions],R_sprite_x,xunt-(16<<16))                     '   and set our big explosion to spawn 16 pixels left
                xunt=RGETOBJ(enemy1+i,R_sprite_y)                                   '   read enemy y position of the enemy that was hit
                RSETOBJ(i+1[explosions],R_sprite_y,xunt+(10<<16))                       '   and set our explosion to spawn at the enemy position + 10 in y
                randy=int(INT(RND*8))
                RSETOBJ(i+1[bigsplosions],R_sprite_y,xunt-(randy<<16))                      '   and set our explosion to spawn at the enemy position -6 in y
                RSETOBJ(i+1[explosions],R_sprite_curframe,exp_max)                  '   reset explosion to start (or we'll see nothing after 1st time!)
                RSETOBJ(i+1[bigsplosions],R_sprite_curframe,exp_max)                    '   reset explosion to start (or we'll see nothing after 1st time!)
                RSETOBJ(i+1[explosions],R_sprite_active,R_is_active)                    ' active the sprite
                RSETOBJ(i+1[bigsplosions],R_sprite_active,R_is_active)                  ' active the sprite
            ENDIF
        NEXT i
    ENDIF
ENDSUB

' *******************************************************

SUB move_enemies
    tucker=tocker/3

FOR i=0 TO 4
    xunt=i*72
    RSETOBJ(enemy1+i,R_sprite_x,((160+(ticker+xunt)[sins])<<16))
    RSETOBJ(enemy1+i,R_sprite_y,(60<<16)+((tucker+xunt)[sins]<<14))         ' <<14 instead of <<16 compresses the range of y values
NEXT i

END SUB

' *******************************************************

SUB check_pad
    IF pad1 BAND PAD_L AND ship_pos>(86<<16) THEN
        RSETOBJ(ship,R_sprite_x,ship_pos-(2<<16))
        RSETOBJ(ship,R_sprite_gfxbase,ship_gfx_loc+ship_gfx_size)
    ENDIF
    
    IF pad1 BAND PAD_R AND ship_pos<(208<<16) THEN
        RSETOBJ(ship,R_sprite_x,ship_pos+(2<<16))
        RSETOBJ(ship,R_sprite_gfxbase,ship_gfx_loc+(ship_gfx_size*2))
    ENDIF
    
    IF pad1=0 OR pad1= PAD_B THEN
        RSETOBJ(ship,R_sprite_gfxbase,ship_gfx_loc)
    ENDIF
    
    IF pad1 BAND PAD_B AND bullettime>=bulletdelay THEN
        bullettime=0
        RSETOBJ(bulletctr[bullets],R_sprite_x,ship_pos+(9<<16))             ' set bullet to spawn at ship pos + offset to centre
        RSETOBJ(bulletctr[bullets],R_sprite_y,(166<<16))                    ' set bullet to spawn at ship pos less offset to nose of ship
        RSETOBJ(bulletctr[bullets],R_sprite_colchk,R_can_hit)               ' reset flag stating this bullet can hit things
        RSETOBJ(bulletctr[bullets],R_sprite_was_hit,-1)                     ' reset flag to say the bullet has not collided
        RSETOBJ(bulletctr[bullets],R_sprite_hitpoint,10)                    ' reset hitpoint value of bullet sprite to 10
        RSETOBJ(bulletctr[bullets],R_sprite_active,R_is_active)             ' active the sprite
        bulletctr++
        IF bulletctr=maxbullets+1 THEN
            bulletctr=1
        ENDIF
    ENDIF
END SUB

' *******************************************************

SUB choose_stars_frame
    ship_pos=RGETOBJ(ship,R_sprite_x)

    IF ship_pos<=(100<<16) THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*11))
    ENDIF   
    IF ship_pos>(100<<16)  AND ship_pos <=(110<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*10))
    ENDIF   
    IF ship_pos>(110<<16)  AND ship_pos <=(120<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*9))
    ENDIF   
    IF ship_pos>(120<<16)  AND ship_pos <=(130<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*8))
    ENDIF   
    IF ship_pos>(130<<16)  AND ship_pos <=(140<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*7))
    ENDIF   
    IF ship_pos>(140<<16)  AND ship_pos <=(150<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*6))
    ENDIF   
    IF ship_pos>(150<<16)  AND ship_pos <=(160<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*5))
    ENDIF   
    IF ship_pos>(160<<16)  AND ship_pos <=(170<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*4))
    ENDIF   
    IF ship_pos>(170<<16)  AND ship_pos <=(180<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*3))
    ENDIF   
    IF ship_pos>(180<<16)  AND ship_pos <=(190<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*2))
    ENDIF   
    IF ship_pos>(190<<16)  AND ship_pos <=(200<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*1))
    ENDIF   
    IF ship_pos>(200<<16)  THEN
        RSETOBJ(stars,R_sprite_gfxbase,stars_gfx_loc+(stars_gfx_size*0))
    ENDIF
END SUB

' *******************************************************
