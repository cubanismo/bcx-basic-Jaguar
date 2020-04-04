' ***************************************************************************************
' *** 60fps 16-bit animated read/modify/write lolvalamp aka "metablols" *****************
' ***************************************************************************************
' *** sh3-rg / reboot 2015 **************************************************************
' ***************************************************************************************

basic_r_indx=0

LOADCLUT(strptr(BMP_SLIDER_clut),10,16)
LOADCLUT(strptr(PAL_GREEN_INK_clut),0,16)

DIM rgb_voff%   :   rgb_voff=1735
DIM rgb_von%    :   rgb_von=1991
DIM cry_voff%   :   cry_voff=1729
DIM cry_von%    :   cry_von=1985

DIM county%     :   county=0
DIM switcher%   :   switcher=1
DIM cola%       :   cola=59422

DPOKE VMODE,rgb_voff
        
DPOKE BG,cola

'************************************************************************************************************
                
REM MAIN LOOP
DO
    county++
    IF county=5 THEN
        county=0
        CALL xunt
    ENDIF
    VSYNC
LOOP

SUB xunt
    IF cola=59454 OR cola=59392 THEN
        switcher=switcher*-1
    ENDIF
    cola=cola+switcher
    DPOKE BG,cola
ENDSUB

'************************************************************************************************************
'EOF
