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
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active						; sprite_active					; sprite active flag
	dc.w	352,0							; sprite_x						; 16.16 x value to position at
	dc.w	16,0							; sprite_y						; 16.16 y value to position at
	dc.w	0,0								; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	0,0								; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	320								; sprite_width					; width of sprite (in pixels)
	dc.l	200								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	32/2							; sprite_hbox					; width of collision box
	dc.l	5/2								; sprite_vbox					; height of collision box
	dc.l	scrbuf						; sprite_gfxbase				; start of bitmap data
	dc.l	4								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_RGB							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	160*200							; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	160							; sprite_bytewid				; width in bytes of one line of sprite data
	dc.l	0								; sprite_animspd				; frame delay between animation changes
	dc.l	0								; sprite_maxframe				; number of frames in animation chain
	dc.l	ani_rept						; sprite_animloop				; repeat or play once
	dc.l	edge_wrap						; sprite_wrap					; wrap on screen exit, or remove
	dc.l	spr_inf							; sprite_timer					; frames sprite is active for (or spr_inf)
	dc.l	spr_linear						; sprite_track					; use 16.16 xadd/yadd or point to 16.16 x/y table
	dc.l	0								; sprite_tracktop				; pointer to loop point in track table (if used)
	dc.l	spr_unscale						; sprite_scaled					; flag for scaleable object
	dc.l	%00100000						; sprite_scale_x				; x scale factor (if scaled)
	dc.l	%00100000						; sprite_scale_y				; y scale factor (if scaled)
	dc.l	-1								; sprite_was_hit				; initially flagged as not hit
	dc.l	0								; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	can_hit							; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	320/2							; sprite_gwidth					; GFX width (of data)	

	dc.b	'STOP'							; end of the current LIST

	dc.b	'<RAPTOR>'						; table termination flag

; END OF FILE.

	
	
	
