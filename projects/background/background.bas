'
' Your code goes here
' Have fun!
'
rlist=(RAPTOR_LIST *)strptr(RAPTOR_sprite_table)
basic_r_indx=1
basic_r_size=2
RLOCATE 0,50
RPRINT "Text overlay example"
RLOCATE 0,80
RPRINT "4 different pictures"
RLOCATE 0,110
RPRINT " text still visible"
RLOCATE 0,140
RPRINT "  Look at rapinit.s"
RLOCATE 0,170
RPRINT " and background.bas"


dim i as short

loadclut(strptr(back1_clut),0,16)
rlist[0].y=16<<16

do
    for i=0 to 59
    vsync
    next i

    loadclut(strptr(back2_clut),0,16)
    rlist[1].y=16<<16
    rlist[0].y=700<<16

    for i=0 to 59
    vsync
    next i

    loadclut(strptr(back3_clut),0,16)
    rlist[2].y=16<<16
    rlist[1].y=700<<16
    
    for i=0 to 59
    vsync
    next i

    loadclut(strptr(back4_clut),0,16)
    rlist[3].y=16<<16
    rlist[2].y=700<<16

    for i=0 to 59
    vsync
    next i

    loadclut(strptr(back1_clut),0,16)
    rlist[0].y=16<<16
    rlist[3].y=700<<16

loop

