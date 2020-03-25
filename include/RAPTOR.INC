;;
;; RAPTOR INCLUDE FILE 
;; 
;; DO NOT MODIFY
;;

sprite_tabwidth			equ				188								; bytewidth of a single sprite entry in sprite database (below)
sprite_obj				equ				0								; pointer to object in OL
sprite_active			equ				4								; active flag (-1 = inactive)
sprite_x				equ				8								; x position in 16.16
sprite_y				equ				12								; y position in 16.16
sprite_xadd				equ				16								; x velocity to add in 16.16
sprite_yadd				equ				20								; y velocity to add in 16.16
sprite_flip				equ				24								; if set, add _width to X and set mirror
sprite_width			equ				28								; width of sprite
sprite_height			equ				32								; height of sprite
sprite_vbox				equ				36								; vertical distance from midpoint for collision clipping
sprite_hbox				equ				40								; horizontal distance from midpoint for collision clipping
sprite_gfxbase			equ				44								; pointer to phrase aligned sprite bitmap data
sprite_framesz			equ				48								; size of sprite frame in bytes (offset to next frame)
sprite_framedel			equ				52								; vblanks till next sprite animation frame
sprite_curframe			equ				56								; current frame number (or 0 for no frames)
sprite_maxframe			equ				60								; maximum frame for sprite
sprite_animloop			equ				64								; -1 = loop animation, 1=terminate on loop
sprite_wrap				equ				68								; flag for wrap or disable on leaving screen
sprite_timer			equ				72								; frames to stay alive, or -2 for infinite
sprite_track			equ				76								; -1 = use fract update, else pointer to x.y co-ords
sprite_colchk			equ				80								; -1 = no collision detection
sprite_scaled			equ				84								; -1 = unscaled, 1 = scaled
sprite_scale_x			equ				88								; x-scaler
sprite_scale_y			equ				92								; y-scaler
sprite_CLUT				equ				96								; -1 for no change, else CLUT to use for sprite if <16bit
sprite_animspd			equ				100								; animation speed
sprite_bytewid			equ				104								; width of one scanline of sprite in bytes
sprite_tracktop			equ				108								; loop point for tracking, or -1 for exit
sprite_was_hit			equ				112								; set to +ve if by the collision routine if sprite hit
sprite_coffx			equ				116								; offset from center for bounding box (hbox)
sprite_coffy			equ				120								; offset from center for bounding box (vbox)
sprite_remhit			equ				124								; 1 = remove if hit, else leave onscreen
sprite_bboxlink			equ				128								; -1, or pointer to bounding box link data
sprite_hitpoint			equ				132								; hitpoints of damage to take before removal
sprite_damage			equ				136								; damage to deal
sprite_flash			equ				140								; make sprite blink
sprite_gwidth			equ				144								; graphics width
sprite_rmotion			equ				148								; pointer to RMotion animation
sprite_rmcurfrm			equ				152								; RMotion internal
sprite_rmfrm			equ				156								; RMotion internal
sprite_userdat1			equ				160
sprite_userdat2			equ				164
sprite_userdat3			equ				168
sprite_userdat4			equ				172
sprite_userdat5			equ				176
sprite_userdat6			equ				180
sprite_userdat7			equ				184

particle_tabwidth		equ				44								; bytewidth of a single particle entry in particle database (below)
particle_active			equ				0								; particle in use flag
particle_x				equ				4								; x position in 16.16 format
particle_y				equ 			8								; y position in 16.16 format
particle_angle			equ 			12								; angle (0-511) 0=right
particle_speed			equ				16								; speed of particle 
particle_angspd			equ 			20								; angular speed of particle (+=clockwise/-=anticlock)
particle_colour			equ				24								; initial colour (0-15)
particle_coldec			equ				28								; colour decay rate (in frames)
particle_curdec			equ				32								; counter for above
particle_life			equ				36								; pixel timetime (in frames)
particle_address		equ				40								; position in ram where particle was ploted (used to clear)

;;
;; Human readables for RAPINIT.S
;;

