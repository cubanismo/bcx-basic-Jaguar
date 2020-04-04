'
' Horizontal Image scroller.  Handy for game backdrop scrolling.
' Sporadic 2016
'
' How it works: Smooth scroll the sprite by 16 pixels.
'				After that, move the Gfx base address on by a 16 pixel chunk and reset the sprite back to the start position.
'				Carry on smooth scrolling the sprite and repeat the above.
' Note: 		The background image is 8 bit which is why we add 16 to the base address. If it was 4 bit, then only add 8 to the base address.


rlist=(RAPTOR_LIST *)strptr(RAPTOR_sprite_table)
basic_r_indx=0
basic_r_size=0


'Object list
dim particleLayerObject as integer		:	particleLayerObject 	= 0
dim backgroundObject as integer			:	backgroundObject 		= 1

'Load CLUT
LOADCLUT(strptr(BACKGROUND_clut),0,256)

'Other variables
DIM pad1 			AS INTEGER	: pad1=0
DIM scrollX 		AS INTEGER
DIM scrollXmax 		AS INTEGER
DIM backgroundGfx 	AS INTEGER

'Scroll Max is the total distance right the image can scroll before seeing a loop (in 16 pixel chunks)
scrollXmax = 55*16
scrollX = 0

'Background sprite start position
rlist[backgroundObject].x = -16<<16

'Get base address of the background sprite graphic before any changes are made.
backgroundGfx = rlist[backgroundObject].gfxbase


DO

	pad1=GETPAD(1)	
	IF pad1 BAND PAD_LEFT AND scrollX > 0 THEN
		rlist[backgroundObject].x += (1<<16)								'Smooth scroll the background sprite.		
		IF rlist[backgroundObject].x > -1<<16 THEN							'When it has moved 16 pixels, reset sprite position and bump the graphic by 16 pixels.		
			scrollX -= 16													'track how far scrolled in 16 pixel chunks.		
			rlist[backgroundObject].gfxbase = backgroundGfx + scrollX		'Move(scroll) then graphic address by the amount scrolled.	
			rlist[backgroundObject].x = -16<<16								'Reset the position of the sprite ready to smooth scroll the next 16 pixels.
		ENDIF
	ELSEIF pad1 BAND PAD_RIGHT AND scrollX < scrollXmax THEN		
		rlist[backgroundObject].x -= (1<<16)								'Same as above but going the other way.
		IF rlist[backgroundObject].x < -15<<16 THEN			
			scrollX += 16			
			rlist[backgroundObject].gfxbase = backgroundGfx + scrollX		'We are still adding the scrolled amount of 16 pixel chunks on to the base address	
			rlist[backgroundObject].x = 0<<16			
		ENDIF
	ENDIF
	
	VSYNC																	'Update screen
	
LOOP

