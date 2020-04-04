REM switching raptor lists
DIM frcount: frcount=0
basic_r_indx=0
basic_r_size=0

loadclut(strptr(BMP_PLAYER_clut),1,16)
loadclut(strptr(BMP_ENEMY_clut),2,16)

do
    frcount++
    
    PRINT "     "
    
    IF frcount=120 THEN 
        call listswitch1
    ENDIF
    
    IF frcount=240 THEN
        call listswitch0
        frcount=0
    ENDIF
    
    DPOKE BG,frcount*64
    
    VSYNC
loop

SUB listswitch1
    VSYNC
    RSETLIST(1)
END SUB

SUB listswitch0
    VSYNC
    RSETLIST(0)
END SUB




