'
' Multiple Highscore example code. Uses Raptor's internal highscore routines
' plus Memory Track saves.
' Remember: Raptor saves scores internally from highest to lowest!
' This example tests multiple scoreboards by saving a score to each board and then paging through them with DPAD

basic_r_size=0
basic_r_indx=1

dim i as short
dim j as short
dim name$
dim srcname%,dstname%
dim eeprom_present%=0
DIM tableCounter AS INTEGER
DIM tickcounter AS INTEGER
DIM pad1%               :   pad1=0

'variables to point to the scoreboards we will use
dim highscoreBoard as integer ptr
dim highscoreNames as integer
dim highscoreBoardNumber as integer

call setScoreboard(0)	


'
' If MT is present then check if scores were loaded.
' Otherwise check for EEPROM and if that fails
' populate the table with default values
'
if raptor_mt_present<0 then     'no MT?

	'
	' Check for EEPROM 
	' 
	eeprom_present=powaeeprom(1,highscoreBoard)
	if eeprom_present=1 then
		'Checksum error, let's write some default values to EEPROM
    	call createDefaultScores
		'write them
		powaeeprom(0,highscoreBoard)
		'read them back
		eeprom_present=powaeeprom(1,highscoreBoard)
	endif

	if eeprom_present<>0 then
		'
		' Read error, use default values
		'
		RLOCATE 160,0
   		RPRINT "No MT/EE detected!"
		
		call createDefaultScores
    	
	else
		'
		' Read ok, print saved
		'
	    RLOCATE 160,0
	    RPRINT "EEPROM detected!"

	endif
else
    RLOCATE 160,0
    RPRINT "MT detected!"

	'
	' highscoreBoard indices 31 to 127 inclusive can be used to store user data.
	'
	rlocate 0,25*8
	print "Saved value:",highscoreBoard[31]

	'
	' Set a user value to be read next time (provided scores will be saved to MT)
	'
	highscoreBoard[31]=123456789

endif



'Save a score to each board.
saveScore("Player 1", 111, 0)
saveScore("Player 2", 222, 1)
saveScore("Player 3", 333, 2)
saveScore("Player 4", 444, 3)
saveScore("Player 5", 555, 4)

tickcounter = 0
tableCounter = 0

RLOCATE 0,210
PRINT "SCOREBOARD ";tableCounter;" -DPAD LEFT/RIGHT TO VIEW"


do

	vsync
	
	'Look for input and page through each scoreboard
	pad1=GETPAD(1)
	IF (pad1 BAND PAD_RIGHT) Then
		tableCounter++
		
		IF tableCounter > 4 Then
			tableCounter = 0
		ENDIF
		
		delay(20)
		CLS
		
		RLOCATE 0,210
		PRINT "SCOREBOARD ";tableCounter;" -DPAD LEFT/RIGHT TO VIEW"
		
	ELSEIF (pad1 BAND PAD_LEFT) Then
		tableCounter--
		
		IF tableCounter < 0 Then
			tableCounter = 4
		ENDIF
		
		delay(20)
		CLS
		
		RLOCATE 0,210
		PRINT "SCOREBOARD ";tableCounter;" -DPAD LEFT/RIGHT TO VIEW"
		
	ENDIF	
	
	'display the current selected scoreboard
	displayScoreboard(tableCounter)

loop


'set up default names and scores
sub createDefaultScores
	
	for tableCounter = 0 TO 4
		call setScoreboard(tableCounter)

		for i=0 to 9
			highscoreBoard[i]=(9-i)*100
			
			poke (highscoreNames + (8*i)),ASC("R")		'fill in dummy name
			poke (highscoreNames + (8*i) + 1),ASC("B")	
			poke (highscoreNames + (8*i) + 2),ASC("+")	
			poke (highscoreNames + (8*i) + 3),0			'must terminate with 0 for PRINT
		next i

	next tableCounter
	
end sub


'set the pointer variables to the name and score tables depending on the table in use
sub setScoreboard(scoreboardToUse%)
	if scoreboardToUse = 0 then
		highscoreBoard = raptor_highscores1_hex
		highscoreNames = (int)strptr(raptor_highscores1_nam[0])
		highscoreBoardNumber = 0	
	elseif scoreboardToUse = 1 then
		highscoreBoard = raptor_highscores2_hex
		highscoreNames = (int)strptr(raptor_highscores2_nam[0])
		highscoreBoardNumber = 1
	elseif scoreboardToUse = 2 then
		highscoreBoard = raptor_highscores3_hex
		highscoreNames = (int)strptr(raptor_highscores3_nam[0])
		highscoreBoardNumber = 2
	elseif scoreboardToUse = 3 then
		highscoreBoard = raptor_highscores4_hex
		highscoreNames = (int)strptr(raptor_highscores4_nam[0])
		highscoreBoardNumber = 3
	elseif scoreboardToUse = 4 then
		highscoreBoard = raptor_highscores5_hex
		highscoreNames = (int)strptr(raptor_highscores5_nam[0])
		highscoreBoardNumber = 4		
	endif	
endif

'display the scores for the requested scoreboard
sub displayScoreboard(scoreboardToUse%)

	call setScoreboard(scoreboardToUse)
	
	dstname=(int)strptr(name$)  'address of name$
	mid$(name$,9,1)=""          'name is 8 characters, so make the 9nth a zero (for print)
		
	for i=0 to 9                                            'now, display the modified table
		RLOCATE 0,8*10+8+8+8+i*8
		
		srcname = highscoreNames + (8*i)	
		lpoke dstname,lpeek(srcname)                        'copy first 4 characters to name$
		lpoke dstname+4,lpeek(srcname+4)                    'copy last 4 characters to name$
		PRINT "#";i;" - ";name$;" -";highscoreBoard[i]
	next i	

end sub

'save the score details and commit changes to eeprom/MT
sub saveScore(playername$, playerscore%, scoreboardToUse%)

	call setScoreboard(scoreboardToUse)

	name$ = playername$                                        'the name we're going to inject to the table
	if hiscore_check(playerscore%,name$,highscoreBoardNumber) > 0 then                      'check for highscore and inject score + name
		call hiscore_sort(highscoreBoardNumber)                               'if we have a highscore, then sort the table
	endif		
	
	'
	' Save scores to MT if present
	'
	RLOCATE 0,8*10+8+8+8+10*8+8
	if raptor_mt_present<0 then     'no MT?
		if eeprom_present<>0 then
			RPRINT "No MT/EE detected, so no scores saved!"
		else
			eeprom_present=powaeeprom(0,highscoreBoard)
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

end sub






