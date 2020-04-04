;;
;; U235SE Sample Bank
;;
;;
;;

			.dphrase

RAPTOR_samplebank:

sample0:	dc.l	explode_sam		; start of sample
			dc.l	explode_sam_end	; end of sample
			dc.l	0				; repeat offset
			dc.l	0				; repeat length
			dc.w	0				; <NULL>
			dc.b	0				; fine tune
s2_vol:		dc.b	192				; volume
			dc.l	8000			; default play rate
	
						

; END OF FILE.
