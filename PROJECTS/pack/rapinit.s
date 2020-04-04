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

	;image object
	dc.l	1	; Raptor Exposed Variable: R_Sprite_repeat, , How many sprites like this one do you want in the sprite list?, Create this many objects of this type (or 1 for a single object)
	dc.l	is_inactive	; Raptor Exposed Variable: R_sprite_active, , sprite active flag, Will the sprite be active on screen or inactive?
	dc.w	0,0	; Raptor Exposed Variable: R_sprite_x, , Put sprite this many pixels from left side of screen., 16.16 x value to position at, , entry needs to contain a , (0,0), if you specify a number with out a ,  ",0" will be automatically added to the end of your entry, you can separate your values with a . And it will be replaced with a , so 0.0 will become 0,0
	dc.w	0,0	; Raptor Exposed Variable: R_sprite_y, , Put sprite this many pixels down from top of screen., 16.16 y value to position at, , entry needs to contain a , (0,0), if you specify a number with out a ,  ",0" will be automatically added to the end of your entry, you can separate your values with a . And it will be replaced with a , so 0.0 will become 0,0
	dc.w	0,0	; Raptor Exposed Variable: R_sprite_xadd, , How many pixels will this sprite move automatically in x?, 16.16 x addition for sprite movement, , entry needs to contain a , (0,0), if you specify a number with out a ,  ",0" will be automatically added to the end of your entry, you can separate your values with a . And it will be replaced with a , so 0.0 will become 0,0
	dc.w	0,0	; Raptor Exposed Variable: R_sprite_yadd, , How many pixels will this sprite move automatically in y?, 16.16 y addition for sprite movement, , entry needs to contain a , (0,0), if you specify a number with out a ,  ",0" will be automatically added to the end of your entry, you can separate your values with a . And it will be replaced with a , so 0.0 will become 0,0
	dc.l	352	; Raptor Exposed Variable: R_sprite_width, , width of sprite (in pixels)
	dc.l	250	; Raptor Exposed Variable: R_sprite_height, , height of sprite (in pixels)
	dc.l	is_normal	; Raptor Exposed Variable: R_sprite_flip, , flag for mirroring data left <> right, Will the sprite be mirrored in x?
	dc.l	0	; Raptor Exposed Variable: R_sprite_coffx, , x offset from center for collision box center
	dc.l	0	; Raptor Exposed Variable: R_sprite_coffy, , y offset from center for collision box center
	dc.l	352/2	; Raptor Exposed Variable: R_sprite_hbox, , width of collision box
	dc.l	250/2	; Raptor Exposed Variable: R_sprite_vbox, , height of collision box
	
	dc.l	0	; Raptor Exposed Variable: R_sprite_gfxbase, , start of bitmap data, This name should match the asset that has been added to the assets.txt file
	;as we dont have useful data to use as a gfxbase you can either use the name defined in the assets file in this case 'source_image' or specify an address
	;it doesnt really matter as we will be updating this with the address of the decompressed image after decompressing
	
	dc.l	16	; Raptor Exposed Variable: Unknown / R_sprite_?, , Sprite graphics type: 1,2,4,8,16 or 24 bit (BIT DEPTH)
	dc.l	is_RGB	; Raptor Exposed Variable: Unknown / R_sprite_?, , Sprite graphics type. RGB or Atari's CRY format. (CRY/RGB)
	dc.l	is_opaque	; Raptor Exposed Variable: Unknown / R_sprite_?, , Trans for see-through background, opaque for solid background, bitmap TRANS flag
	dc.l	352*250*2	; Raptor Exposed Variable: R_sprite_framesz, , Size of sprite in bytes - used to find next frame of animation, size per frame in bytes of sprite data, , Enter the x-size * the y-size and add the following next:, /8 for 1bit, /4 for 2bit, /2 for 4bit, nothing for 8bit, *2 for 16bit, *4 for 24bit
	dc.l	352*2	; Raptor Exposed Variable: R_sprite_bytewid, , Width of a single row of sprite pixels, width in bytes of one line of sprite data, , Enter the x-size and add the following:, /8 for 1bit, /4 for 2bit, /2 for 4bit, nothing for 8bit, *2 for 16bit, *4 for 24bit
	dc.l	0	; Raptor Exposed Variable: R_sprite_animspd, , frame delay between animation changes
	dc.l	0	; Raptor Exposed Variable: R_sprite_maxframe, , number of frames in animation chain, Additional number of animation frames after the first
	dc.l	ani_rept	; Raptor Exposed Variable: R_sprite_animloop, , Accespted Values:, ani_once          	1, ani_rept          	-1, , Description:, repeat or play once
	dc.l	edge_wrap	; Raptor Exposed Variable: R_sprite_wrap, , wrap on screen exit, or remove, What do you want to do if sprite leaves the edge of the screen?
	dc.l	spr_inf	; Raptor Exposed Variable: R_sprite_timer, , frames sprite is active for (or spr_inf), Want sprite to stay forever or a number of frames?
	dc.l	spr_linear	; Raptor Exposed Variable: R_sprite_track, , use 16.16 xadd/yadd or point to 16.16 x/y table, Use automatic movement above or use a tracking table.
	dc.l	0	; Raptor Exposed Variable: R_sprite_tracktop, , pointer to loop point in track table (if used), If using above tracking table, input the loop point here
	dc.l	spr_unscale	; Raptor Exposed Variable: R_sprite_scaled, , flag for scaleable object, Is the sprite going to be scaleable or not scaled?
	dc.l	%00100000	; Raptor Exposed Variable: R_sprite_scale_x, , x scale factor (if scaled), , 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up., It's probably best to think of the binary number %00100000…, Adding numbers to the right increases the size fractionally…, Adding them to the left increases buy a factor of one each time, So:, %00100000 is size 1:1 (the same as the original), %01000000 is scaled 2x bigger than the original, %00010000 is scaled half size, %00010001 is a tiny bit bigger than half size
	dc.l	%00100000	; Raptor Exposed Variable: R_sprite_scale_y, , y scale factor (if scaled), , 32 is 1:1. 0-31 are scaled down, 33-255 are scaled up., It's probably best to think of the binary number %00100000…, Adding numbers to the right increases the size fractionally…, Adding them to the left increases buy a factor of one each time, So:, %00100000 is size 1:1 (the same as the original), %01000000 is scaled 2x bigger than the original, %00010000 is scaled half size, %00010001 is a tiny bit bigger than half size
	dc.l	-1	; Raptor Exposed Variable: R_sprite_was_hit, , Did the sprite collide with another?, Set to not hit to begin with (-1), used later to flag collisions
	dc.l	no_CLUT	; Raptor Exposed Variable: R_sprite_CLUT, , no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit), Define sprite colours., CLUT number 0 to 15 for 1, 2 and 4bit
	dc.l	cant_hit	; Raptor Exposed Variable: R_sprite_colchk, , if sprite can collide with another, Want to be able to check if this sprite hits others?
	dc.l	cd_keep	; Raptor Exposed Variable: R_sprite_remhit, , flag to remove (or keep) on collision, What to do if a collision is detected.
	dc.l	single	; Raptor Exposed Variable: R_sprite_bboxlink, , single for normal bounding box, else pointer to table, Bounding box for collision detect 'single'. Or address of table
	dc.l	0	; Raptor Exposed Variable: R_sprite_hitpoint, , Hitpoints before death, Hit points before sprite is killed
	dc.l	0	; Raptor Exposed Variable: R_sprite_damage, , Hitpoints deducted from target, Hit points inflicted upon other sprites
	dc.l	352*2	; Raptor Exposed Variable: R_sprite_gwidth, , GFX width (of data), , Width of sprite within larger graphic., Enter the x-size and add the following:, /8 for 1bit, /4 for 2bit, /2 for 4bit, nothing for 8bit, *2 for 16bit, *4 for 24bit



	
	;particle / text object
	dc.l	1																; (REPEAT COUNTER) 	; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active														; sprite_active		; sprite active flag
	dc.w	16,0															; sprite_x			; 16.16 x value to position at
	dc.w	16,0															; sprite_y			; 16.16 y value to position at
	dc.w	0,0																; sprite_xadd		; 16.16 x addition for sprite movement
	dc.w	0,0																; sprite_yadd		; 16.16 y addition for sprite movement
	dc.l	raptor_particle_buffer_width									; sprite_width		; width of sprite (in pixels)
	dc.l	raptor_particle_buffer_height									; sprite_height		; height of sprite (in pixels)
	dc.l	is_normal														; sprite_flip		; flag for mirroring data left<>right
	dc.l	0																; sprite_coffx		; x offset from center for collision box center
	dc.l	0																; sprite_coffy		; y offset from center for collision box center	
	dc.l	0																; sprite_hbox		; width of collision box
	dc.l	0																; sprite_vbox		; height of collision box
	dc.l	RAPTOR_particle_gfx												; sprite_gfxbase	; start of bitmap data
	dc.l	4																; (BIT DEPTH)		; bitmap depth (1/2/4/8/16/24)
	dc.l	is_RGB															; (CRY/RGB)			; bitmap GFX type
	dc.l	is_trans														; (TRANSPARENCY)	; bitmap TRANS flag
	dc.l	(raptor_particle_buffer_width/2)*raptor_particle_buffer_height	; sprite_framesz	; size per frame in bytes of sprite data
	dc.l	raptor_particle_buffer_width/2									; sprite_bytewid	; width in bytes of one line of sprite data
	dc.l	0																; sprite_animspd	; frame delay between animation changes
	dc.l	0																; sprite_maxframe	; number of frames in animation chain
	dc.l	ani_rept														; sprite_animloop	; repeat or play once
	dc.l	edge_wrap														; sprite_wrap		; wrap on screen exit, or remove
	dc.l	spr_inf															; sprite_timer		; frames sprite is active for (or spr_inf)
	dc.l	spr_linear														; sprite_track		; use 16.16 xadd/yadd or point to 16.16 x/y table
	dc.l	0																; sprite_tracktop	; pointer to loop point in track table (if used)
	dc.l	spr_unscale														; sprite_scaled		; flag for scaleable object
	dc.l	%00100000														; sprite_scale_x	; x scale factor (if scaled)
	dc.l	%00100000														; sprite_scale_y	; y scale factor (if scaled)
	dc.l	-1																; sprite_was_hit	; initially flagged as not hit
	dc.l	15																; sprite_CLUT		; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit														; sprite_colchk		; if sprite can collide with another
	dc.l	cd_remove														; sprite_remhit		; flag to remove (or keep) on collision
	dc.l	single															; sprite_bboxlink	; single for normal bounding box, else pointer to table
	dc.l	1																; sprite_hitpoint	; Hitpoints before death
	dc.l	2																; sprite_damage		; Hitpoints deducted from target
	dc.l	raptor_particle_buffer_width/2									; sprite_gwidth		; GFX width (of data)
	
	
