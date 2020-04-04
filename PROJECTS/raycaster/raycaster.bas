'   Slow as shit raycaster - 1 fps!!!!! - Sporadic
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'   Based on;
'   A Simple demonstration of the Wolenstien 3D Raycasting technique.
'   (C) Patrick Kelly 2004. (patrickellyswd AT iol DOT ie)
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'   Java source file included with project.
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

basic_r_size=0
basic_r_indx=0

'Sprite object indexes
DIM lineb%          :   lineb = 1
DIM linestart%      :   linestart = 2

'Our screen is 80 pixels wide, we want 60 degree field of view
'that means that our unit is 80 * 6 = 480
CONST Angle360% = 480
CONST Angle270% = 360
CONST Angle180% = 240
CONST Angle90% = 120
CONST Angle6%0% = 80
CONST Angle45% = 60
CONST Angle30% = 40
CONST Angle6% = 8

DIM ray%        :   ray=0
DIM angle%      :   angle = 0
DIM pangle%     :   pangle = 0
DIM wall%       :   wall = 0
DIM distance%   :   distance=  0
DIM height%     :   height = 0

DIM stepx!      :   stepx = 0
DIM stepy!      :   stepy = 0
DIM playerx!    :   playerx = 0
DIM playery!    :   playery = 0
DIM rayx!       :   rayx = 0
DIM rayy!       :   rayy = 0
DIM oldplayerx! :   oldplayerx = 0
DIM oldplayery! :   oldplayery = 0

'Temp Vars
DIM rayxt%      :   rayxt = 0
DIM rayyt%      :   rayyt = 0
DIM playerxt%   :   playerxt    = 0
DIM playeryt%   :   playeryt    = 0

DIM pad1%           :   pad1=0  
DIM getangle!       :   getangle = 3.14159265358979323846 / 240.0
CONST cy% = 120         'Centre of screen
DIM playeraction%   :   playeraction = 0
DIM linesx%[80]     : linesx[80]
DIM linesy%[80]     : linesy[80]
DIM linesy2%[80]    : linesy2[80]
DIM linescol%[80]   : linescol[80]


'Get GFX address for each wall colour.
dim gfxlineb1%
gfxlineb1=RGETOBJ(lineb,R_sprite_gfxbase)
dim gfxlineb2%
gfxlineb2=RGETOBJ(linestart,R_sprite_gfxbase)

'Set default values for vertical line graphics
for int i = 0 to 79
    linesx[i] = (i*4)<<16
    linesy[i] = 0<<16
    linesy2[i] = 50
    linescol[i] = gfxlineb1
next i

powaset(linestart,8,80,strptr(linesx)) '8=R_sprite_x, look in raptor.h

        
'Set player at middle of map, looking to angle 0.
playerx = 8
playery = 8
pangle = 0
    
'The world - Numbers are colours.  0 is empty space (floor)
SET map[][16] AS integer
    { 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2 },
    { 2, 0, 1, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 1 },
    { 1, 0, 2, 0, 0, 0, 2, 0, 1, 0, 1, 0, 2, 0, 0, 2 },
    { 2, 0, 1, 0, 0, 0, 1, 0, 2, 0, 1, 2, 2, 2, 2, 1 },
    { 1, 0, 2, 0, 0, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 2 },
    { 2, 0, 1, 1, 1, 1, 1, 0, 2, 2, 1, 2, 1, 2, 0, 1 },
    { 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 2 },                
    { 2, 0, 2, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 1 },
    { 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 2 },
    { 2, 0, 1, 0, 2, 0, 1, 0, 0, 2, 1, 2, 1, 2, 0, 1 },
    { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2 },
    { 2, 0, 2, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1 },
    { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2 },
    { 2, 0, 1, 0, 2, 0, 1, 0, 0, 2, 2, 2, 2, 2, 0, 1 },
    { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2 },
    { 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1 }
END SET


'LOOKUP TABLE for fix values to fix fishbowl effect
DIM fiix![80]   :   fiix[80]
DIM fixtmp!     :   fixtmp = 0
FOR INT i = 0 TO 79
    fiix[i] = (i+1 - Angle30%) % Angle360%        
    IF fiix[i] < 0 THEN
        fiix[i] = Angle360% + fiix[i]
    ENDIF  
    fiix[i] = ( 1.0 / COS( getangle * fiix[i] ) ) / 8
NEXT i

'LOOKUP TABLE for SIN and COS values based on the 480 'degrees'
DIM TSIN![480]  :   TSIN[480]
DIM TCOS![480]  :   TCOS[480]
FOR INT i = 0 TO 479        
    TCOS[i] = COS( getangle * i )   
    TSIN[i] = SIN( getangle * i )
NEXT i


'Init screen
CALL DRAWMAZE


'''''''''''''''''''''''''''''''''''''''''''''''
' Main loop lmao
'''''''''''''''''''''''''''''''''''''''''''''''
DO
    CALL INPUT
    VSYNC
