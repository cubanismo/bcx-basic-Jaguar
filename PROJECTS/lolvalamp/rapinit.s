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
	

; ***************************************************************************************
; *** METABLOLOLOLOBS ************************************************************ LIST 0
; ***************************************************************************************	
	

; Text / Particle Object	2	
	dc.l	1																; (REPEAT COUNTER) 	; Create this many objects of this type (or 1 for a single object)
	
	dc.l	is_active														; sprite_active		; sprite active flag
	dc.w	32,0															; sprite_x			; 16.16 x value to position at
	dc.w	241,0															; sprite_y			; 16.16 y value to position at
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
	dc.l	is_RGB															; (cry/RGB)			; bitmap GFX type
	dc.l	is_opaque														; (TRANSPARENCY)	; bitmap TRANS flag
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
	dc.l	0																; sprite_CLUT		; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit														; sprite_colchk		; if sprite can collide with another
	dc.l	cd_remove														; sprite_remhit		; flag to remove (or keep) on collision
	dc.l	single															; sprite_bboxlink	; single for normal bounding box, else pointer to table
	dc.l	1																; sprite_hitpoint	; Hitpoints before death
	dc.l	2																; sprite_damage		; Hitpoints deducted from target
	dc.l	raptor_particle_buffer_width/2									; sprite_gwidth		; GFX width (of data)
	

		
	
; here be blobs	

; birst big blob - 1
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active						; sprite_active					; sprite active flag
	dc.w	360,0							; sprite_x						; 16.16 x value to position at
	dc.w	-150,0							; sprite_y						; 16.16 y value to position at
	dc.w	-1,$7000						; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	-1,$7000						; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	128								; sprite_width					; width of sprite (in pixels)
	dc.l	128								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	1								; sprite_hbox					; width of collision box
	dc.l	1								; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB128						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	128*128*2						; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	128*2							; sprite_bytewid				; width in bytes of one line of sprite data
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
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	128*2							; sprite_gwidth					; GFX width (of data)	
				
		
			
; big blob 2
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	130,0							; sprite_x						; 16.16 x value to position at
	dc.w	130,0							; sprite_y						; 16.16 y value to position at
	dc.w	-1,$4000						; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	01,$7000							; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	128								; sprite_width					; width of sprite (in pixels)
	dc.l	128								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	1								; sprite_hbox					; width of collision box
	dc.l	1								; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB128						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	128*128*2						; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	128*2							; sprite_bytewid				; width in bytes of one line of sprite data
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
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	128*2							; sprite_gwidth					; GFX width (of data)	
				
			
			
; 3rd biggie
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active						; sprite_active					; sprite active flag
	dc.w	70,0							; sprite_x						; 16.16 x value to position at
	dc.w	200,0							; sprite_y						; 16.16 y value to position at
	dc.w	0,$3000						; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	-1,$9000						; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	128								; sprite_width					; width of sprite (in pixels)
	dc.l	128								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	1								; sprite_hbox					; width of collision box
	dc.l	1								; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB128						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	128*128*2						; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	128*2							; sprite_bytewid				; width in bytes of one line of sprite data
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
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	128*2							; sprite_gwidth					; GFX width (of data)	
				
	
			
