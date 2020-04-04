;;
;; RAPTOR Particle datafile
;;
			blah equ 	4
			blee equ 	-8
			spd equ		6
			life equ	128
			decay equ	10

pixel_list:	dc.l	explode_particles
			dc.l	track_particles
			dc.l	-1

			.phrase
explode_particles:
			dc.l	0,0							; x / y for particle startpoint
			dc.l	16							; number of particles
			
			dc.l	0,spd,blah,15,decay,life				; angle, speed, angular speed, initial colour, colour decay (per frame), pixel life (in frames)
			dc.l	64,spd,blah,15,decay,life
			dc.l	128,spd,blah,15,decay,life
			dc.l	192,spd,blah,15,decay,life
			dc.l	256,spd,blah,15,decay,life
			dc.l	320,spd,blah,15,decay,life
			dc.l	384,spd,blah,15,decay,life
			dc.l	448,spd,blah,15,decay,life

			dc.l	0+32,spd,blee,15,decay,life
			dc.l	64+32,spd,blee,15,decay,life
			dc.l	128+32,spd,blee,15,decay,life
			dc.l	192+32,spd,blee,15,decay,life
			dc.l	256+32,spd,blee,15,decay,life
			dc.l	320+32,spd,blee,15,decay,life
			dc.l	384+32,spd,blee,15,decay,life
			dc.l	448+32,spd,blee,15,decay,life

			.phrase
track_particles:
			dc.l	0,0							; x / y for particle startpoint
			dc.l	1							; number of particles
			
			dc.l	128,3,0,15,1,5				; angle, speed, angular speed, initial colour, colour decay (per frame), pixel life (in frames)

			
;END OF FILE
			
			

			
			
			
			