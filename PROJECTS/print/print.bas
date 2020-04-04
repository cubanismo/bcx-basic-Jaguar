dim paddy as LONG
basic_r_indx=0
basic_r_size=0
paddy=32
RLOCATE 10,10
RPRINT "helloooooooooooooooo!"
rlocate 10,50
print "hiya! ",paddy," belloooo ",123.237462376
RLOCATE 30,100
RPRINT "Press joypad stuff and see numbers!"

dim a$
a$="zzzzzzzz"
bin2asc(567,3,a$)
rlocate 0,24
rprint a$

RLOCATE 10,120

do
'   paddy=getpad(1)
        ZEROPAD()
        paddy=zero_left_pad
        a$=""

        if paddy band Input_Pad_Pause then
            a$=a$+"Meow! "
        endif
        if paddy band Input_Pad_A then
            a$=a$+"A "
        endif
        if paddy band Input_Pad_Up then
            a$=a$+"Oop "
        endif
        if paddy band Input_Pad_Down then
            a$=a$+"Down "
        endif
        if paddy band Input_Pad_Left then
            a$=a$+"Left "
        endif
        if paddy band Input_Pad_Right then
            a$=a$+"Roit "
        endif
        if paddy band Input_Pad_C1 then
            a$=a$+"C1 "
        endif
        if paddy band Input_Pad_B then
            a$=a$+"B "
        endif
        if paddy band Input_Pad_Star then
            a$=a$+"You're a star "
        endif
        if paddy band Input_Pad_7 then
            a$=a$+"7 "
        endif
        if paddy band Input_Pad_4 then
            a$=a$+"4 "
        endif
        if paddy band Input_Pad_1 then
            a$=a$+"1 "
        endif
        if paddy band Input_Pad_C2 then
            a$=a$+"C2 "
        endif
        if paddy band Input_Pad_C then
            a$=a$+"C "
        endif
        if paddy band Input_Pad_0 then
            a$=a$+"Zerosquare! "
        endif
        if paddy band Input_Pad_8 then
            a$=a$+"8 "
        endif
        if paddy band Input_Pad_5 then
            a$=a$+"5 "
        endif
        if paddy band Input_Pad_2 then
            a$=a$+"2 "
        endif
        if paddy band Input_Pad_C3 then
            a$=a$+"C3 "
        endif
        if paddy band Input_Pad_Option then
            a$=a$+"Opt "
        endif
        if paddy band Input_Pad_Sharp then
            a$=a$+"# "
        endif
        if paddy band Input_Pad_9 then
            a$=a$+"9 "
        endif
        if paddy band Input_Pad_6 then
            a$=a$+"6 "
        endif
        if paddy band Input_Pad_3 then
            a$=a$+"3 "
        endif
        a$=a$+space$(39-len(a$))
    PRINT a$
    rupdall(0)
loop