; 4th bigs
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	196,0							; sprite_x						; 16.16 x value to position at
	dc.w	130,0							; sprite_y						; 16.16 y value to position at
	dc.w	-1,$8000							; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	1,$0000						; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	128								; sprite_width					; width of sprite (in pixels)
	dc.l	128								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	1								; sprite_hbox					; width of collision box
	dc.l	1								; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB128						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	128*128*2						; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	128*2							; sprite_bytewid				; width in bytes of one line of sprite data
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
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	128*2							; sprite_gwidth					; GFX width (of data)	
				
	
; big 5 standing by
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active						; sprite_active					; sprite active flag
	dc.w	128,0							; sprite_x						; 16.16 x value to position at
	dc.w	0,0								; sprite_y						; 16.16 y value to position at
	dc.w	0,$9000							; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	0,$8000							; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	128								; sprite_width					; width of sprite (in pixels)
	dc.l	128								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	1								; sprite_hbox					; width of collision box
	dc.l	1								; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB128						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	128*128*2						; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	128*2							; sprite_bytewid				; width in bytes of one line of sprite data
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
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	128*2							; sprite_gwidth					; GFX width (of data)	
				
							
; 6?! When will raptor crap out ffs?!
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	0,0							; sprite_x						; 16.16 x value to position at
	dc.w	260,0							; sprite_y						; 16.16 y value to position at
	dc.w	0,$A600						; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	-1,$A600						; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	128								; sprite_width					; width of sprite (in pixels)
	dc.l	128								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	1								; sprite_hbox					; width of collision box
	dc.l	1								; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB128						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	128*128*2						; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	128*2							; sprite_bytewid				; width in bytes of one line of sprite data
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
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	128*2							; sprite_gwidth					; GFX width (of data)	
				
							
; 7!!!?!?!! SEVEN!
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	360,0							; sprite_x						; 16.16 x value to position at
	dc.w	-128,0							; sprite_y						; 16.16 y value to position at
	dc.w	-1,$5000						; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	0,$9800						; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	128								; sprite_width					; width of sprite (in pixels)
	dc.l	128								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	1								; sprite_hbox					; width of collision box
	dc.l	1								; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB128						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	128*128*2						; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	128*2							; sprite_bytewid				; width in bytes of one line of sprite data
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
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	128*2							; sprite_gwidth					; GFX width (of data)	
				
											
; 8...? srsly?
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	20,0							; sprite_x						; 16.16 x value to position at
	dc.w	-130,0							; sprite_y						; 16.16 y value to position at
	dc.w	0,$D000							; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	0,$B000						; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	128								; sprite_width					; width of sprite (in pixels)
	dc.l	128								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	1								; sprite_hbox					; width of collision box
	dc.l	1								; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB128						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	128*128*2						; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	128*2							; sprite_bytewid				; width in bytes of one line of sprite data
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
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	128*2							; sprite_gwidth					; GFX width (of data)	
				
															
; .... nine.... nine fucking 128x128x16bit objects... lololol
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	-130,0							; sprite_x						; 16.16 x value to position at
	dc.w	-160,0							; sprite_y						; 16.16 y value to position at
	dc.w	-1,$B000						; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	-1,$7000						; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	128								; sprite_width					; width of sprite (in pixels)
	dc.l	128								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	1								; sprite_hbox					; width of collision box
	dc.l	1								; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB128						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	128*128*2						; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	128*2							; sprite_bytewid				; width in bytes of one line of sprite data
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
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	128*2							; sprite_gwidth					; GFX width (of data)	
				
				

; 64 by 64 - that's the powa score 1
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	14,0							; sprite_x						; 16.16 x value to position at
	dc.w	-64,0							; sprite_y						; 16.16 y value to position at
	dc.w	0,$e000							; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	0,$b000							; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	64								; sprite_width					; width of sprite (in pixels)
	dc.l	64								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	64/2							; sprite_hbox					; width of collision box
	dc.l	64/2							; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB64						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	64*64*2							; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	64*2							; sprite_bytewid				; width in bytes of one line of sprite data
	dc.l	4								; sprite_animspd				; frame delay between animation changes
	dc.l	31								; sprite_maxframe				; number of frames in animation chain
	dc.l	ani_rept						; sprite_animloop				; repeat or play once
	dc.l	edge_wrap						; sprite_wrap					; wrap on screen exit, or remove
	dc.l	spr_inf							; sprite_timer					; frames sprite is active for (or spr_inf)
	dc.l	spr_linear						; sprite_track					; use 16.16 xadd/yadd or point to 16.16 x/y table
	dc.l	0								; sprite_tracktop				; pointer to loop point in track table (if used)
	dc.l	spr_unscale						; sprite_scaled					; flag for scaleable object
	dc.l	%00100000						; sprite_scale_x				; x scale factor (if scaled)
	dc.l	%00100000						; sprite_scale_y				; y scale factor (if scaled)
	dc.l	-1								; sprite_was_hit				; initially flagged as not hit
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	64*2							; sprite_gwidth					; GFX width (of data)	
	
						
; blobbly 2
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	360,0							; sprite_x						; 16.16 x value to position at
	dc.w	032,0							; sprite_y						; 16.16 y value to position at
	dc.w	-1,$3000						; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	0,$D000						; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	64								; sprite_width					; width of sprite (in pixels)
	dc.l	64								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	64/2							; sprite_hbox					; width of collision box
	dc.l	64/2							; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB64						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	64*64*2							; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	64*2							; sprite_bytewid				; width in bytes of one line of sprite data
	dc.l	1								; sprite_animspd				; frame delay between animation changes
	dc.l	31								; sprite_maxframe				; number of frames in animation chain
	dc.l	ani_rept						; sprite_animloop				; repeat or play once
	dc.l	edge_wrap						; sprite_wrap					; wrap on screen exit, or remove
	dc.l	spr_inf							; sprite_timer					; frames sprite is active for (or spr_inf)
	dc.l	spr_linear						; sprite_track					; use 16.16 xadd/yadd or point to 16.16 x/y table
	dc.l	0								; sprite_tracktop				; pointer to loop point in track table (if used)
	dc.l	spr_unscale						; sprite_scaled					; flag for scaleable object
	dc.l	%00100000						; sprite_scale_x				; x scale factor (if scaled)
	dc.l	%00100000						; sprite_scale_y				; y scale factor (if scaled)
	dc.l	-1								; sprite_was_hit				; initially flagged as not hit
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	64*2							; sprite_gwidth					; GFX width (of data)	
				
