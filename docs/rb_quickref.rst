::

    ___           _             ___          _      _
   | _ \__ _ _ __| |_ ___ _ _  | _ ) __ _ __(_)__ _| |_
   |   / _` | '_ \  _/ _ \ '_| | _ \/ _` (_-< / _|_   _|
   |_|_\__,_| .__/\__\___/_|   |___/\__,_/__/_\__| |_|
            |_|


Quick reference guide
 
 
 
Note: this is not a comprehensive guide - it only covers
the commands, functions and variables introduced in
Raptor Basic+. It does not cover bcx functions, commands
and syntax. For that you are kindly referred to read the
bcx help file, "BCXHelp.chm".
 
 
 
 
General
-------

===========================  =============================================================================
Command                      Description
===========================  =============================================================================
Binary bitfields in basic    Just use 
                                    - B8(binary byte) for bytes,
                                    - B16(binary byte,binary byte) words and
                                    - B32(binary byte,binary byte,binary byte,binary byte) for longwords.

                             Example: B8(11110000) is 240 in decimal.
raptor_ntsc_flag             is non-zero if machine is ntsc.
rbsort(table,no_of_indices)  sorts an array of longwords from smallest to largest.

                             Only longwords (4 byte integers) for now.
===========================  =============================================================================
 
Pixel
-----

=========   ================================================================
Command     Description
=========   ================================================================
colour x    set plot colour (0 - 15)
plot(x,y)   plot pixel in coordinates x,y with the colour set using "colour"
cls         clears the pixel/print text buffer
=========   ================================================================

 
Sync
----
=========   ================================================================
Command     Description
=========   ================================================================
RUPDALL     --
VSYNC       waits till the next vertical blank
DELAY(x)    waits for x vertical blanks.
=========   ================================================================
 
Memory
------
=========   ================================================================
Command     Description
=========   ================================================================
poke x,y    writes byte y to address x
peek(x)     returns byte from address x
dpoke x,y   writes word y to address x
dpeek(x)    returns byte from address x
lpoke x,y   writes longword y to address x
lpeek(x)    returns byte from address x
=========   ================================================================
 
Building
--------
General notes about build.bat:

- automatically switches to ROM building if there is even one ROM asset in assets.txt. You can still use build PROJECT ROM though.
- will abort build to RAM if the resulting binary is too large.
- when building a ROM, it will be padded up to 1, 2, 4, 6 or 8mb depending on size. Note that 8mb is only available for skunkboard. A normal ROM file cannot be larger than 6mb. Also note that only the first 4mb will be visible to the system at boot time, to expose the last 4mb the programmer will have to employ the skunkboard's bank switching scheme. Read the skunkboard documentation on how to do this.

============================= ================================================================================
Command                       Description
============================= ================================================================================
build.bat (no parameters)     lists all projects in "projects" folder
build.bat <project> new       creates a new project folder from "template".
build.bat <project> sendy     builds project and uploads it to skunkboard
build.bat <project> ROM       builds project as a ROM file. Assets in RAM are packed with the program code and
                              depacked into RAM during boot. Assets in ROM simply are mapped inside ROM space.
build.bat <project> ROM sendy builds project as a ROM fiel and uploads it to skunkboard. NOTE: THIS WILL
                              OVERWRITE ANY ROM YOU HAVE ON BANK 1 OF YOUR SKUNKBOARD WITHOUT WARNING!
build.bat <project> sendy bjl uploads built binary using bjl transfer (note: you might need to edit the upload
                              settings). Will not work for ROM builds.
============================= ================================================================================
 
assets.txt
----------
============================= ================================================================================
Command                       Description
============================= ================================================================================
RMOTION                       can be enabled with RSETOBJ and RMOTION scripts can now be added to assets.txt
                              for parsing.
============================= ================================================================================

Assets can be packed. Suffix field C with "_pack" in assets.txt

TODO: expand this section

Packing
-------
============================================== ===========
Command                                        Description
============================================== ===========
powaunpack(source_address,destination_address) unpacks data from source_address to destination_address.
                                               Note that it's your responsibility to reserve enough RAM 
                                               for unpacking. Also, no checking to see if a packed asset
                                               exists at the source address - again it's your responsibility!
============================================== ===========


Blitter
-------
================================== ===========================================================
Command                            Description
================================== ===========================================================
powablitlist(pointer_to_blitlist). Passes a list of blitting commands to raptor so they can be
                                   processed fast. pointer_to_blitlist contains an array of
                                   ints that have a1_base, a1_flags, a1_pixel, a2_base,
                                   a2_pixel, a2_flags, b_count, b_patd, b_cmd.
                                   End the list with -1.

                                   Example projects: blitline
================================== ===========================================================


 
Object manipulation
-------------------
=============================================================================================== ===================================================================================================================================
Command                                                                                         Description
=============================================================================================== ===================================================================================================================================
rsetlist                                                                                        --
RSETOBJ spr_index,offset,value                                                                  sets the attribute at offset 
                                                                                                *offset* of object *spr_index* to value *value*.
                                                                                                
                                                                                                See `Table A`_ for offsets, their descriptions and user friendly names.
                                                                                                
                                                                                                Example: RSETOBJ 1,R_sprite_x,10<<16
                                                                                                
                                                                                                
variable=RGETOBJ(spr_index,offset)                                                              gets the attribute at offset "offset" of object "spr_index" and saves it to "variable".
                                                                                                
                                                                                                See `Table A`_ for offsets, their descriptions and user friendly names.
																			                    
                                                                                                Example: player_x=RGETOBJ(spr_index,offset)
																			
rhit (<source first object>, <source last object>, <target first object>, <target last object>) will return 1 (hit has occurred) if anything within the specified range has collided.
                                                                                                This is only a general indication of a collision and
                                                                                                further interrogation via the 'was_hit' variable will let you know which object has actually collided with any of the source 
																								objects.
                                                                                                The values of damage variables of the source objects is deducted from the target objects.  raptor can be set to automatically
																								kill an object when its
																			                    hitpoint variable
                                                                                                reaches -1 (dead) by setting the object variable 'remhit' to 'cd_remove' (1)
                                                                                                The collision check will only work on objects that have their 'colchk' variable set to 'can_hit' (1), objects that are set to 'cant_hit' (-1) will be
																			                    skipped.
powaset(spr_index, offset, no_of_times, array_of_values)                                        will write longword values from address "array_of_values" no_of_times times in raptor table offset "offset", starting with
																								index "spr_index".
powadiff(spr_index, offset, no_of_times, array_of_values)                                       will add longword values from address "array_of_values" no_of_times times in raptor table offset "offset", starting with
																								index "spr_index".
powazap(spr_index, offset, no_of_times, value)                                                  will write longword value "value" "no_of_times" times in raptor table offset "offset", starting with index "spr_index".
powabset(spr_index, offset, no_of_times, array_of_values, skip_offset)                          Exactly the same as powaset but you can control the offset to skip to the next object (it's hardcoded to 188 for the other)
powabdiff(spr_index, offset, no_of_times, array_of_values, skip_offset)                         Exactly the same as powadiff but you can control the offset to skip to the next object (it's hardcoded to 188 for the other)
powabzap(spr_index, offset, no_of_times, value, skip_offset)                                    Exactly the same as powazap but you can control the offset to skip to the next object (it's hardcoded to 188 for the other)
rlist [object list number].<raptor object list variable name> {= new value}                     a faster version of RGETOBJ and RSETOBJ, to 'SET' an objects list variable use RLIST [object list number].
																								<raptor objest list variable name>
                                                                                                = <new value>
                                                                                                to 'GET' an objects list variable use RLIST [object list number].<raptor objest list variable name>
                                                                                                this command can be used in both forms 'SET' and 'GET' in a single command line without issues, example: RLIST [enemy_object_number].x = RLIST
																			                    [player_object_number].x
                                                                                                
                                                                                                supported raptor object list variables: active, x, y, xadd, yadd, flip, width, height, vbox, hbox, gfxbase, framesz, framedel, curframe, maxframe,
																			                    animloop, wrap, timer,
                                                                                                track, colchk, scaled, scale_x, scale_y, CLUT, animspd, bytewid, tracktop, was_hit, coffx, coffy, remhit, bboxlink, hitpoint, damage, flash, gwidth,
																			                    rmotion, rmcurfrm,
                                                                                                rmfrm, userdat1, userdat2, userdat3, userdat4, userdat5, userdat6, userdat7.
																								
																								See table A for descriptions.
                                                                                                
																								Don't forget to add the dependency 'rlist=(RAPTOR_LIST \*)strptr(RAPTOR_sprite_table)' to the top of your code before using this command
=============================================================================================== ===================================================================================================================================

Particles
--------- 
================================== ===========
Command                            Description
================================== ===========
RPARTI                             -- 
RAPTOR_particles_GPU_erase         --
RAPTOR_particles_GPU_plot          --
RPARTI(address_of_particle_struct) *address_of_particle_struct* points to a 6 column by user definable rows
                                   table of longwords. First row must have (0,0,0,x,y,no_particles) and the other
                                   the particle definitions
                                   (angle, speed, angular speed, initial colour, colour decay (per frame), pixel life (in frames))
raptor_used_particles              -- 
raptor_free_particles              -- 
================================== ===========
 
Map module
----------
================================== ===========
Command                            Description
================================== ===========
RSETMAP                            --
================================== ===========
 
Colours
-------
====================================================== ===========
Command                                                Description
====================================================== ===========
loadclut palette_address,target_clut,number_of_indices takes the palette values at address "palette_address" and
                                                       copies them to CLUT "target_clut" (0 to 15).
                                                       *number_of_indices* tells the routine how many to copy.
                                                       This routine can be used to set up anything from 2 to 256 palette indices at once.
fadepal(int clut_no,int fade_cols,int \*palette)       fades CLUT *clut_no* (0-15) to CLUT values address *palette*.
                                                       *fade_cols* is the number of CLUT entries to process.
                                                       Note that fade_cols is 0 based, so to fade 16 cols pass 15.
fadesingle(index_to_fade,desired_colour_in_16_bit_BBG) fades CLUT index *index_to_fade* to *desired_colour_in_16_bit_BBG*.
raptor_fade_delay                                      delay (in function calls) between steps (.word)
====================================================== ===========
 
Strings
-------
================================ ================================================================================
Command                          Description
================================ ================================================================================
print                            --
RPRINTINT                        --
bin2asc(number, digits, string$) converts number with (digits+1) digits very fast
                                 and render it to string$.

                                 Note that the number has to be an integer.

                                 Example: bin2asc(987,2,out$) will convert number 987 to string using 3 digits
                                 and place it into out$. If we used 3 instead of 2 we'd get "0987"

RPRINT string                    prints a static string to screen at coordinates set by RLOCATE.
                                 No fancy formatting allowed (i.e. it'll only work with something like
                                 RPRINT "hello". RPRINT "hello"&"world" will fail). Font is set via
                                 basic_r_indx and size from basic_r_size.
RLOCATE x,y                      Locates the cursor at coordinates x,y. Notice that those are pixel coordinates,
                                 not cursor coordinates.Font is set via basic_r_indx and size from basic_r_size.
basic_r_indx                     --
basic_r_size                     --
================================ ================================================================================
 
 
 
Scores
------
========================= ===========
Command                   Description
========================= ===========
raptor_mt_present         negative if no Memory Track is present
raptor_highscores_hex     points to the highscore table (10 entries, one longword each)
raptor_highscores_nam     points to the highscore names table (10 entries, 8 characters each, not null terminated)
hiscore_check(score,name) checks if score is a high score. name, like above, is 8 characters.
RAPTOR_resort_score_table re-sorts the highscores as well as the names.
RAPTOR_mt_save            saves the highscore table. Use it in combination with present.
raptor_user_savedata      points to 512 bytes for user data which will be appended to the MT save
========================= ===========
 
Sound/input engines
-------------------
Either U-235 or Zerosquare (selectable at rapapp.s via equate "player", 0=Zerosquare's player, 1=U-235 player)
 
U-235
=====
====================== ===========
Command                Description
====================== ===========
MODPLAY(mod_address)   plays a .mod file at address "mod_address"
MODPLAY(0)             stops .mod playing
GETPAD(x)              returns values from either pad 1 or 2.

                       Can be replaced by reading U235SE_pad1 and U235SE_pad2 directly.
SNDPLAYFREQ(voice,x,y) triggers sample x from module into channel "voice" at y frequency in Hz
MODVOL(x)              sets mod music volume (x in range 0 - 63)
SNDVOL(x)              sets global sfx volume (x in range 0 - 63)
SNDKILL(x)             stops playing sample at channel number x
SNDVOLRESET(x)         resets volume of current sample on channel x
SNDFREQRESET(x)        resets frequency of current sample on channel x
SNDDELTA(x,y)          set or adjust the volume on channel x to y (0 to 63)
SNDFREQ(x,y)           sets frequency of channel x to y (0 to 65535)
rotary_mode1           +1 = rotary, - 1 = jagpad (Port 1) (.l)
rotary_mode2           +1 = rotary, - 1 = jagpad (Port 2) (.l)
turn_direction1        rotary value (bigger is faster) - +=left / 0=nothing / - =right (Port 1) (.l)
turn_direction2        rotary value (bigger is faster) - +=left / 0=nothing / - =right (Port 2) (.l)
rotary_interval1       trim value for rotary (Port 1) (.l)
rotary_interval2       trim value for rotary (Port 2) (.l)
spin_delta1            value to add to turn_direction per increment (Port 1) (.l)
spin_delta2            value to add to turn_direction per increment (Port 2) (.l)
Direction pad masks    PAD_UP, PAD_U, PAD_DOWN, PAD_D, PAD_LEFT, PAD_L, PAD_RIGHT, PAD_R, PAD_HASH, PAD_9,
                       PAD_6, PAD_3, PAD_PAUSE, PAD_A, PAD_OPTION, PAD_STAR, PAD_7, PAD_4, PAD_1, PAD_0, PAD_8,
                       PAD_5, PAD_2, PAD_B, PAD_C.

                       Example: "if x band (PAD_U bor PAD_L) then" will check for up+left
====================== ===========

 
Zerosquare
==========
======================================================= ==========================================================================================================================================================
Command                                                 Description
======================================================= ==========================================================================================================================================================
ZEROPAD()                                               reads both pad ports and sends results back to variables zero_left_pad, zero_right_pad,
                                                        zero_mousex_delta, zero_mousey_delta and zero_rotary_delta.
                                                        By default the engine is configured to assume 2 joypads connected.
                                                        This command needs to be used in capitals.
                                                        example projects: chessboard, print
Input_SetNormalPadMode                                  sets up the engine to read two pads (enabled by default).
                                                        zero_left_pad and zero_right_pad can be read using these constants: Input_Pad_Pause, Input_Pad_A,
                                                        Input_Pad_Up, Input_Pad_Down, Input_Pad_Left, Input_Pad_Right, Input_Pad_C1, Input_Pad_B,
                                                        Input_Pad_Star, Input_Pad_7, Input_Pad_4, Input_Pad_1, Input_Pad_C2, Input_Pad_C, Input_Pad_0,
                                                        Input_Pad_8, Input_Pad_5, Input_Pad_2, Input_Pad_C3, Input_Pad_Option, Input_Pad_Sharp, Input_Pad_9,
                                                        Input_Pad_6, Input_Pad_3.
                                                        example: "if zero_left_pad band Input_Pad_Star" will check left pad for star button press.
Input_SetJoyPort1                                       enables joypad port 1 to be used for rotary/mouse input. This doesn't enable rotary/mouse mode.
                                                        zero_rotary_delta will give the number of rotary ticks since the last read command.
Input_SetJoyPort2                                       enables joypad port 2 to be used for rotary/mouse input. This doesn't enable rotary/mouse mode.
                                                        zero_rotary_delta will give the number of rotary ticks since the last read command.
Input_SetRotaryMode                                     enables rotary mode.
Input_SetAtariMouseMode                                 enables Atari mouse mode.
                                                        Input_Mouse_Left and Input_Mouse_Right are the masks to check for button presses
                                                        zero_mousex_delta, zero_mousey_delta are the number of mouse ticks in x and y axis since the last read command.
Input_SetAmigaMouseMode                                 enables Amiga mouse mode.
                                                        Input_Mouse_Left and Input_Mouse_Right are the masks to check for button presses
                                                        zero_mousex_delta, zero_mousey_delta are the number of mouse ticks in x and y axis since the last read command.
SNDZEROPLAY chan, start_address, len, frequency, params plays a sample starting from start_address with length len to channel chan with speed frequency and with flags params.
                                                        *Channel* should be from 1 to 4. start_address should be aligned to 4 bytes.
                                                        len should be a multiple of 4.
                                                        frequency should be an integer that divides the base frequency of 46168Hz.
                                                        So for example if it's set to 1, it'll play a sample at 46168Hz, a 2 will play a sample at 23084Hz etc.

                                                        Available flags are:
                                                                             - Zero_Audio_8bit_Signed (plays an 8-bit signed sample)
                                                                             - Zero_Audio_8bit_Unsigned (plays an 8 - bit unsigned sample)
                                                                             - Zero_Audio_8bit_muLaw (plays a 8 - bit compressed ?w sample)
                                                                             - Zero_Audio_Looping (enables sample loop).
                                                        
                                                        Example for playing samples from RAM (ABS):
                                                            SNDZEROPLAY(1, strptr(sample_start), (strptr(sample_end)-strptr(sample_start)+3) and 0xfffffffc, 46168/9233, Zero_Audio_8bit_muLaw|Zero_Audio_Looping)
                                                        Example for playing samples from ROM:
                                                            SNDZEROPLAY(1, (void *)sample_start, (sample_end-sample_start+3) and 0xfffffffc, 46168/9233, Zero_Audio_8bit_muLaw|Zero_Audio_Looping)
======================================================= ==========================================================================================================================================================
 
`Table A`_
----------
====================== ====== ===========
Offset's friendly name Offset Description   
====================== ====== ===========
R_sprite_obj           0      pointer to object in OL
R_sprite_active        4      active flag (-1 = inactive)
R_sprite_x             8      x position in 16.16
R_sprite_y             12     y position in 16.16
R_sprite_xadd          16     x velocity to add in 16.16
R_sprite_yadd          20     y velocity to add in 16.16
R_sprite_flip          24     if set, add _width to X and set mirror
R_sprite_width         28     width of sprite
R_sprite_height        32     height of sprite
R_sprite_vbox          36     vertical distance from midpoint for collision clipping
R_sprite_hbox          40     horizontal distance from midpoint for collision clipping
R_sprite_gfxbase       44     pointer to phrase aligned sprite bitmap data
R_sprite_framesz       48     size of sprite frame in bytes (offset to next frame)
R_sprite_framedel      52     vblanks till next sprite animation frame
R_sprite_curframe      56     current frame number (or 0 for no frames)
R_sprite_maxframe      60     maximum frame for sprite
R_sprite_animloop      64     -1 = loop animation, 1=terminate on loop
R_sprite_wrap          68     flag for wrap or disable on leaving screen
R_sprite_timer         72     frames to stay alive, or -2 for infinite
R_sprite_track         76     -1 = use fract update, else pointer to x.y co-ords
R_sprite_colchk        80     -1 = no collision detection
R_sprite_scaled        84     -1 = unscaled, 1 = scaled
R_sprite_scale_x       88     x-scaler
R_sprite_scale_y       92     y-scaler
R_sprite_CLUT          96     -1 for no change, else CLUT to use for sprite if <16bit
R_sprite_animspd       100    animation speed
R_sprite_bytewid       104    width of one scanline of sprite in bytes
R_sprite_tracktop      108    loop point for tracking, or -1 for exit
R_sprite_was_hit       112    set to +ve if by the collision routine if sprite hit
R_sprite_coffx         116    offset from center for bounding box (hbox)
R_sprite_coffy         120    offset from center for bounding box (vbox)
R_sprite_remhit        124    1 = remove if hit, else leave onscreen
R_sprite_bboxlink      128    -1, or pointer to bounding box link data
R_sprite_hitpoint      132    hitpoints of damage to take before removal
R_sprite_damage        136    damage to deal
R_sprite_flash         140    make sprite blink
R_sprite_gwidth        144    graphics width
R_sprite_rmotion       148    pointer to RMotion animation
R_sprite_rmcurfrm      152    RMotion internal
R_sprite_rmfrm         156    RMotion internal
R_sprite_userdat1      160    Reserved for future expansion
R_sprite_userdat2      164    Reserved for future expansion
R_sprite_userdat3      168    Reserved for future expansion
R_sprite_userdat4      172    Reserved for future expansion
R_sprite_userdat5      176    Reserved for future expansion
R_sprite_userdat6      180    Reserved for future expansion
R_sprite_userdat7      184    Reserved for future expansion
====================== ====== ===========

