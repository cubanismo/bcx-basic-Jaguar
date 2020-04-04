'
' Your code goes here
' Have fun!
'
basic_r_indx=1
basic_r_size=1
RLOCATE 0,202
RPRINT "       RAPTOR BASIC+ v0.1 - REBOOT      "
basic_r_size=0
basic_r_indx=0
RLOCATE 0,218
RPRINT "        Derived from BCX BASIC v6       "

dim text as char ptr
dim current_letter as integer
dim length as integer
dim current_object as integer
text="HELLO THIS IS A QUICK TEST TO SEE IF THE SCROLLER WORKS       HAVE FUN       "
length=len(text)                                                                                  ' string's length
current_letter=12                                                                                 ' next letter of the text going to be shown
current_object=1                                                                                  ' next object going to go off screen
dim i as integer
dim j as integer
dim fontstart
fontstart=(int)strptr(font)

'
' First letter
'
rsetobj(1,R_sprite_x,352<<16)                                                                     ' set letter's initial x
if text[0]<>32 then                                                                               ' anything but space?
    rsetobj(1,R_sprite_gfxbase,fontstart+(text[0]-65)*32*32*2)                                    ' set letter gfx
else
    rsetobj(1,R_sprite_gfxbase,fontstart+26*32*32*2)                                              ' set space
endif
rsetobj(1,R_sprite_active,R_is_active)                                                            ' activate the object
' 
' Rest of the letters
' 
for j=2 to 12
    for i=1 to 32
        vsync
    next i
    rsetobj(j,R_sprite_x,352<<16)                                                                 ' set letter's initial x
    if text[j-1]<>32 then                                                                         ' anything but space?
        rsetobj(j,R_sprite_gfxbase,fontstart+(text[j-1]-65)*32*32*2)                              ' set letter gfx
    else
        rsetobj(j,R_sprite_gfxbase,fontstart+26*32*32*2)                                          ' set space
    endif
    rsetobj(j,R_sprite_active,R_is_active)                                                        ' activate the object
next j

'
' Main
'
        
do
    vsync
    print rgetobj(current_object,R_sprite_x)>>16
    if rgetobj(current_object,R_sprite_x)=(-32)<<16 then                                          ' object out of visibility yet?
        rsetobj(current_object,R_sprite_x,352<<16)                                                ' yes, reset its position
        if (char)text[current_letter]<>32 then                                                    ' anything but space?
            rsetobj(current_object,R_sprite_gfxbase,fontstart+(text[current_letter]-65)*32*32*2)  ' set next letter's gfx
        else
            rsetobj(current_object,R_sprite_gfxbase,fontstart+26*32*32*2)                         ' set space
        endif
        rsetobj(current_object,R_sprite_active,R_is_active)                                       ' activate the object
        current_object=(current_object % 12)+1                                                    ' calculate next object going to wrap
        current_letter=current_letter+1                                                           ' next letter from the text
        if current_letter=length then                                                             ' reached the end of the text?
            current_letter=0                                                                      ' yes, reset the pointer
        endif
    endif
loop
