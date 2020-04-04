' superlame chessboard w/spidey

DIM i%          :   i=0
DIM j%          :   j=0
DIM ticker%     :   ticker=0
DIM jagpad_1%   :   jagpad_1=0
DIM spideymove1%    :   spideymove1=0
DIM spideymove2%    :   spideymove2=0
DIM spideymove3%    :   spideymove3=0
DIM spideymove4%    :   spideymove4=0
DIM spideymove5%    :   spideymove5=0
DIM spideymove6%    :   spideymove6=0
DIM spideymove7%    :   spideymove7=0
DIM spideymove8%    :   spideymove8=0
DIM spideymove9%    :   spideymove9=0
LOADCLUT(strptr(BMP_SPIDEY_clut),0,16)
LOADCLUT(strptr(BMP_PRESS_A_clut),1,16)
LOADCLUT(strptr(BMP_WIN_clut),2,16)


DO
    CALL manage_vbl
    
    CALL read_pad

LOOP UNTIL jagpad_1 BAND Input_Pad_A


        RSETOBJ(10,R_sprite_active,R_is_inactive)
        RSETOBJ(11,R_sprite_y,0)
        SNDZEROPLAY(1, strptr(SPIDEYMUSIC), (strptr(SPIDEYMUSIC_end)-strptr(SPIDEYMUSIC)+3) and 0xfffffffc, 46168/15389, Zero_Audio_8bit_muLaw|Zero_Audio_Looping)
    
    CALL tons_of_updates
        RSETOBJ(11,R_sprite_y,252<<16)
    CALL tons_of_updates
        RSETOBJ(11,R_sprite_y,0<<16)
    CALL tons_of_updates
        RSETOBJ(11,R_sprite_y,252<<16)
    CALL tons_of_updates
        RSETOBJ(11,R_sprite_y,0<<16)
    CALL tons_of_updates
        RSETOBJ(11,R_sprite_y,252<<16)
    CALL tons_of_updates
    CALL tons_of_updates
    CALL tons_of_updates
    CALL tons_of_updates

FOR i=1 TO 7 STEP 2
    RSETOBJ(i,R_sprite_active,R_is_active)
    RSETOBJ(i+1,R_sprite_active,R_is_active)
    CALL tons_of_updates
    CALL tons_of_updates
NEXT i

    RSETOBJ(9,R_sprite_active,R_is_active)
    CALL tons_of_updates
