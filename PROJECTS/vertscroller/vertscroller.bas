'
' Vertical scroller by ggn for Fredifredo (the mad fartist!)
' Written in 6 August 2019 (we live in grand times)
'
rlist=(RAPTOR_LIST *)strptr(RAPTOR_sprite_table)
basic_r_size=0
basic_r_indx=0

rlist[0].y=0
vsync

set scroller_text$[106,41]
"                                        ",
"                                        ",
"                                        ",
"              Fredifredo                ",
"                                        ",
"               presents                 ",
"                                        ",
"                                        ",
"                                        ",
"                                        ",
"             THE FART WARS              ",
"                                        ",
"                                        ",
"                                        ",
"A long long time ago in a fart fart     ",
"galaxy....                              ",
"                                        ",
"NG : How many Jaguars have been sold to ",
"date?                                   ",
"                                        ",
"Sam : Approximately 150,000 machines in ",
"the US. We wish we'd sold more Jaguars  ",
"in '94; the first software was very,    ",
"very late. Now the software's coming up,",
"so things are much better.              ",
"                                        ",
"NG : What are you doing to improve      ",
"sales?                                  ",
"                                        ",
"Sam : The retail price -- that's the big",
"push that we did. Sales have gone off   ",
"better since the price has been dropped ",
"to $149.                                ",
"                                        ",
"NG : Is Jaguar really 64-bit?           ",
"                                        ",
"Sam : Absolutely, uncategorically yes.  ",
"If you look at the PCB, there are 64    ",
"data paths going into the UM. This is   ",
"64-bit architecture. Look at a PC, they ",
"call Pentium a 64-bit system, it is, but",
"they also have 8-bit chips and 8-bit    ",
"parts of the system as well; the clock  ",
"is 8-bit. In Jaguar there's 16-bit,     ",
"32-bit, and 64-bit in parts of it. Trip ",
"Hawkins tried to screw us up with that. ",
"It is a 64-bit architecture, there's no ",
"two ways about it.                      ",
"                                        ",
"NG : How do you perceive Jaguar's       ",
"position in the marketplace right now?  ",
"                                        ",
"Sam : As the next generation machine    ",
"which is affordable to the marketplace. ",
"                                        ",
"NG : And how do you see this changing   ",
"over the next nine months as the new    ",
"machines from Sega, Nintendo, and Sony  ",
"are released?                           ",
"                                        ",
"Sam : It's a very hard question to      ",
"answer without knowing the other        ",
"machine's prices and exactly what will  ",
"happen with Sony and Sega. The machines ",
"in Japan today sell for around $500     ",
"each, at the current exchange rates.    ",
"If they bring them in at those kinds of ",
"prices, then the public won't buy them  ",
"at all, it's just way too expensive.    ",
"                                        ",
"NG : Jaguar hasn't always been at $149. ",
"Up until recently it's been $249 and    ",
"higher. How do you feel about that as a ",
"price point now? Do you think that was  ",
"too high?                               ",
"                                        ",
"Sam : I think it was too high, but at   ",
"that time we had no choice. Our costs   ",
"were just beginning to come into play.  ",
"And we had to be at $249. But it was too",
"high. We sold a good number of machines,",
"though less than we wanted to sell. It  ",
"was too expensive for the gaming        ",
"consumer                                ",
"                                        ",
"NG : Has the Jaguar been profitable for ",
"Atari?                                  ",
"                                        ",
"Sam : Oh no. Not yet, not at all. We're ",
"investing in the future of the Jaguar.  ",
"                                        ",
"NG : And in what time frame do you      ",
"foresee the Jaguar becoming a profitable",
"product?                                ",
"                                        ",
"Sam : That's one of those questions I   ",
"can't answer, I'm not allowed to answer.",
"We have our plans. One thing I can say  ",
"is that it's a software driven business.",
"We're using the hardware like Gillette  ",
"does with razors and razor blades. We   ",
"sell the razor for cost, or even below, ",
"to make it up in software. So as        ",
"software sales comes up, and there's a  ",
"higher ratio of software sales to       ",
"hardware, then we'll start making money."
end set

dim print_coord%
print_coord=0

dim i%
dim current_scroller_line as short
current_scroller_line=0

for i=0 to 240-8 step 8
    RLOCATE 0,i
    rprint scroller_text[current_scroller_line]
    current_scroller_line++
next i

dim scroller_y_to_print as short
scroller_y_to_print=0

dim object_y%
object_y=0

dim test%

do
    vsync

    if 0 then
        ZEROPAD()
	    while (zero_left_pad BAND 0xFBEFBF)=0    ' 266304 is what ZEROPAD return if nothing pressed. FBEFBF is the C1, C2 and C3 mask.
            ZEROPAD()
        wend
	    while (zero_left_pad BAND 0xFBEFBF)<>0    ' 266304 is what ZEROPAD return if nothing pressed. FBEFBF is the C1, C2 and C3 mask.
            ZEROPAD()
        wend
    endif

    rlist[0].y=object_y

    if (object_y band ((7<<16)|0xffff))=0 then
        rlocate 0,scroller_y_to_print
        rprint scroller_text[current_scroller_line]
        rlocate 0,scroller_y_to_print+240
        rprint scroller_text[current_scroller_line]
        current_scroller_line++
        if current_scroller_line=104 then
            current_scroller_line=0
        endif
        scroller_y_to_print=scroller_y_to_print+8
        if scroller_y_to_print=240 then
            scroller_y_to_print=0
        endif
    endif

    object_y=object_y-(1<<15)
    if object_y=-(240<<16) then
        object_y=0
    endif

loop