; Template
;	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
;	dc.l	is_active						; sprite_active					; sprite active flag
;	dc.w	20,0							; sprite_x						; 16.16 x value to position at
;	dc.w	100,0							; sprite_y						; 16.16 y value to position at
;	dc.w	0,0								; sprite_xadd					; 16.16 x addition for sprite movement
;	dc.w	0,0								; sprite_yadd					; 16.16 y addition for sprite movement
;	dc.l	32								; sprite_width					; width of sprite (in pixels)
;	dc.l	11								; sprite_height					; height of sprite (in pixels)
;	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
;	dc.l	0								; sprite_coffx					; x offset from center for collision box center
;	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
;	dc.l	32/2							; sprite_hbox					; width of collision box
;	dc.l	5/2								; sprite_vbox					; height of collision box
;	dc.l	BMP_PLAYER						; sprite_gfxbase				; start of bitmap data
;	dc.l	4								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
;	dc.l	is_RGB							; (CRY/RGB)						; bitmap GFX type
;	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
;	dc.l	32*11/2							; sprite_framesz				; size per frame in bytes of sprite data
;	dc.l	32/2							; sprite_bytewid				; width in bytes of one line of sprite data
;	dc.l	3								; sprite_animspd				; frame delay between animation changes
;	dc.l	7								; sprite_maxframe				; number of frames in animation chain
;	dc.l	ani_rept						; sprite_animloop				; repeat or play once
;	dc.l	edge_wrap						; sprite_wrap					; wrap on screen exit, or remove
;	dc.l	spr_inf							; sprite_timer					; frames sprite is active for (or spr_inf)
;	dc.l	spr_linear						; sprite_track					; use 16.16 xadd/yadd or point to 16.16 x/y table
;	dc.l	0								; sprite_tracktop				; pointer to loop point in track table (if used)
;	dc.l	spr_unscale						; sprite_scaled					; flag for scaleable object
;	dc.l	%00100000						; sprite_scale_x				; x scale factor (if scaled)
;	dc.l	%00100000						; sprite_scale_y				; y scale factor (if scaled)
;	dc.l	-1								; sprite_was_hit				; initially flagged as not hit
;	dc.l	1								; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
;	dc.l	can_hit							; sprite_colchk					; if sprite can collide with another
;	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
;	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
;	dc.l	1								; sprite_hitpoint				; Hitpoints before death
;	dc.l	2								; sprite_damage					; Hitpoints deducted from target
;	dc.l	32/2							; sprite_gwidth					; GFX width (of data)	

	dc.b	'STOP'							; end of the current LIST

	dc.b	'<RAPTOR>'						; table termination flag

; END OF FILE.

	
	
	