; blobbly 3
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	360,0							; sprite_x						; 16.16 x value to position at
	dc.w	268,0							; sprite_y						; 16.16 y value to position at
	dc.w	0,$B000							; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	-1,$4000						; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	64								; sprite_width					; width of sprite (in pixels)
	dc.l	64								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	64/2							; sprite_hbox					; width of collision box
	dc.l	64/2							; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB64						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	64*64*2							; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	64*2							; sprite_bytewid				; width in bytes of one line of sprite data
	dc.l	2								; sprite_animspd				; frame delay between animation changes
	dc.l	31								; sprite_maxframe				; number of frames in animation chain
	dc.l	ani_rept						; sprite_animloop				; repeat or play once
	dc.l	edge_wrap						; sprite_wrap					; wrap on screen exit, or remove
	dc.l	spr_inf							; sprite_timer					; frames sprite is active for (or spr_inf)
	dc.l	spr_linear						; sprite_track					; use 16.16 xadd/yadd or point to 16.16 x/y table
	dc.l	0								; sprite_tracktop				; pointer to loop point in track table (if used)
	dc.l	spr_unscale						; sprite_scaled					; flag for scaleable object
	dc.l	%00100000						; sprite_scale_x				; x scale factor (if scaled)
	dc.l	%00100000						; sprite_scale_y				; y scale factor (if scaled)
	dc.l	-1								; sprite_was_hit				; initially flagged as not hit
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	64*2							; sprite_gwidth					; GFX width (of data)	
					
; blobbly 4
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	-64,0							; sprite_x						; 16.16 x value to position at
	dc.w	032,0							; sprite_y						; 16.16 y value to position at
	dc.w	1,$2000						; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	1,$5000							; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	64								; sprite_width					; width of sprite (in pixels)
	dc.l	64								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	64/2							; sprite_hbox					; width of collision box
	dc.l	64/2							; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB64						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	64*64*2							; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	64*2							; sprite_bytewid				; width in bytes of one line of sprite data
	dc.l	3								; sprite_animspd				; frame delay between animation changes
	dc.l	31								; sprite_maxframe				; number of frames in animation chain
	dc.l	ani_rept						; sprite_animloop				; repeat or play once
	dc.l	edge_wrap						; sprite_wrap					; wrap on screen exit, or remove
	dc.l	spr_inf							; sprite_timer					; frames sprite is active for (or spr_inf)
	dc.l	spr_linear						; sprite_track					; use 16.16 xadd/yadd or point to 16.16 x/y table
	dc.l	0								; sprite_tracktop				; pointer to loop point in track table (if used)
	dc.l	spr_unscale						; sprite_scaled					; flag for scaleable object
	dc.l	%00100000						; sprite_scale_x				; x scale factor (if scaled)
	dc.l	%00100000						; sprite_scale_y				; y scale factor (if scaled)
	dc.l	-1								; sprite_was_hit				; initially flagged as not hit
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	64*2							; sprite_gwidth					; GFX width (of data)	
						