DO
    CALL manage_vbl
    CALL read_pad
    
    IF jagpad_1 BAND Input_Pad_Left THEN
        spideymove1=RGETOBJ(1,R_sprite_x)
        spideymove2=RGETOBJ(2,R_sprite_x)
        spideymove3=RGETOBJ(3,R_sprite_x)
        spideymove4=RGETOBJ(4,R_sprite_x)
        spideymove5=RGETOBJ(5,R_sprite_x)
        spideymove6=RGETOBJ(6,R_sprite_x)
        spideymove7=RGETOBJ(7,R_sprite_x)
        spideymove8=RGETOBJ(8,R_sprite_x)
        spideymove9=RGETOBJ(9,R_sprite_x)
        RSETOBJ(1,R_sprite_x,spideymove1-(1<<12))
        RSETOBJ(2,R_sprite_x,spideymove2-(1<<12))
        RSETOBJ(3,R_sprite_x,spideymove3-(1<<13))
        RSETOBJ(4,R_sprite_x,spideymove4-(1<<13))
        RSETOBJ(5,R_sprite_x,spideymove5-(1<<14))
        RSETOBJ(6,R_sprite_x,spideymove6-(1<<14))
        RSETOBJ(7,R_sprite_x,spideymove7-(1<<15))
        RSETOBJ(8,R_sprite_x,spideymove8-(1<<15))
        RSETOBJ(9,R_sprite_x,spideymove9-(1<<16))
    ENDIF
    IF jagpad_1 BAND Input_Pad_Right THEN
        spideymove1=RGETOBJ(1,R_sprite_x)
        spideymove2=RGETOBJ(2,R_sprite_x)
        spideymove3=RGETOBJ(3,R_sprite_x)
        spideymove4=RGETOBJ(4,R_sprite_x)
        spideymove5=RGETOBJ(5,R_sprite_x)
        spideymove6=RGETOBJ(6,R_sprite_x)
        spideymove7=RGETOBJ(7,R_sprite_x)
        spideymove8=RGETOBJ(8,R_sprite_x)
        spideymove9=RGETOBJ(9,R_sprite_x)
        RSETOBJ(1,R_sprite_x,spideymove1+(1<<12))
        RSETOBJ(2,R_sprite_x,spideymove2+(1<<12))
        RSETOBJ(3,R_sprite_x,spideymove3+(1<<13))
        RSETOBJ(4,R_sprite_x,spideymove4+(1<<13))
        RSETOBJ(5,R_sprite_x,spideymove5+(1<<14))
        RSETOBJ(6,R_sprite_x,spideymove6+(1<<14))
        RSETOBJ(7,R_sprite_x,spideymove7+(1<<15))
        RSETOBJ(8,R_sprite_x,spideymove8+(1<<15))
        RSETOBJ(9,R_sprite_x,spideymove9+(1<<16))
    ENDIF
    IF jagpad_1 BAND Input_Pad_Up THEN
        spideymove1=RGETOBJ(1,R_sprite_y)
        spideymove2=RGETOBJ(2,R_sprite_y)
        spideymove3=RGETOBJ(3,R_sprite_y)
        spideymove4=RGETOBJ(4,R_sprite_y)
        spideymove5=RGETOBJ(5,R_sprite_y)
        spideymove6=RGETOBJ(6,R_sprite_y)
        spideymove7=RGETOBJ(7,R_sprite_y)
        spideymove8=RGETOBJ(8,R_sprite_y)
        spideymove9=RGETOBJ(9,R_sprite_y)
        RSETOBJ(1,R_sprite_y,spideymove1-(1<<12))
        RSETOBJ(2,R_sprite_y,spideymove2-(1<<12))
        RSETOBJ(3,R_sprite_y,spideymove3-(1<<13))
        RSETOBJ(4,R_sprite_y,spideymove4-(1<<13))
        RSETOBJ(5,R_sprite_y,spideymove5-(1<<14))
        RSETOBJ(6,R_sprite_y,spideymove6-(1<<14))
        RSETOBJ(7,R_sprite_y,spideymove7-(1<<15))
        RSETOBJ(8,R_sprite_y,spideymove8-(1<<15))
        RSETOBJ(9,R_sprite_y,spideymove9-(1<<16))
    ENDIF
    IF jagpad_1 BAND Input_Pad_Down THEN
        spideymove1=RGETOBJ(1,R_sprite_y)
        spideymove2=RGETOBJ(2,R_sprite_y)
        spideymove3=RGETOBJ(3,R_sprite_y)
        spideymove4=RGETOBJ(4,R_sprite_y)
        spideymove5=RGETOBJ(5,R_sprite_y)
        spideymove6=RGETOBJ(6,R_sprite_y)
        spideymove7=RGETOBJ(7,R_sprite_y)
        spideymove8=RGETOBJ(8,R_sprite_y)
        spideymove9=RGETOBJ(9,R_sprite_y)
        RSETOBJ(1,R_sprite_y,spideymove1+(1<<12))
        RSETOBJ(2,R_sprite_y,spideymove2+(1<<12))
        RSETOBJ(3,R_sprite_y,spideymove3+(1<<13))
        RSETOBJ(4,R_sprite_y,spideymove4+(1<<13))
        RSETOBJ(5,R_sprite_y,spideymove5+(1<<14))
        RSETOBJ(6,R_sprite_y,spideymove6+(1<<14))
        RSETOBJ(7,R_sprite_y,spideymove7+(1<<15))
        RSETOBJ(8,R_sprite_y,spideymove8+(1<<15))
        RSETOBJ(9,R_sprite_y,spideymove9+(1<<16))
    ENDIF
LOOP


SUB manage_vbl
    ticker++

    IF ticker=32 THEN
        ticker=0
        RSETOBJ(0,R_sprite_x,-32<<16)
        RSETOBJ(0,R_sprite_y,0)
    ENDIF
    
    VSYNC

END SUB


SUB tons_of_updates

    FOR j=1 TO 36
        CALL manage_vbl
    NEXT j
END SUB

SUB read_pad


    ZEROPAD()
    jagpad_1=zero_left_pad
    
    
END SUB


