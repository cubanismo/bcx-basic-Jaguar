;;
;; RAPTOR INIT FILE
;;
;;
;; Each object (or group of objects) needs to be defined here
;; RAPTOR init (in _RAPT68k) will configure raptor based on below automatically
;; and create a corresponding Object List for the OP to branch to
;;
;;

; MEMORY TRACK STUFF
;

; 15 chars  						'012345678901234'
RAPTOR_MT_app_name:			dc.b	'RAPTOR',0					; Name of Application
							.even
RAPTOR_MT_file_name:		dc.b	'OSSUM',0					; Name of filename to use
							.even

raptor_init_table:
	dc.b	'>RAPTOR<'	; table start flag
	
;	----------------------------------------------------------------------------------------------------------
;	dc.l	VALUE		; RAPTOR variable	; Comment
;	----------------------------------------------------------------------------------------------------------

	dc.b	'LIST'		; initiate list structure

; particle and text object 0	
	include	"partlist.s"	; Include the TEXT/PARTICLE layer bitmap

; water 2
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	0,0				; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	48,0				; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	352				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	87				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	352/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	87/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_WATER	;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1,  2,  4,  8,  16,  24			; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_opaque		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	352*87/2		; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	352/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	2				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	11				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	32				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	32				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	6				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	cant_hit		; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	0				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	352/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
																																

	
; background - object 1
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	0,0				; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	0,0				; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	352				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	240				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	352/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	240/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_BG		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	16				; 1,  2,  4,  8,  16,  24			; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	352*240*2		; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	352*2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	0				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	0				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	32				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	32				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	no_CLUT				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	cant_hit		; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	0				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	352*2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
; poulpes1  - object 2
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	188,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	48,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	0,$8000			; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	64				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	64/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_POULPES	;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	64*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	64/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	5				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	3				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	32				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	32				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	1				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	64/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
; poulpes1  - object 2
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	32,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	48,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	0,$8000			; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	64				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	64/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_POULPES	;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	64*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	64/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	5				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	3				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	32				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	32				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	1				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	64/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit

; poulpes2 - object 3
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	288,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	64,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	-1,$8000		; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	64				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	64/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_POULPES	;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	64*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	64/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	6				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	3				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	32				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	32				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	1				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	64/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
																
																
																
; poulpes3 - object 4
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	86,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	80,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	1,$0000			; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	64				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	64/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_POULPES	;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	64*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	64/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	4				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	3				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	32				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	32				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	1				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	64/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
																
																
																
; poulpes4  - object 5
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	388,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	96,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	-1,$5000		; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	64				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	64/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_POULPES	;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	64*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	64/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	5				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	3				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	32				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	32				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	1				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	64/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
																
																
; poulpes5 - object 6
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	80,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	112,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	0,$A000			; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	64				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	64/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_POULPES	;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	64*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	64/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	6				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	3				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	32				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	32				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	1				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	64/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
																																
																
; poulpes5 - object 6
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	238,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	112,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	0,$A000			; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	64				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	64/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_POULPES	;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	64*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	64/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	6				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	3				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	32				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	32				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	1				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	64/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
																
																
																

; nyan1  - object 7
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	336,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	144,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	1,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit


																
																
; nyan2 - object 8
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	272,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	176,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	2,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit


																
																
; nyan3  - object 9
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	272,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	208,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	1,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit

																
																																
																
																

; nyan4  - object 10
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	272,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	144,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	1,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit


; nyan5 - object 11
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	208,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	176,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	2,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit

																
																
; nyan6  - object 12
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	208,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	208,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	1,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit

																
																
				
																
																																
																
																

; nyan7  - object 13
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	64,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	144,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	1,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit

		
																
																
; nyan8 - object 14
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	0,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	176,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	2,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit

																
																
; nyan9  - object 15
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	0,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	208,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	1,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit

																
																
																
																
; nyan10  - object 16
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	0,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	192,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	-2,$8000		; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_flipped		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit

															
																
; nyan11  - object 17
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	-172,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	160,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	-2,$8000		; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_flipped		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
																
																
; nyan12  - object 18
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	100,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	160,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	-2,$8000		; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_flipped		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
																
																
; nyan13  - object 19
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	272,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	192,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	-2,$8000		; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_flipped		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
																
																
; nyan14  - object 20
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	36,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	160,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	-2,$8000		; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_flipped		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit

																
																															
																
; nyan15  - object 21
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	208,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	192,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	-2,$8000		; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	48				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_flipped		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	48/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_NYAN		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	48*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	48/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	1				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	7				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	48				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	48				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	2				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	48/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit

																
; doge - object 22
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	144,0			; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	220,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	32				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	2				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	20/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	12/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_DOGE		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	32*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	32/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	0				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	0				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	32				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	32				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	3				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	0				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	32/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
				


; title - object 23
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	0,0				; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	0,0				; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	352				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	240				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	352/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	240/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_TITLE	;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_opaque		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	352*240/2		; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	352/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	0				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	0				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	32				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	32				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	4				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	0				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	352/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit


																																

; dead - object 24
;			value						possible values				description															rb+ label to access
	dc.l	1				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	0,0				; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	255,0				; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	352				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	240				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	352/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	240/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_DEAD	;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_opaque		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	352*240/2		; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	352/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	0				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	0				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	32				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	32				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	5				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	0				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	352/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit


																																																										