LOOP
'''''''''''''''''''''''''''''''''''''''''''''''
'   end main loop
'''''''''''''''''''''''''''''''''''''''''''''''


'Draw screen (only called when player input detected)
SUB DRAWMAZE

    'Our rays starting angle is the players view angle minus 30 for a 60 degree fov.
    angle = pangle - Angle30% 
            
    '80 ray for each vertical screen line
    FOR ray = 0 TO 79       
             
        'Make sure ray is in bounds
        angle = angle % Angle360%
        IF angle < 0 THEN
            angle = Angle360% + angle
        ENDIF                     
        
        'Ray starting position = player starting position
        rayx = playerx
        rayy = playery      
        
        'Calculate ray step x, ray step y.
        'Need to multiply by fiix to get rid of fishbowl.
        fixtmp = fiix[ray]
        stepx = (TCOS[angle] * fixtmp)
        stepy = (TSIN[angle] * fixtmp)
                    
        'Set these to minimum value
        wall = 0
        distance = 1 'Do *NOT* set to 0 or you might get /0 error.

        'Loop until wall found
        while wall = 0
                        
            rayx += stepx   'Ray traverses map in x by stepx.
            rayy += stepy   'Ray traverses map in y by stepy.
            
            rayxt = rayx
            rayyt = rayy
            
            wall = map%[rayxt,rayyt]        'Have we hit a wall.
            
            distance++  'Increment distance for each step.
        WEND
                
        'calculate height of wall. If you reduce y res then reduce 1024.            
        height = 1024 / distance

        'Set wall line colour.
        IF wall = 1 THEN
            linescol[ray] = gfxlineb1
        ELSEIF wall = 2 THEN
            linescol[ray] = gfxlineb2
        ENDIF
        
        linesy[ray] = (cy% - height)<<16                    'Top of line (wall segment)
        linesy2[ray] = (cy% + height) - (cy% - height)      'Length of line (wall segment)
        IF linesy2[ray] > 240 THEN
            linesy2[ray] = 240                              'protect against line being too long
        ENDIF       

        'Increase angle to next ray.
        angle++
        
    next ray
    
    'Push all graphic values for the 80 vertical screen slices
    powaset(linestart,12,80,strptr(linesy))                     'Top of slices (12=R_sprite_y, look in raptor.h)
    powaset(linestart,R_sprite_height,80,strptr(linesy2))       'Length of slice
    powaset(linestart,44,80,strptr(linescol))     'slice graphic (colour) (44=R_sprite_gfxbase, look at raptor.h)
    
END SUB


'Player input
SUB INPUT

    pad1=GETPAD(1)
    
    playeraction = 0

    IF (pad1 BAND PAD_LEFT) THEN
        playeraction = 1
    ELSEIF (pad1 BAND PAD_RIGHT) THEN
        playeraction = 2
    ELSEIF (pad1 BAND PAD_UP)  THEN
        playeraction = 3
    ELSEIF (pad1 BAND PAD_DOWN)  THEN
        playeraction = 4        
    ENDIF   
    
    'Handle player actions
    IF playeraction = 3 THEN
        
        oldplayerx = playerx    'For collison
        oldplayery = playery    'For collison

        '4 is the number of steps a player takes through each map cell      
        playerx += TCOS[pangle] / 4     'Increase X -   Was originally / 16
        playery += TSIN[pangle] / 4     'Increase Y -   Was originally / 16
        
        playerxt = playerx  'poor float to int conversion so the array loopup works.
        playeryt = playery
        
        'Have we hit a wall, if so, reset player to original pos.
        IF map%[playerxt,playeryt] > 0 THEN
            playerx = oldplayerx
            playery = oldplayery
        ENDIF
        
        CALL DRAWMAZE                   
    ELSEIF playeraction = 4 THEN
                
        'This is same as above
        oldplayerx = playerx
        oldplayery = playery
        
        playerx -= TCOS[pangle] / 4     'Increase X -   Was originally / 16
        playery -= TSIN[pangle] / 4     'Increase Y -   Was originally / 16
        
        playerxt = playerx
        playeryt = playery
                
        IF map%[playerxt,playeryt] > 0 THEN
            playerx = oldplayerx
            playery = oldplayery
        ENDIF
        
        CALL DRAWMAZE                   
    ELSEIF playeraction = 1 THEN
        pangle -= Angle6%               'Player turns left  
        pangle = pangle % 480
        IF pangle < 0 THEN              'wrap angles                        
            pangle = 480 + pangle
        ENDIF
        
        CALL DRAWMAZE       
    ELSEIF playeraction = 2 THEN
        pangle += Angle6%               'Player turns right     
        pangle = pangle % 480
        IF pangle < 0 THEN
            pangle = 480 + angle
        ENDIF
        
        CALL DRAWMAZE       
    ENDIF   

END SUB

