'
' Your code goes here
' Have fun!
'
basic_r_indx=0
basic_r_size=0

rlist=(RAPTOR_LIST *)strptr(RAPTOR_sprite_table)

$include "odl.bas"

dim gfx_memory as UINT
dim counter as integer
dim pixelcolour as integer

dpoke BG, -1	

LOADCLUT (strptr(BACKGROUND_clut), 0, 16)
LOADCLUT (strptr(CHARACTER_clut), 1, 16)

$comment
(14:03:19) sporadicman: also it then kind works if you change the getpixel line to;
(14:03:19) sporadicman: getpixel((50+8),((rlist [character].y >> 16) + 31)) = 0 then
(14:03:34) sporadicman: so for some reason 31
(14:03:47) sporadicman: that looks pixel perfect on top of the red line now
(14:04:14) sporadicman: and remember to change the other line to rlist [background].y = (0 << 16)
(14:05:58) Omf: it should be y=0 in rapinit
(14:06:27) sporadicman: yes it is.  but then in your code you change it to 10
(14:06:55) sporadicman: i still dont understand why its 31 and not 15
(14:07:15) sporadicman: 31 and not 32 because its zero based i assume
(14:07:26) Omf: oh that was for testing, doh,, i had an issue where the background wouldnt display
(14:07:42) sporadicman: but the above
$comment

gfx_memory = rlist [background].gfxbase
dim screen_width%
screen_width=rlist[background].width/2
'COLOUR 1

dim z%

for counter = 1 to 250
	'pixelcolour = getpixel(100,counter)
rlocate 10,10 : rprintint rlist [character].y
	rlocate 20,20 : rprintint rlist [character].y >>16
	'rlocate 30,30 : rprintint gfx_memory
	'plot (150,counter)
	'if getpixel((rlist [character].x >> 16) + 8,(rlist [character].y >> 16) + 16) = 0 then
	
	
	'50 is the x position of [character], [character] is 16 pixels wide by 16 pixels high
	'so half of this is 8 so 50+8

	'get the objects current y position of the top left corner and convert it into pixel coordinates for the screen
	'the next bit i am not really sure about im thinking that it should be y + height to get to the bottom, however it appears to be height *2
	'if getpixel((50+8),((rlist [character].y >> 16) + (rlist [character].height * 2)-1)) = 0 then
	'	rlist [character].y = rlist [character].y + (1 << 16)
	'endif
    z=getpixel(counter,counter)

	vsync
	'delay (5)
next counter

do
vsync
loop


function getpixel(x as short, y as short) as unsigned short
local tmp as integer
if x band 1 then
	tmp = (peek(gfx_memory+x/2+y*screen_width)) band 15
	poke gfx_memory+x/2+y*screen_width,15
	function = tmp
else
	tmp = ((peek(gfx_memory+x/2+y*screen_width))>>4) band 15
	poke gfx_memory+x/2+y*screen_width,240
	function = tmp
endif

end function

