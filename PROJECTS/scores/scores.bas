'
' Highscore example code. Uses Raptor's internal highscore routines
' plus Memory Track saves.
' Remember: Raptor saves scores internally from highest to lowest!
'
dim i as short
dim j as short
dim name$
dim srcname%,dstname%
basic_r_size=0
dim eeprom_present%=0

'
' If MT is present then check if scores were loaded.
' Otherwise check for EEPROM and if that fails
' populate the table with default values
'
basic_r_indx=1
if raptor_mt_present<0 then     'no MT?

	'
	' Check for EEPROM 
	' 
	eeprom_present=powaeeprom(1,raptor_highscores_hex)
	if eeprom_present=1 then
		'Checksum error, let's write some default values to EEPROM
    	for i=0 to 9
        	raptor_highscores_hex[i]=(9-i)*100
    	next i
		'write them
		powaeeprom(0,raptor_highscores_hex)
		'read them back
		eeprom_present=powaeeprom(1,raptor_highscores_hex)
	endif

	if eeprom_present<>0 then
		'
		' Read error, use default values
		'
		RLOCATE 160,0
   		RPRINT "No MT/EE detected!"
    	for i=0 to 9
        	raptor_highscores_hex[i]=(9-i)*100
    	next i
	else
		'
		' Read ok, print saved
		'
	    RLOCATE 160,0
	    RPRINT "EEPROM detected!"
	
		rlocate 0,25*8
		basic_r_indx=1

	endif
else
    RLOCATE 160,0
    RPRINT "MT detected!"

	'
	' raptor_highscores_hex indices 31 to 127 inclusive can be used to store user data.
	'
	rlocate 0,25*8
	basic_r_indx=1
	print "Saved value:",raptor_highscores_hex[31]

	'
	' Set a user value to be read next time (provided scores will be saved to MT)
	'
	raptor_highscores_hex[31]=123456789

endif


'
' Print initial scores
'
RLOCATE 0,0
RPRINT "Initial table:"
basic_r_indx=0

dstname=(int)strptr(name$)  'address of name$
mid$(name$,9,1)=""          'name is 8 characters, so make the 9nth a zero (for print)

for i=0 to 9
    RLOCATE 0,8+i*8

    srcname=(int)strptr(raptor_highscores_nam[9-i]);    'address of highscore name
    lpoke dstname,lpeek(srcname)                        'copy first 4 characters to name$
    lpoke dstname+4,lpeek(srcname+4)                    'copy last 4 characters to name$
    PRINT "#";i;" - ";name$;" -";raptor_highscores_hex[9-i]
next i

'
' Introduce a score of 432 and resort the table
'
basic_r_indx=1
RLOCATE 0,8*10+8+8
RPRINT "After a highscore of 432 points:"
basic_r_indx=0
name$="I WON!!!"                                        'the name we're going to inject to the table
if hiscore_check(432,name$,0)>0 then                    'check for highscore and inject score + name
    call hiscore_sort(0)                                'if we have a highscore, then sort the table
endif
for i=0 to 9                                            'now, display the modified table
    RLOCATE 0,8*10+8+8+8+i*8

    srcname=(int)strptr(raptor_highscores_nam[9-i]);    'address of highscore name
    lpoke dstname,lpeek(srcname)                        'copy first 4 characters to name$
    lpoke dstname+4,lpeek(srcname+4)                    'copy last 4 characters to name$
    PRINT "#";i;" - ";name$;" -";raptor_highscores_hex[9-i]
next i

'
' Save scores to MT if present
'
basic_r_indx=1
RLOCATE 0,8*10+8+8+8+10*8+8
if raptor_mt_present<0 then     'no MT?
	if eeprom_present<>0 then
    	RPRINT "No MT/EE detected, so no scores saved!"
	else
		eeprom_present=powaeeprom(0,raptor_highscores_hex)
		if eeprom_present=0 then
			RPRINT "EEPROM detected, scores saved!"
		else
			RPRINT "EEPROM detected, save fail!"
		endif
	endif
else
    call RAPTOR_mt_save
    RPRINT "Memory Track detected, scores saved!"
endif

