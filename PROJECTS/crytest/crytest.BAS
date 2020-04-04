' ***************************************************************************************
' *** 60fps 16-bit animated read/modify/write lolvalamp aka "metablols" *****************
' ***************************************************************************************
' *** sh3-rg / reboot 2015 **************************************************************
' ***************************************************************************************

basic_r_indx=0

LOADCLUT(strptr(BMP_SLIDER_clut),10,16)


DIM rgb_voff%   :   rgb_voff=1735
DIM rgb_von%    :   rgb_von=1991
DIM cry_voff%   :   cry_voff=1729
DIM cry_von%    :   cry_von=1985

DIM switcher%   :   switcher=2
DIM cola%       :   cola=800

DIM pie!: pie=3.1415926535897932384626433832795
DIM rads!: rads=(pie/180)

REM INIT
DIM i%          : i=0
DIM sinz![360]
DIM sins%[1080]
FOR i=0 to 359
    sinz[i]=(sin(i*rads))*40
    sins[i]=(int)INT(sinz[i])
    sins[i+360]=sins[i]
    sins[i+720]=sins[i]
NEXT

DIM eckz%                       : eckz=0
DIM eckz2%                      : eckz2=0
DIM eckz3%                      : eckz3=0
DIM eckz4%                      : eckz4=0
DIM why%                        : why=0
DIM why2%                       : why2=0
DIM why3%                       : why3=0
DIM why4%                       : why4=0
DIM shifter%                    : shifter=0
DIM shifty%                     : shifty=90

DIM changer%                    : changer=1
DIM offset%                     : offset=1

'************************************************************************************************************


DPOKE VMODE,rgb_voff
        
DPOKE BG,cola

'************************************************************************************************************
                
REM MAIN LOOP
DO
        CALL circs
        shifter++
        shifty++    

        CALL spiral
        
        IF shifter=360 THEN
            shifter=0
            shifty=90
        ENDIF
    VSYNC
LOOP

SUB circs
                    eckz=sins[shifter+offset]
                    eckz2=sins[shifty+offset]
                    eckz3=sins[shifter]
                    eckz4=sins[shifty]
                    why=sins[360+shifter-offset]
                    why2=sins[360+shifty-offset]
                    why3=sins[180+shifter]
                    why4=sins[180+shifty]
                
                    RSETOBJ(1,R_sprite_x,120+eckz<<16)
                    RSETOBJ(1,R_sprite_y,64+eckz2<<16)
                
                    RSETOBJ(2,R_sprite_x,120+eckz3<<16)
                    RSETOBJ(2,R_sprite_y,64+eckz4<<16)
                
                    RSETOBJ(3,R_sprite_x,120+why<<16)
                    RSETOBJ(3,R_sprite_y,64+why2<<16)
                    
                    RSETOBJ(4,R_sprite_scale_x,offset)
                    RSETOBJ(4,R_sprite_scale_y,offset)
                    RSETOBJ(4,R_sprite_x,182-(offset*2)<<16)
                    RSETOBJ(4,R_sprite_y,124-(offset*2)<<16)
                    
                    RSETOBJ(5,R_sprite_x,120+why3<<16)
                    RSETOBJ(5,R_sprite_y,64+why4<<16)
                    RSETOBJ(6,R_sprite_x,120+(why3)<<16)
                    RSETOBJ(6,R_sprite_y,64+(why4)<<16)
                
END SUB

SUB spiral
                    IF shifter % 2= 0 THEN
                        offset=offset+changer
                        IF offset=60 or offset=0 THEN
                            changer=changer*-1
                        ENDIF
                    ENDIF
ENDSUB
                    

'************************************************************************************************************
'EOF