; non-playable doges for top of screen - objects 25 to 28
;			value						possible values				description															rb+ label to access
	dc.l	4				; 									; How many sprites like this one do you want in the sprite list?
	dc.l	is_active		; is_active			is_inactive		; Will the sprite be active on screen or inactive?					;   R_sprite_active
	dc.w	0,0				; 									; Put sprite this many pixels from left side of screen.				;   R_sprite_x
	dc.w	255,0			; 									; Put sprite this many pixels down from top of screen.				;   R_sprite_y
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.w	0,0				; 									; How many pixels will this sprite move automatically in x?			;   R_sprite_xadd
	dc.l	32				; 									; Width of sprite in pixels											; * R_sprite_width
	dc.l	16				; 									; Height of sprite in pixels										; * R_sprite_height
	dc.l	is_normal		; is_normal			is_flipped		; Will the sprite be mirrored in x?									;   R_sprite_flip
	dc.l	0				; 									; Collision box x offset - pixel distance from centre of sprite		; * R_sprite_coffx
	dc.l	0				; 									; Collision box y offset - pixel distance from centre of sprite		; * R_sprite_coffy
	dc.l	20/2			;									; Width of collision box from centre in pixels						; * R_sprite_hbox
	dc.l	16/2			;									; Height of collision box from centre in pixels						; * R_sprite_vbox
	dc.l	SPRITE_DOGE		;									; Place in memory where the sprite lives: label from RAPAPP.S		;   R_sprite_gfxbase
	dc.l	4				; 1  2  4  8  16  24				; Sprite graphics type: 1,2,4,8,16 or 24 bit						; * R_sprite_?
	dc.l	is_RGB			; is_RGB			is_cry			; Sprite graphics type. RGB or Atari's CRY format.					; * R_sprite_?
	dc.l	is_trans		; is_trans			is_opaque		; Trans for see-through background, opaque for solid background		; * R_sprite_?
	dc.l	32*16/2			; 									; Size of sprite in bytes - used to find next frame of animation	;   R_sprite_framesz
																; Enter the x-size * the y-size and add the following next:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	32/2			; 									; Width of a single row of sprite pixels							; * R_sprite_bytewid
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
	dc.l	0				;									; Number of screen updates (VB) before the animation advances		;   R_sprite_framedel
	dc.l	0				; 									; Additional number of animation frames after the first				;   R_sprite_maxframe
	dc.l	ani_rept		; ani_rept			ani_once		; Loop theanimation or play a single time							;	R_sprite_animloop
	dc.l	edge_wrap		; edge_wrap			R_edge_kill		; What do you want to do if sprite leaves the edge of the screen?	;   R_sprite_wrap
	dc.l	spr_inf			; spr_inf							; Want sprite to stay forever or a number of frames?				;   R_sprite_timer
	dc.l	spr_linear		; spr_linear 						; Use automatic movement above or use a tracking table.				;   R_sprite_track
	dc.l	0				;									; If using above tracking table, input the loop point here			;   R_sprite_tracktop
	dc.l	spr_unscale		; spr_unscale		spr_scale		; Is the sprite going to be scaleable or not scaled?				;	R_spr_scaled
	dc.l	32				;									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_x
																; It's probably best to think of the binary number %00100000...
																; Adding numbers to the right increases the size fractionally...
																; Adding them to the left increases buy a factor of one each time
																; So %01000000 is scaled 2x bigger than the original
																;    %00010000 is scaled half size
																;    %00010001 is a tiny bit bigger than half size
	dc.l	32				; 									; 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up.			;   R_sprite_scale_y
																; See above for more info.
	dc.l	-1				; 									; Did the sprite collide with another?								;   R_sprite_was_hit
																; Set to not hit to begin with, used later to flag collisions
	dc.l	3				; no_CLUT							; Define sprite colours.											;   R_sprite_CLUT
																; no_CLUT for 8, 16 and 24bit
																; CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	can_hit			; can_hit			cant_hit		; Want to be able to check if this sprite hits others?				;   R_sprite_colchk
	dc.l	cd_keep			; cd_keep			cd_remove		; What to do if a collision is detected.							;   R_sprite_remhit
	dc.l	single			; single							; Bounding box for collision detect 'single'. Or address of table	;	R_sprite_bboxlink
	dc.l	1				; 									; Hit points before sprite is killed								;   R_sprite_hitpoint
	dc.l	1				; 									; Hit points inflicted upon other sprites							;   R_sprite_damage
	dc.l	32/2			;									; Width of sprite within larger graphic.							;   R_sprite_gwidth
																; Enter the x-size and add the following:
																; /8 for 1bit
																; /4 for 2bit
																; /2 for 4bit
																; nothing for 8bit
																; *2 for 16bit
																; *4 for 24bit
					
																
																
																
																
																

																
	include	"partlist.s"	; Include the TEXT/PARTICLE layer bitmap
																
																

				

	dc.b	'STOP'							; end of the current LIST

	dc.b	'<RAPTOR>'						; table termination flag

; END OF FILE.

	
	
	
