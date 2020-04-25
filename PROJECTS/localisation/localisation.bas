'
' Your code goes here
' Have fun!
'
rlist=(RAPTOR_LIST *)strptr(RAPTOR_sprite_table)
basic_r_size=0
basic_r_indx=0

' This syntax enables the variables to be visible from anywhere in the source. Using something like "enum English,French,Italian" will not be global
enum
    English
    French
    Italian
end enum

' Global variable which will hold the language
dim language%

' By default, use English
language=English

' Localising one string
dim message_pressfire$[3,40] as char
message_pressfire$[English]="Press fire to start              "
message_pressfire$[French] ="Appuyez sur le feu pour commencer"
message_pressfire$[Italian]="Premi il fuoco per iniziare      "

' Localising multiple strings
enum                ' define some constants for our numbers instead of using 0,1,2,3,4
    msg_hi=0
    msg_bye
    msg_win
    msg_lose
    msg_ready
    num_messages    ' This must be at the end!
end enum

dim messages$[3,5,48] as char       ' dimension our array. It is 3 dimension, because we need languages * messages * 48 characters per message
messages$[English][msg_hi]="Hi   "  ' Fill in our messages. Notice that due to the enums we don't need to use numbers. Also we must make sure that our messages are less than 48 characters each!
messages$[French] [msg_hi]="Salut"
messages$[Italian][msg_hi]="Ciao "
messages$[English][msg_bye]="Bye      "
messages$[French] [msg_bye]="Au revoir"
messages$[Italian][msg_bye]="Addio    "
messages$[English][msg_win]="You win!    "
messages$[French] [msg_win]="Vous gagnez!"
messages$[Italian][msg_win]="Hai vinto!  "
messages$[English][msg_lose]="You lose   "
messages$[French] [msg_lose]="Tu as perdu"
messages$[Italian][msg_lose]="Hai presso "
messages$[English][msg_ready]="Get ready"
messages$[French] [msg_ready]="Sois pret"
messages$[Italian][msg_ready]="Preparati"


rlocate 0,0
rprint "Press A,B,C to switch languages"

do
    local i as short
    local j as short

    vsync
    ZEROPAD()
    if zero_left_pad band Input_Pad_C then
        language=English
    elseif zero_left_pad band Input_Pad_B then
        language=French
    elseif zero_left_pad band Input_Pad_A then
        language=Italian
    endif

    ' Print our "one string" example
    rlocate 0,16
    RPRINT message_pressfire$[language]
    
    ' Print all our "mulriple strings" example. Notice that num_messages will adjust itself if we add or remove messages.
    for i=0 to num_messages
        rlocate 0,32+8*i
        rprint messages$[language][i]
    next i
loop
