' Random Map builder - Sporadic 08/2015
' Set the SEED variable to change the map before compiling.
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
CONST SEED% = 50


basic_r_size=0
basic_r_indx=0
RLOCATE 0,210   

'particle layer         :   0
DIM sand%               :   sand=1
DIM sprwall%            :   sprwall=sand+100


'Load CLUTS
LOADCLUT(strptr(SPRITE_TILE_SAND_clut),1,16)
LOADCLUT(strptr(SPRITE_TILE_ROCK3_clut),2,16)   


'Get sprite tile graphic addresses
DIM sprwallgfx%         :   sprwallgfx=0
DIM sprfloorgfx%        :   sprfloorgfx=0
sprwallgfx=RGETOBJ(sprwall,R_sprite_gfxbase)
sprfloorgfx=RGETOBJ(sand,R_sprite_gfxbase)


'Map array to hold tile types.
dim mapsize%            :   mapsize=32
DIM map%[32,32]         :   map[32,32]


' Used to hold current tile locations/graphics and be pushed to the Powa
DIM mapx%[100]          :   mapx[100]   
DIM mapy%[100]          :   mapy[100]
DIM mapgfx%[100]        :   mapgfx[100]
DIM mapclut%[100]       :   mapclut[100]


'Misc vars
dim i%                  :   i = 0
dim loopx               :   loopx=0
dim loopy               :   loopy=0
dim viewportx%          :   viewportx=0
dim viewporty%          :   viewporty=0
dim viewportmaxx%       :   viewportmaxx=9
dim viewportmaxy%       :   viewportmaxy=9
DIM framecounter%       :   framecounter=0  
DIM pad1%               :   pad1=0  
dim buildSteps%         :   buildSteps=0
dim dir%                :   dir=0
dim px%                 :   px=0
dim py%                 :   py=0


'Viewport starting position.
viewportx = mapsize/2
viewporty = mapsize/2


randomize(SEED%)

'Work out how long to build the map for based on size.
buildSteps = (mapsize * mapsize) + 500
px = mapsize/2
py = mapsize/2

' Build the map.  Start from the middle and randomly step different directions until loop ends.
WHILE buildSteps > 0
    
    'Set current tile to be Floor graphic
    map[px,py] = 1
    
    'Pick a random direction to step
    dir = RNDRANGE(0, 4)  '0=up  1=right  2=down   3=left
    
    'move location
    if dir > 0 and dir <= 1 and py > 1 then
        py--
    elseif dir > 1 and dir <= 2 and px < mapsize-2 then
        px++
    elseif dir > 2 and dir <= 3 and py < mapsize-2 then
        py++
    elseif dir > 3 and dir <= 4 and px > 1 then
        px--
    end if

    buildSteps--
    PRINT "Building: ",buildSteps
WEND

CLS
call updatemap

'Lay the sprites out into a grid.
i=0
FOR loopx = 0 TO viewportmaxx
    FOR loopy = 0 TO viewportmaxy       
        mapx[i] = ((64+(loopx*16))<<16)
        mapy[i] = ((64+(loopy*16))<<16)         
        i++
    NEXT        
NEXT
powaset(sand,8,100,strptr(mapx))    '(8=R_sprite_x, look in raptor.h)
powaset(sand,12,100,strptr(mapy))   '(12=R_sprite_x, look in raptor.h)



'''''''''''''''''''''''''''''''''''''''
' MAIN LOOP
'''''''''''''''''''''''''''''''''''''''
DO      
    CALL move   
    
    VSYNC
    
    framecounter++      
LOOP
'''''''''''''''''''''''''''''''''''''''
' MAIN LOOP END
'''''''''''''''''''''''''''''''''''''''


'Get player input and update map graphics if movement occurred
SUB move
    IF framecounter>2 THEN  
        pad1=GETPAD(1)  
        
        IF (pad1 BAND PAD_LEFT AND viewportx>0) THEN
            viewportx--
            framecounter=0
            call updatemap
        ELSEIF (pad1 BAND PAD_RIGHT AND (viewportx+viewportmaxx)<mapsize-1) THEN
            viewportx++
            framecounter=0
            call updatemap
        ENDIF
        
        IF (pad1 BAND PAD_UP AND viewporty>0) THEN
            viewporty--
            framecounter=0
            call updatemap
        ELSEIF (pad1 BAND PAD_DOWN AND (viewporty+viewportmaxy)<mapsize-1) THEN
            viewporty++
            framecounter=0
            call updatemap
        ENDIF
        
    ENDIF   
END SUB


'Update map graphics
SUB updatemap
    i=0

    'Iterate over current viewport of 10x10 tiles and set the sprites to match
    FOR loopx = 0 TO viewportmaxx
        FOR loopy = 0 TO viewportmaxy                       
            
            if map[viewportx+loopx,viewporty+loopy] = 1 then
                mapgfx[i] = sprfloorgfx
                mapclut[i] = 1
            else                
                mapgfx[i] = sprwallgfx
                mapclut[i] = 2
            end if
                
            i++
        NEXT        
    NEXT
    
    powaset(sand,44,100,strptr(mapgfx))  '(44=R_sprite_gfxbase, look in raptor.h)
    powaset(sand,96,100,strptr(mapclut)) '(96=R_sprite_CLUT, look in raptor.h)

END SUB


'Utils
FUNCTION RNDRANGE!(low!, high!)
   
   IF (low! > high!) THEN 
     DIM t! 
     t! = low!
     low! = high!
     high! = t!
   END IF 
   
   FUNCTION = (high! - low! + 1.0) * RND + low!
 
END FUNCTION 

