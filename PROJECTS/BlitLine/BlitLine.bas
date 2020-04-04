'
' BlitterLine Example
' Uses the Raptor Blitterlist command to draw directly onto a sprite.
' Sprite and blitter commands are all 16bit graphics.
' Sporadic 2015
'
rlist=(RAPTOR_LIST *)strptr(RAPTOR_sprite_table)
basic_r_size=0
basic_r_indx=0

DIM particles%			:	particles=0
DIM canvasSpr%			:	canvasSpr=1

'Get location of canvas sprite graphics
DIM gfxcanvas%			:	gfxcanvas=rlist[canvasSpr].gfxbase

'2d Array to hold blitter commands
DIM blitlist%[131,9]	:	blitlist[131,9]

'Other vars
DIM x%					:	x=0
DIM xmod%				:	xmod=2
DIM y%					:	y=0
DIM linecolour%			:	linecolour=200
DIM width%				:	width=100
DIM height%				:	height=1

'Set up blitter list of commands
FOR y = 0 TO 130
	blitlist[y,0] = gfxcanvas								'Destination gfx
	blitlist[y,1] = PIXEL16|XADDPIX|WID320|PITCH1			'Destination Blitter flags
	blitlist[y,2] = (y<<16)+x								'Start Pixel - NOTE: y then x
	blitlist[y,3] = 0					
	blitlist[y,4] = 0
	blitlist[y,5] = 0					
	blitlist[y,6] = (width<<16)+height						'Number of pixels to write
	blitlist[y,7] = linecolour+y								'Colour of pixels to write
	blitlist[y,8] = PATDSEL									'Blitter commands
NEXT y

'Last item in the array must end in -1
blitlist[130,0] = -1
	

'Main loop
DO
	vsync

	'Pass array of blitter commands to Raptor for processing
	powablitlist(strptr(blitlist))	
	
	'Cycle base colour
	linecolour+=12
	
	'Move lines horizontally
	x+=xmod
	IF x > 70 OR x < 0 THEN
		xmod = xmod*-1			'If reached edge, go back other way
		x+=xmod	
	ENDIF
	
	'Clear Sprite destination
	blitlist[0,0] = gfxcanvas
	blitlist[0,1] = PIXEL16|XADDPIX|WID320|PITCH1
	blitlist[0,2] = 0
	blitlist[0,6] = (320<<16)+130
	blitlist[0,7] = 0
	blitlist[0,8] = PATDSEL
		
	'Update blitter list (don't have to update variables that haven't changed)
	FOR y = 1 TO 130
		blitlist[y,0] = gfxcanvas
		blitlist[y,2] = (y<<16)+x		
		blitlist[y,6] = ((width+y)<<16)+height
		blitlist[y,7] = linecolour+y*3
	NEXT y
	blitlist[130,0] = -1
LOOP