is_active				equ				1								; Object is ACTIVE 
is_inactive				equ 			-1								; Object is INACTIVE
is_normal				equ 			1								; Object is normal orientation
is_flipped				equ 			-1								; Object is flipped Horizontally
ani_rept				equ				-1								; Object will play animation chain looped
ani_once				equ 			1								; Object will play animation chain once, then terminate itself
edge_wrap				equ				1								; Object will wrap when moving off the edge of the screen
edge_ignore				equ				0								; Object will not be removed or wrap when moving off edge of screen
edge_kill				equ				-1								; Object will terminate itself when moving off the edge of the screen
spr_inf					equ 			-2								; Object will stay active until another condition to remove it is met
spr_linear				equ 			-1								; Object will use standard co-ordinates (else points to x/y table)
spr_scale				equ				1								; Object is scaled bitmap
spr_unscale				equ 			-1								; Object is normal bitmap
no_CLUT					equ 			-1								; Object does not use a CLUT (16/24 bit mode)
is_trans				equ 			1								; Object is Transparent
is_opaque				equ 			0								; Object is Opaque
can_hit					equ				1								; Object can be hit
cant_hit				equ 			-1								; Object can't be hit
cd_remove				equ 			1								; Object will be terminated if it collides with another object
cd_keep					equ				-1								; Object will remain if it collides with another object
is_cry					equ 			-1								; Object is CRY16 bitmap
is_RGB					equ				1								; Object is RGB mode
single					equ				-1								; Object only has one bounding box for collision detection, otherwise pointer to multibox data


;; changes for BRA objects
;;
;; set sprite_active to +1 if BRA to be updated, else it will remain as-is

obj_bra_y				equ				sprite_y						; store Y comparison
obj_bra_type			equ				sprite_x						; store BRA type (BAlways, BLess, BMore)
obj_isBRA				equ				sprite_timer					; set to -3 if BRA object
obj_link				equ				sprite_xadd						; jump offset in objects

;;
;; RAPTOR runtime equates
;;

left_edge				equ				32								; used for clipping - DO NOT CHANGE
ob_list					equ				$200000-$8000					; address of Object List
ob_list1				equ				ob_list+$4000					; address of Shadow Object List
vidCRY16				equ				%000							; MASK for CRY mode
vidRGB24				equ				%010							; MASK for RGB24 mode
vidDIRECT16				equ				%100							; MASK for direct16 mode
vidRGB16				equ				%110							; MASK for RGB16 mode
vidENABLE				equ				%1								; MASK for Video ENABLE
vidDISABLE				equ				%0								; MASK for Video DISABLE
vidVARMOD_OFF			equ				%0								; MASK for VARMOD off
vidVARMOD_ON			equ				%1								; MASK for VARMOD on
rcd_normal				equ				1								; RAPTOR Collision Mode flag
rcd_testonly			equ				-1								; RAPTOR Collision Mode flag
PAL_vert_off			equ				28								; Vertical offset to first PAL scanline 
BR_always				equ				2								; Used when building objects
BR_more					equ				1								; Used when building objects
BR_less					equ				0								; Used when building objects
raptor_structwid		equ				148								; Size of a single RAPTOR object in _RAPINIT.S
initial_list			equ				0								; Initial list to display after INIT
sprite_max				equ				512								; Maximum number of sprites
hitmask_flash			equ				-5								; used if collision FLASH enabled
RAPTOR_topclip_line		equ	 			1								; used internally to clip objects on the upper border
		
;;
;; RAPTOR Text Output Command Codes
;;
		
raptor_t_quit			equ				-1								; End of string
raptor_t_lf				equ				-2								; Line Feed
raptor_t_font_idx		equ				-3								; Set Font INDEX
raptor_t_font_siz		equ				-4								; Set Font SIZE
raptor_t_pos_xy			equ				-5								; Set cursor position
raptor_t_home			equ				-6								; Home the cursor
raptor_t_right			equ				-7								; Subspace right 2 pixels

