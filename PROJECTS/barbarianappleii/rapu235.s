;;
;; U235SE Sample Bank
;;
;;
;;

			.dphrase

RAPTOR_samplebank:

sample0:	dc.l	sfx_epee						; start of sample - just the external label to U235 here
			dc.l	sfx_epee_end					; end of sample - the external label to U235 with an added _end suffix
			dc.l	0								; loop - start position
			dc.l	0								; loop - end position
			dc.w	0								; <NULL>
			dc.b	0								; fine tune
s0_vol:		dc.b	192								; volume
			dc.l	8000							; default play rate

sample1:	dc.l	sfx_touche						; start of sample - just the external label to U235 here
			dc.l	sfx_touche_end					; end of sample - the external label to U235 with an added _end suffix
			dc.l	0								; loop - start position
			dc.l	0								; loop - end position
			dc.w	0								; <NULL>
			dc.b	0								; fine tune
s1_vol:		dc.b	192								; volume
			dc.l	8000							; default play rate

sample2:	dc.l	sfx_tete						; start of sample - just the external label to U235 here
			dc.l	sfx_tete_end					; end of sample - the external label to U235 with an added _end suffix
			dc.l	0								; loop - start position
			dc.l	0								; loop - end position
			dc.w	0								; <NULL>
			dc.b	0								; fine tune
s2_vol:		dc.b	192								; volume
			dc.l	8000							; default play rate

sample3:	dc.l	sfx_decapite					; start of sample - just the external label to U235 here
			dc.l	sfx_decapite_end				; end of sample - the external label to U235 with an added _end suffix
			dc.l	0								; loop - start position
			dc.l	0								; loop - end position
			dc.w	0								; <NULL>
			dc.b	0								; fine tune
s3_vol:		dc.b	192								; volume
			dc.l	8000							; default play rate

sample4:	dc.l	sfx_cling						; start of sample - just the external label to U235 here
			dc.l	sfx_cling_end					; end of sample - the external label to U235 with an added _end suffix
			dc.l	0								; loop - start position
			dc.l	0								; loop - end position
			dc.w	0								; <NULL>
			dc.b	0								; fine tune
s4_vol:		dc.b	192								; volume
			dc.l	8000							; default play rate

sample5:	dc.l	sfx_theme						; start of sample - just the external label to U235 here
			dc.l	sfx_theme_end					; end of sample - the external label to U235 with an added _end suffix
			dc.l	0								; loop - start position
			dc.l	0								; loop - end position
			dc.w	0								; <NULL>
			dc.b	0								; fine tune
s9_vol:		dc.b	192								; volume
			dc.l	8000							; default play rate
			
; END OF FILE.