; blobbly 5
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	130,0							; sprite_x						; 16.16 x value to position at
	dc.w	262,0							; sprite_y						; 16.16 y value to position at
	dc.w	-1,$1800						; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	-1,$6800						; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	64								; sprite_width					; width of sprite (in pixels)
	dc.l	64								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	64/2							; sprite_hbox					; width of collision box
	dc.l	64/2							; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB64						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	64*64*2							; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	64*2							; sprite_bytewid				; width in bytes of one line of sprite data
	dc.l	4								; sprite_animspd				; frame delay between animation changes
	dc.l	31								; sprite_maxframe				; number of frames in animation chain
	dc.l	ani_rept						; sprite_animloop				; repeat or play once
	dc.l	edge_wrap						; sprite_wrap					; wrap on screen exit, or remove
	dc.l	spr_inf							; sprite_timer					; frames sprite is active for (or spr_inf)
	dc.l	spr_linear						; sprite_track					; use 16.16 xadd/yadd or point to 16.16 x/y table
	dc.l	0								; sprite_tracktop				; pointer to loop point in track table (if used)
	dc.l	spr_unscale						; sprite_scaled					; flag for scaleable object
	dc.l	%00100000						; sprite_scale_x				; x scale factor (if scaled)
	dc.l	%00100000						; sprite_scale_y				; y scale factor (if scaled)
	dc.l	-1								; sprite_was_hit				; initially flagged as not hit
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	64*2							; sprite_gwidth					; GFX width (of data)	
	
									
; blobbly 6
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	380,0							; sprite_x						; 16.16 x value to position at
	dc.w	202,0							; sprite_y						; 16.16 y value to position at
	dc.w	-1,$3800						; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	-1,$5800						; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	64								; sprite_width					; width of sprite (in pixels)
	dc.l	64								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	64/2							; sprite_hbox					; width of collision box
	dc.l	64/2							; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB64						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	64*64*2							; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	64*2							; sprite_bytewid				; width in bytes of one line of sprite data
	dc.l	5								; sprite_animspd				; frame delay between animation changes
	dc.l	31								; sprite_maxframe				; number of frames in animation chain
	dc.l	ani_rept						; sprite_animloop				; repeat or play once
	dc.l	edge_wrap						; sprite_wrap					; wrap on screen exit, or remove
	dc.l	spr_inf							; sprite_timer					; frames sprite is active for (or spr_inf)
	dc.l	spr_linear						; sprite_track					; use 16.16 xadd/yadd or point to 16.16 x/y table
	dc.l	0								; sprite_tracktop				; pointer to loop point in track table (if used)
	dc.l	spr_unscale						; sprite_scaled					; flag for scaleable object
	dc.l	%00100000						; sprite_scale_x				; x scale factor (if scaled)
	dc.l	%00100000						; sprite_scale_y				; y scale factor (if scaled)
	dc.l	-1								; sprite_was_hit				; initially flagged as not hit
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	64*2							; sprite_gwidth					; GFX width (of data)	
	
			
			
; baby blob 1
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	-100,0							; sprite_x						; 16.16 x value to position at
	dc.w	245,0							; sprite_y						; 16.16 y value to position at
	dc.w	1,0							; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	1,0								; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	32								; sprite_width					; width of sprite (in pixels)
	dc.l	32								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	32/2							; sprite_hbox					; width of collision box
	dc.l	32/2							; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB32						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	32*32*2							; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	32*2							; sprite_bytewid				; width in bytes of one line of sprite data
	dc.l	0								; sprite_animspd				; frame delay between animation changes
	dc.l	31								; sprite_maxframe				; number of frames in animation chain
	dc.l	ani_rept						; sprite_animloop				; repeat or play once
	dc.l	edge_wrap						; sprite_wrap					; wrap on screen exit, or remove
	dc.l	spr_inf							; sprite_timer					; frames sprite is active for (or spr_inf)
	dc.l	spr_linear						; sprite_track					; use 16.16 xadd/yadd or point to 16.16 x/y table
	dc.l	0								; sprite_tracktop				; pointer to loop point in track table (if used)
	dc.l	spr_unscale						; sprite_scaled					; flag for scaleable object
	dc.l	%00100000						; sprite_scale_x				; x scale factor (if scaled)
	dc.l	%00100000						; sprite_scale_y				; y scale factor (if scaled)
	dc.l	-1								; sprite_was_hit				; initially flagged as not hit
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	32*2							; sprite_gwidth					; GFX width (of data)	
			
			
; baby blob - 2
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	200,0							; sprite_x						; 16.16 x value to position at
	dc.w	-40,0							; sprite_y						; 16.16 y value to position at
	dc.w	-1,0								; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	1,0							; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	32								; sprite_width					; width of sprite (in pixels)
	dc.l	32								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	32/2							; sprite_hbox					; width of collision box
	dc.l	32/2							; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB32						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	32*32*2							; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	32*2							; sprite_bytewid				; width in bytes of one line of sprite data
	dc.l	0								; sprite_animspd				; frame delay between animation changes
	dc.l	31								; sprite_maxframe				; number of frames in animation chain
	dc.l	ani_rept						; sprite_animloop				; repeat or play once
	dc.l	edge_wrap						; sprite_wrap					; wrap on screen exit, or remove
	dc.l	spr_inf							; sprite_timer					; frames sprite is active for (or spr_inf)
	dc.l	spr_linear						; sprite_track					; use 16.16 xadd/yadd or point to 16.16 x/y table
	dc.l	0								; sprite_tracktop				; pointer to loop point in track table (if used)
	dc.l	spr_unscale						; sprite_scaled					; flag for scaleable object
	dc.l	%00100000						; sprite_scale_x				; x scale factor (if scaled)
	dc.l	%00100000						; sprite_scale_y				; y scale factor (if scaled)
	dc.l	-1								; sprite_was_hit				; initially flagged as not hit
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	32*2							; sprite_gwidth					; GFX width (of data)	