;;
;; RAPTOR EXTERNALS
;;
;; Functions start with RAPTOR_
;; Variables start with raptor_
;;
	.extern		rotary_interval1
	.extern		rotary_interval2
	.extern		rotary_mode1
	.extern		rotary_mdoe2
	.extern		turn_direction1
	.extern		turn_direction2
	.extern 	spin_delta1
	.extern		spin_delta2
	.extern		spin_step1
	.extern		spin_step2
	
	.extern		RAPTOR_GPU_COLLISION
	.extern		RAPTOR_HANDLER
	.extern		RAPTOR_map_update_GPU
	.extern		RAPTOR_particle_injection_GPU
	.extern		RAPTOR_particles_GPU_erase
	.extern		RAPTOR_particles_GPU_plot
	.extern		RAPTOR_update_particles_GPU
	.extern		RAPTOR_U235init
	.extern		RAPTOR_U235stopDSP
	.extern		RAPTOR_U235playsample
	.extern		RAPTOR_U235resetmodule
	.extern		RAPTOR_U235setmodule
	.extern		RAPTOR_U235gomodule_mono
	.extern		RAPTOR_U235gomodule_stereo
	.extern		RAPTOR_U235stopmodule	
	.extern		RAPTOR_U235setpad1
	.extern		RAPTOR_U235setrot1
	.extern		RAPTOR_U235setpad2
	.extern		RAPTOR_U235setrot2	
	.extern		RAPTOR_GFXConvert
	.extern		RAPTOR_mt_init
	.extern		RAPTOR_mt_load
	.extern		RAPTOR_mt_save
	.extern		RAPTOR_d_lz77
	.extern		RAPTOR_call_GPU_code
	.extern		RAPTOR_call_GPU_code_STOP
	.extern		RAPTOR_call_GPU_code_nowait
	.extern		RAPTOR_Install
	.extern		RAPTOR_HWinit
	.extern		RAPTOR_ERROR
	.extern		RAPTOR_InitVideo
	.extern		RAPTOR_Version
	.extern		RAPTOR_init_map_objs
	.extern		RAPTOR_map_set_position
	.extern		RAPTOR_setup_object_xyg
	.extern		RAPTOR_setup_object_xg
	.extern		RAPTOR_setup_object_g
	.extern		RAPTOR_setup_object_xy
	.extern		RAPTOR_setup_object_xyz
	.extern		RAPTOR_setup_object_bra
	.extern		RAPTOR_rmw
	.extern		RAPTOR_setpalt
	.extern		RAPTOR_reflect
	.extern		RAPTOR_CreateObject
	.extern		RAPTOR_particle_init
	.extern		RAPTOR_particle_clear
	.extern		RAPTOR_print
	.extern		RAPTOR_HEXtoDEC
	.extern		RAPTOR_chk_highscores
	.extern		RAPTOR_resort_score_table
	.extern		RAPTOR_start_video
	.extern		RAPTOR_wait_frame
	.extern		RAPTOR_wait_frame_UPDATE_ALL
	.extern		RAPTOR_UPDATE_SPRITES
	.extern		RAPTOR_UPDATE_PARTICLES
	.extern		RAPTOR_UPDATE_ALL
	.extern		RAPTOR_setlist
	.extern		RAPTOR_particle_trigtable
	.extern		RAPTOR_particle_gfxbase
	.extern 	RAPTOR_fade_clut
	.extern		RAPTOR_fade_clutindex
	.extern		RAPTOR_attach_rmotion

	.extern		raptor_fade_delay	
	.extern		raptor_result
	.extern		raptor_targetl
	.extern		raptor_targeth
	.extern		raptor_sourcel
	.extern		raptor_sourceh
	.extern		raptor_type
	.extern		raptor_part_inject_addr
	.extern		raptor_vidmode
	.extern		raptor_videnable
	.extern		raptor_varmod
	.extern		raptor_maptop_obj
	.extern		raptor_tiles_x
	.extern		raptor_tiles_y
	.extern		raptor_tilesperx
	.extern		raptor_tilespery
	.extern		raptor_mapwidth
	.extern		raptor_mapheight
	.extern		raptor_maxparts
	.extern		raptor_mapindex
	.extern		raptor_mapbmptiles
	.extern		raptor_tilerem_mask
	.extern		raptor_partbuf_x
	.extern		raptor_partbuf_y
	.extern		raptor_pdriftx
	.extern		raptor_pdrifty
	.extern		raptor_top_of_bss
	.extern		raptor_trashram
	.extern		raptor_uvbi_jmp
	.extern		raptor_poobjl
	.extern		raptor_probjl
	.extern		raptor_8x8_addr
	.extern		raptor_8x16_addr
	.extern		raptor_16x16_addr
	.extern		raptor_partipal
	.extern		raptor_MTwork
	.extern		raptor_pgfx
	.extern		raptor_pgfxe
	.extern		raptor_spritetab
	.extern		raptor_partitab
	.extern		raptor_mtapp
	.extern		raptor_mtfn
	.extern		raptor_MT_start_address
	.extern		raptor_MT_save_length
	.extern		raptor_inittab
	.extern		raptor_samplebank_ptr
	.extern		raptor_map_position_x
	.extern		raptor_map_position_y
    .extern     raptor_highscores1_hex
    .extern     raptor_highscores1_nam
    .extern     raptor_highscores2_hex
    .extern     raptor_highscores2_nam
    .extern     raptor_highscores3_hex
    .extern     raptor_highscores3_nam
    .extern     raptor_highscores4_hex
    .extern     raptor_highscores4_nam
    .extern     raptor_highscores5_hex
    .extern     raptor_highscores5_nam
	.extern		raptor_mt_present
	.extern		raptor_ticks
	.extern		raptor_liststart
	.extern		raptor_fade_delay
	.extern		raptor_used_particles
	.extern		raptor_free_particles	
	.extern		raptor_ntsc_flag
	.extern		raptor_vbl_time_remain
	.extern		raptor_user_savedata
	.extern		raptor_blitter_use		
	.extern		RAPTOR_blitter
	.extern		raptor_blitlist_ptr
    .extern     RAPTOR_blitter_full
    .extern     RAPTOR_samplebank

;END OF FILE.

