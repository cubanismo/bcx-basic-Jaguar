
basic_r_size=0	' small size
basic_r_indx=0	' first font

'********** dependencies **********
rlist=(RAPTOR_LIST *)strptr(RAPTOR_sprite_table)	'faster way of reading object list variable rather than using rsetobj / rgetobj,  this must be defined to use the rlist command.


'object dimension list	(exported from Omfs Object List Editor	(http://atariage.com/forums/topic/233057-raptor-list-designer/)
dim bucket as integer								:	bucket = 0					'specify bucket as object 0 (in the object list)
dim textparticlelayer as integer					:	textparticlelayer = 1		'specify the text / particle layer as object 1 (in the object list)

'********** variables **********
dim xpos as integer		'define the xpos variable as an integer






'********** start of main program **********
LOADCLUT (strptr(BUCKET_clut), 0, 16)	' load the colours of the bucket sprite in to clut space 0 (0 must match the clut number defined in rapinit.s for the specified object)

'to use the zeroplayer you need to change the parameter "player equ 1      ;0=Zerosquares player, 1=U-235 player" to "player equ 0      ;0=Zerosquares player, 1=U-235 player" in the rapapp.s file
call Input_SetRotaryMode()		' tell zeroplayer that we want to use rotary mode
call Input_SetJoyPort2()		' tell zeroplayer we want to use the rotary pad in port 2 of the jaguar


do	'main program loop
	ZEROPAD ()	'check the padfor movement
	xpos = rlist [bucket].x		'get the current x value of the sprite and put it into the xpos variables
	
	xpos = xpos - (zero_rotary_delta << 19)		'calculate the new x position value of the bucket sprite based uppon the rotary movemenet detected
	
	rlist [bucket].x = xpos		'update the x position of the bucket sprite with the new value previously calculated
	rlist 
	vsync	'let raptor do its thing and update the screen
loop	' finish main program loop
