;;
;; U235SE Sample Bank
;;
;;
;;

			.dphrase

RAPTOR_samplebank:

sample0:	dc.l	SFX_WOOF						; start of sample - just the external label to U235 here
			dc.l	SFX_WOOF_end					; end of sample - the external label to U235 with an added _end suffix
			dc.l	0								; loop - start position
			dc.l	0								; loop - end position
			dc.w	0								; <NULL>
			dc.b	0								; fine tune
s0_vol:		dc.b	192								; volume
			dc.l	12000							; default play rate
			
sample1:	dc.l	SFX_LAUGH						; start of sample - just the external label to U235 here
			dc.l	SFX_LAUGH_end					; end of sample - the external label to U235 with an added _end suffix
			dc.l	0								; loop - start position
			dc.l	0								; loop - end position
			dc.w	0								; <NULL>
			dc.b	0								; fine tune
s1_vol:		dc.b	192								; volume
			dc.l	12000							; default play rate
																				
; END OF FILE.
