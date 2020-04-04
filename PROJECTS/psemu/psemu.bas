' psemu project by sh3-rg

DIM parti%      :parti=0    '  1 object     total    0
DIM stat%       :stat=1     '  1 object     total    1
DIM anim1%      :anim1=2    '  1 object     total    2
DIM stat2%      :stat2=3    '  1 object     total    3
DIM anim2%      :anim2=4    '  1 object     total    4
DIM stat3%      :stat3=5    '  1 object     total    5
DIM tr%         :tr=6       '  1 object     total    6


' *******************************************************

DIM framecounter%       :   framecounter=0
DIM count%              :   count=0
DIM count2%             :   count2=0

    SNDPLAY(0,5)
    VSYNC
    SNDPLAY(0,6)
    VSYNC
    SNDFREQ(5,22050)
    VSYNC
    SNDFREQ(6,22050)    
    VSYNC
    SNDVOL(48)
    VSYNC
    SNDVOL(48)

FOR count=0 TO 31
    DPOKE BG,((count<<11)+(count<<6)+(count<<1))
    DELAY(3)
NEXT

DPOKE BG,-1

loadclut(ROM_BMP_ANIM1_clut,0,256)

VSYNC

RSETOBJ(anim1,R_sprite_active,R_is_active)

DO UNTIL count2=37
    count2++
    DELAY(4)
LOOP

RSETOBJ(stat2,R_sprite_active,R_is_active)
    
DO
    framecounter++

    VSYNC

    IF framecounter=400 THEN
    
    RSETOBJ(stat2,R_sprite_active,R_is_inactive)
    RSETOBJ(anim2,R_sprite_active,R_is_active)
    
    ENDIF   
    
    IF framecounter=401 THEN
    DPOKE BG,0
    ENDIF
        
    IF framecounter=500 THEN
    
    RSETOBJ(anim2,R_sprite_active,R_is_inactive)
    RSETOBJ(stat3,R_sprite_active,R_is_active)
    ENDIF
    
    IF framecounter=900 THEN
    
    RSETOBJ(stat3,R_sprite_active,R_is_inactive)    
    loadclut(strptr(BMP_TR_clut),0,256)
    RSETOBJ(tr,R_sprite_y,0)
    
    ENDIF
    
LOOP



