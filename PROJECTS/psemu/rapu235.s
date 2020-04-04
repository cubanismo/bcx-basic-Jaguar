;;
;; U235SE Sample Bank
;;
;;
;;

			.dphrase

RAPTOR_samplebank:


sample0:	dc.l	rom_choon						; start of sample in ROM file + jagaddressoff
			dc.l	rom_choon_end					; end of sample in ROM file + jagaddressoff
			dc.l	0								; loop - start position
			dc.l	0								; loop - end position
			dc.w	0								; <NULL>
			dc.b	0								; fine tune
s2_vol0:	dc.b	192								; volume
			dc.l	16000							; default play rate
						

; END OF FILE.