; big 13
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active					; sprite_active					; sprite active flag
	dc.w	-32,0							; sprite_x						; 16.16 x value to position at
	dc.w	160,0							; sprite_y						; 16.16 y value to position at
	dc.w	-1,$c000						; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	-1,$2000						; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	128								; sprite_width					; width of sprite (in pixels)
	dc.l	128								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	1								; sprite_hbox					; width of collision box
	dc.l	1								; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB128						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	128*128*2						; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	128*2							; sprite_bytewid				; width in bytes of one line of sprite data
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
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	128*2							; sprite_gwidth					; GFX width (of data)	
			
; big 12
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active						; sprite_active					; sprite active flag
	dc.w	132,0							; sprite_x						; 16.16 x value to position at
	dc.w	200,0							; sprite_y						; 16.16 y value to position at
	dc.w	0,$4000							; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	0,$C000							; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	128								; sprite_width					; width of sprite (in pixels)
	dc.l	128								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	1								; sprite_hbox					; width of collision box
	dc.l	1								; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB128						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	128*128*2						; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	128*2							; sprite_bytewid				; width in bytes of one line of sprite data
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
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	128*2							; sprite_gwidth					; GFX width (of data)	
			
; big 11
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active						; sprite_active					; sprite active flag
	dc.w	232,0							; sprite_x						; 16.16 x value to position at
	dc.w	92,0							; sprite_y						; 16.16 y value to position at
	dc.w	-1,$a000						; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	-1,$D000						; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	128								; sprite_width					; width of sprite (in pixels)
	dc.l	128								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	1								; sprite_hbox					; width of collision box
	dc.l	1								; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB128						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	128*128*2						; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	128*2							; sprite_bytewid				; width in bytes of one line of sprite data
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
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	128*2							; sprite_gwidth					; GFX width (of data)	
			
; big 10
	dc.l	1								; (REPEAT COUNTER) 				; Create this many objects of this type (or 1 for a single object)
	dc.l	is_active						; sprite_active					; sprite active flag
	dc.w	45,0							; sprite_x						; 16.16 x value to position at
	dc.w	0,0							; sprite_y						; 16.16 y value to position at
	dc.w	0,$5000						; sprite_xadd					; 16.16 x addition for sprite movement
	dc.w	0,$F000							; sprite_yadd					; 16.16 y addition for sprite movement
	dc.l	128								; sprite_width					; width of sprite (in pixels)
	dc.l	128								; sprite_height					; height of sprite (in pixels)
	dc.l	is_normal						; sprite_flip					; flag for mirroring data left<>right
	dc.l	0								; sprite_coffx					; x offset from center for collision box center
	dc.l	0								; sprite_coffy					; y offset from center for collision box center	
	dc.l	1								; sprite_hbox					; width of collision box
	dc.l	1								; sprite_vbox					; height of collision box
	dc.l	BMP_BLOB128						; sprite_gfxbase				; start of bitmap data
	dc.l	16								; (BIT DEPTH)					; bitmap depth (1/2/4/8/16/24)
	dc.l	is_cry							; (CRY/RGB)						; bitmap GFX type
	dc.l	is_trans						; (TRANSPARENCY)				; bitmap TRANS flag
	dc.l	128*128*2						; sprite_framesz				; size per frame in bytes of sprite data
	dc.l	128*2							; sprite_bytewid				; width in bytes of one line of sprite data
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
	dc.l	no_CLUT							; sprite_CLUT					; no_CLUT (8/16/24 bit) or CLUT (1/2/4 bit)
	dc.l	cant_hit						; sprite_colchk					; if sprite can collide with another
	dc.l	cd_keep							; sprite_remhit					; flag to remove (or keep) on collision
	dc.l	single							; sprite_bboxlink				; single for normal bounding box, else pointer to table
	dc.l	1								; sprite_hitpoint				; Hitpoints before death
	dc.l	2								; sprite_damage					; Hitpoints deducted from target
	dc.l	128*2							; sprite_gwidth					; GFX width (of data)	
			


	dc.b	'STOP'							; end of the current LIST
	
		
; ***************************************************************************************
; *** END OF LISTS **********************************************************************
; ***************************************************************************************
	dc.b	'<RAPTOR>'						; table termination flag

; END OF FILE.

	
	
	
