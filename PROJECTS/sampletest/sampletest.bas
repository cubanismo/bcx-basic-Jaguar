'
' Your code goes here
' Have fun!
'
rlist=(RAPTOR_LIST *)strptr(RAPTOR_sprite_table)
basic_r_indx=1
basic_r_size=1
RLOCATE 0,202
RPRINT "          RAPTOR BASIC+ - REBOOT        "
basic_r_size=0
basic_r_indx=0
RLOCATE 0,218
RPRINT "        Derived from BCX BASIC v6       "

dim i,j
j=0

do

    SNDPLAY(0,5)
    SNDFREQ(5,12000)
    SNDPLAY(1,6)
    SNDFREQ(6,12000)
    vsync
    SNDPLAY(0,5)
    SNDFREQ(5,12000)
    SNDPLAY(1,6)
    SNDFREQ(6,12000)


    for i=1 to 100
        vsync
    next i
    
    print j
    j++
loop
