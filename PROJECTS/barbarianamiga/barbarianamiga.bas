'_______________BARBARIAN_______________
'__________palace software 1987_________
'______a remake of AMIGA 500 version____
'___________for ATARI Jaguar____________
'____________by F.L in 2018_____________
'_______________________________________
'compil this source with Raptor Basic +_
'_______________________________________
'____thanks to ggn and cyranojones______
'__from atariage forum for the help !___
'_______________________________________
'__for the others roms of barbarian :___
'____http://barbarian.1987.free.fr/_____


' variables de RB+
rlist=(RAPTOR_LIST *)strptr(RAPTOR_sprite_table)
basic_r_size=0 ' taille 
basic_r_indx=0 ' couleur


Input_SetNormalPadMode ' input zerosquare
'dim pad1%
'dim pad2%

dim NoSPRdecor = 0
'textlayer = 1
dim NoSPRtitre = 2
dim NoSPRspriteA = 3
dim NoSPRspriteB = 4
dim NoSPRspriteAmort = 5
dim NoSPRgnome = 6
dim NoSPRombre = 7
dim NoSPRtetes = 8
dim NoSPRarbreG = 9
dim NoSPRarbreD = 10
dim NoSPRfeusang = 11
dim NoSPRserpentG = 12
dim NoSPRserpentD = 13
dim NoSPRcache1 = 14
dim NoSPRcache2 = 15


' chargement des palettes
loadclut(strptr(decorsGFX_clut),0,48) ' palette decors
loadclut(strptr(paletteA_clut),6,16) ' spriteA
loadclut(strptr(SPRgnome_clut),8,16) ' gnome
'loadclut(strptr(arbresGAUCHE_clut),9,16) ' arbres 

'chargement sprite ombre
rsetobj(NoSPRombre,R_sprite_gfxbase,(int)strptr(SPRtetes)+ (128 * 6 ) )




' declaration des variables
DIM GOTOU%

DIM loading%
DIM partie%
DIM demo%
DIM chronometre%
DIM scoreA%
DIM scoreAactuel%
DIM niveauscoreA%
DIM scoreB%
DIM scoreBactuel%
DIM niveauscoreB%
DIM xA%
DIM xB%
DIM yAttA%
DIM xAttA%
DIM yAttB%
DIM xAttB%
DIM yFA%
DIM yFB%
DIM yTA%
DIM yTB%
DIM yMA%
DIM yMB%
DIM yGA%
DIM yGB%
DIM xFA%
DIM xTA%
DIM xMA%
DIM xGA%
DIM xFB%
DIM xTB%
DIM xMB%
DIM xGB%
DIM sens%
DIM joueurA%
DIM joueurB%
DIM decapiteA%
DIM decapiteB%
DIM vieA%
DIM vieB%
DIM vieactuelleA%
DIM vieactuelleB%
DIM temps%
DIM reftemps%
DIM reftempsB%
DIM attenteA%
DIM attenteB%
DIM entree%
DIM Aoccupe%
DIM Boccupe%
DIM spriteA%
DIM spriteB%
DIM spriteavanceA%
DIM spritereculeA%
DIM spriteavanceB%
DIM spritereculeB%
DIM sangA%
DIM sangB%
DIM serpentA%
DIM refserpentA%
DIM serpentB%
DIM refserpentB%
DIM sangdecapA%
DIM sangdecapB%
DIM chrono%
DIM ySPRt%
DIM xSPRt%
'DIM xSPRt2%
'DIM ySPRt2%
DIM gnome%
DIM xGNOME%
DIM xGNOME2%
DIM numerotete%
DIM numerognome%
DIM football%
DIM sortieA%
DIM sortieB%
DIM protegeDA%
DIM protegeDB%
DIM protegeHA%
DIM protegeHB%
DIM tempsfini%
DIM gnometire%
DIM bonusA%
DIM bonusB%
DIM infoBdegatF%
DIM infoBdegatT%
DIM infoBdegatG%
DIM infocoupA%
DIM infocoupB%
DIM infoAdegatF%
DIM infoAdegatT%
DIM infoAdegatG%
DIM jeu%
DIM entreesorcier%
DIM attaqueA%
DIM attaqueB%
DIM transition%
DIM transitionfinie%
DIM afficheFINAL%
DIM choixCLING%
DIM choixTOUCHE%
DIM songrogne%
DIM lancerintro%
DIM easter%
DIM assisA%
DIM assisB%
'DIM sensimageA%
'DIM sensimageB%
DIM arret%
DIM distance%
DIM decorS%
DIM IA%
DIM sorcier%
DIM drax%
DIM marianna%
DIM levier1%
DIM levier2%
DIM couleurok%
DIM couleurtete%

DIM musiqueLOOP%
'DIM toucheMUSIQUE
'DIM delaiMUSIQUE


DIM gnomerigole%
DIM finiderigoler%
DIM sonrigole%
DIM songnome%
'DIM sonpoints%
'DIM hauteur%
'DIM bouton%

' variables de position
dim x1%
dim y1%
dim x2%
dim y2%
DIM positionX%
DIM positionY%
DIM positionSANG
DIM numeroserpent


' variables de lancement du jeu


' demo
partie = 1: decorS = 3: IA = 4: sorcier = 0: marianna = 0: demo = 1

' 1 joueur
'partie = 1: decorS = 2: IA = 0: sorcier = 0: marianna = 0: demo = 0
'partie = 1: decorS = 4: IA = 7: sorcier = 0: marianna = 0: demo = 0 ' sorcier

' mode vs
'partie = 2: decorS = 1: IA = 0: sorcier = 0: marianna = 0: chronometre = 60: demo = 0

'GOTOU = 8 ' menu
loading=0
musiqueLOOP = 0
'delaiMUSIQUE = 0
GOTOU = 100 ' titre


DO

    'menu:
    IF GOTOU = 100 THEN
						
		'cls

		' cacher les sprites
		rlist[NoSPRspriteA].y=700<<16
		rlist[NoSPRspriteB].y=700<<16	
		rlist[NoSPRspriteAmort].y=700<<16
		rlist[NoSPRspriteAmort].x=-64<<16
		rlist[NoSPRgnome].y=700<<16
		rlist[NoSPRombre].y=700<<16
		rlist[NoSPRtetes].y=700<<16		
		rlist[NoSPRarbreG].y=700<<16
		rlist[NoSPRarbreD].y=700<<16
		rlist[NoSPRfeusang].y=700<<16
		rlist[NoSPRserpentG].y=700<<16		
		rlist[NoSPRserpentD].y=700<<16
		rlist[NoSPRcache1].x=-32<<16
		rlist[NoSPRcache2].x=-32<<16

		
		' cacher les points de vie
		basic_r_size=0 ' taille 
		basic_r_indx=0 ' couleur
		RLOCATE 4,8: RPRINT "      ": RLOCATE 4,20: RPRINT "      "		
		RLOCATE 276,8: RPRINT "      ":	RLOCATE 276,20: RPRINT "      "
		' cacher les modes
		RLOCATE 92,208: RPRINT "                  "
			
			
		' affichage du titre.	
		rlist[NoSPRtitre].y=32<<16 		

		IF loading = 0 THEN	temps = 0: loading = 1
			

		IF loading = 1 THEN
			' affichage du titre + attente de 3 secondes
			temps=temps+1		
			if temps > 180 THEN temps = 0: loading = 0: GOTOU = 8
		END IF

    END IF



    'menu:
    IF GOTOU = 8 THEN
						
		basic_r_size=0 ' taille 
		basic_r_indx=0 ' couleur		
		' cacher les points de vie
		RLOCATE 4,8: RPRINT "      ": RLOCATE 4,20: RPRINT "      "		
		RLOCATE 276,8: RPRINT "      ":	RLOCATE 276,20: RPRINT "      "	
		' cacher les modes
		RLOCATE 92,208: RPRINT "                  "
		
		' cacher les sprites
		rlist[NoSPRspriteA].y=700<<16
		rlist[NoSPRspriteB].y=700<<16	
		rlist[NoSPRspriteAmort].y=700<<16
		rlist[NoSPRspriteAmort].x=-64<<16
		rlist[NoSPRgnome].y=700<<16
		rlist[NoSPRombre].y=700<<16		
		rlist[NoSPRtetes].y=700<<16
		rlist[NoSPRarbreG].y=700<<16
		rlist[NoSPRarbreD].y=700<<16
		rlist[NoSPRfeusang].y=700<<16
		rlist[NoSPRserpentG].y=700<<16		
		rlist[NoSPRserpentD].y=700<<16
		rlist[NoSPRcache1].x=-32<<16
		rlist[NoSPRcache2].x=-32<<16

		
		GOTOU = 32

    END IF


    '               *********************************************************
    '               ***************** affichage du decor ********************
    '               *********************************************************

    'decor:
    IF GOTOU = 32 THEN
	
			IF easter = 0 THEN 
				' pour effacer les messages
				basic_r_size=0 ' taille 
				basic_r_indx=0 ' couleur				
				RLOCATE 124,136: RPRINT "          ": RLOCATE 148,144: RPRINT "    "
			END IF
			
			rlist[NoSPRtitre].y=700<<16 ' cacher le titre.


			' choix du decor
			rsetobj(NoSPRdecor,R_sprite_gfxbase,(int)strptr(decorsGFX)+ (64000 * decorS ) ) ' choix de la frame dans la planche 32000 = 320*(200*8)/8

			
		'  affichage de l'arbre gauche
		rsetobj(NoSPRarbreG,R_sprite_gfxbase,(int)strptr(arbresGAUCHE)+ 4096* (decorS-1) ) ' choix de la frame dans la planche 2048 = 64*(64*4)/8
		rlist[NoSPRarbreG].y=136+16<<16
			
		'  affichage de l'arbre droit
		rsetobj(NoSPRarbreD,R_sprite_gfxbase,(int)strptr(arbresDROIT)+ 4096* (decorS-1) )			
		rlist[NoSPRarbreD].y=136+16<<16		

		
		' re-afficher les sprites
		rlist[NoSPRspriteA].y=120+16<<16	'joueurA
		rlist[NoSPRspriteB].y=120+16<<16	'joueurB		


		' affichage des scores
		basic_r_size=0 ' taille 
		basic_r_indx=0 ' couleur		
		if scoreA = 0 THEN RLOCATE 100,71: RPRINT "00000"
		if scoreB = 0 THEN RLOCATE 188,71: RPRINT "00000"
		scoreAactuel = 0' pour re-afficher les scores
		scoreBactuel = 0

		' affichage des points de vie
		RLOCATE 4,8: RPRINT "()()()"
		RLOCATE 4,20: RPRINT "()()()"		
		RLOCATE 276,8: RPRINT "()()()"
		RLOCATE 276,20: RPRINT "()()()"

		
         ' messages du bas d'ecran

		IF partie = 1 AND demo = 0 THEN RLOCATE 112,205: RPRINT "  ONE PLAYER  "
        IF partie = 2 THEN RLOCATE 112,205: RPRINT " TWO PLAYERS  "
		IF demo = 1 THEN RLOCATE 112,205: RPRINT "DEMONSTRATION " 
 		
        GOTOU = 16

    END IF

    '               *********************************************************
    '               *****************    variables       ********************
    '               *********************************************************

    'variables:
	IF GOTOU = 16 THEN
		spriteA=0
		spriteB=0
		GOTOU = 0
		numerognome = 1
		yAttA = 17: xAttA = 15
		yAttB = 17: xAttB = 27
		yFA = 15: yFB = 15:
		yTA = 16: yTB = 16:
		yMA = 18: yMB = 18:
		yGA = 20: yGB = 20:
		xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
		xFB = xB: xTB = xB: xMB = xB: xGB = xB
		sens = 6
		joueurA = 0
		joueurB = 0
		decapiteA = 1
		decapiteB = 1
		vieA = 12
		vieB = 12
		vieactuelleA = 12
		vieactuelleB = 12
		temps = 1
		reftemps = 1
		attenteA = 1
		attenteB = 1
		entree = 1:
		xA = 1: xB = 36
		Aoccupe = 0
		Boccupe = 0
		spriteavanceA = 0
		spritereculeA = 0
		spriteavanceB = 0
		spritereculeB = 0
		sangA = 0
		sangB = 0
		serpentA = 0
		refserpentA = 0
		serpentB = 0
		refserpentB = 0
		sangdecapA = 0
		sangdecapB = 0
		chrono = 1
		ySPRt = 111
		xSPRt = xA + 3
		gnome = 0
		xGNOME = 1
		numerotete = 1
		numerognome = 1
		football = 0
		sortieA = 0
		sortieB = 0
		protegeDA = 0
		protegeDB = 0
		protegeHA = 0
		protegeHB = 0
		tempsfini = 0
		gnometire = 1
		bonusA = 0
		bonusB = 0
		infoBdegatF = 0
		infoBdegatT = 0
		infoBdegatG = 0
		infocoupA = (RND*60)
		'infocoupA = 0
		infocoupB = 0
		infoAdegatF = 0
		infoAdegatT = 0
		infoAdegatG = 0
		jeu = 1
		entreesorcier = 0
		attaqueA = 0
		attaqueB = 0
		couleurok = 0
		
couleurtete = 0
transition = 0
transitionfinie = 0
afficheFINAL = 0
'afficheMARIANNA = 0
choixCLING = 0
choixTOUCHE = 0
songrogne = 0
lancerintro = 0
songnome = 0
numeroserpent = 0 
		
		' choix de couleur de palette des IA
		IF IA = 0 THEN loadclut(strptr(paletteB0_clut),7,16) ' IA0
		IF IA = 1 THEN loadclut(strptr(paletteB1_clut),7,16) ' IA1
		IF IA = 2 THEN loadclut(strptr(paletteB2_clut),7,16) ' IA2
		IF IA = 3 THEN loadclut(strptr(paletteB3_clut),7,16) ' IA3
		IF IA = 4 THEN loadclut(strptr(paletteB4_clut),7,16) ' IA4
		IF IA = 5 THEN loadclut(strptr(paletteB5_clut),7,16) ' IA5
		IF IA = 6 THEN loadclut(strptr(paletteB6_clut),7,16) ' IA6
		IF IA = 7 THEN loadclut(strptr(paletteB7_clut),7,16) ' IA7	


		
		
	END IF

    '                   ************************************
    '                   *******   DEBUT DU JEU    **********
    '                   ************************************



    ' entrees clavier permanentes

		
     '                       ENTREE DES TOUCHES

	'pad1=getpad(1)

    ' arret du jeu
    'IF pad1 band PAD _OPTION THEN arret = 1 ELSE arret = 0
	IF zero_left_pad band Input_Pad_Option THEN arret = 1 ELSE arret = 0

	
    ' message cache
	easter = 0
    'IF pad1 band PAD _A THEN  
	'	IF pad1 band PAD _B THEN easter = 1 
	'END IF	
    IF zero_left_pad band Input_Pad_A THEN 
		IF zero_left_pad band Input_Pad_B THEN easter = 1 'ELSE easter = 0
	END IF






    IF GOTOU = 0 THEN temps = temps + 1 



	

    '                    ************* scenes d'animation************


    IF GOTOU = 0 AND jeu = 2 THEN GOTOU = 23


    IF GOTOU = 0 AND sorcier = 1 THEN
        IF xA <= 10 THEN

            sens = 9: couleurok = 1

            Aoccupe = 1
            joueurA = 777: spriteA = 42: ' joueurA=fini

            Boccupe = 1
            joueurB = 777: marianna = 1: spriteB = 57 ' marianna

            'xAttB=40
            xA = 20: xB = 13

            jeu = 2

            GOTOU = 31

        END IF

        IF GOTOU = 0 THEN GOTOU = 23
    END IF


    IF GOTOU = 0 AND bonusA = 1 THEN
        scoreA = scoreA + 10: chronometre = chronometre - 1
        if scoreA >=1000 THEN
            scoreA = scoreA - 1000: niveauscoreA = niveauscoreA + 1
        END IF
        IF chronometre < 1 THEN
            chronometre = 0: scoreA = scoreA - 10
            IF xB >= 39 THEN sortieA = 1: Aoccupe = 0
        END IF
    END IF

    IF GOTOU = 0 AND bonusB = 1 THEN
        scoreB = scoreB + 10: chronometre = chronometre - 1
        if scoreB >=1000 THEN
            scoreB = scoreB - 1000: niveauscoreB = niveauscoreB + 1
        END IF		
        IF chronometre < 1 THEN
            chronometre = 0: scoreB = scoreB - 10
            IF xA >= 39 THEN sortieB = 1: Boccupe = 0
        END IF
    END IF

    IF GOTOU = 0 AND entree = 1 THEN
        IF xA >= 13 OR xB <= 22 THEN entree = 0
    END IF

    IF GOTOU = 0 AND sortieA = 1 THEN

        IF joueurB = 95 OR joueurB = 910 THEN
            IF xA >= 39 THEN

                '******* round solo gagne en inverse
                IF partie = 1 THEN
                    IF demo = 1 THEN

                        IF transition = 0 THEN transition = 1: reftemps = temps: GOTOU = 31
                        IF GOTOU = 0 AND transitionfinie = 1 THEN
							IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, 0, 0, 0, 0) ' pour aretter les sons
							scoreA = 0: scoreAactuel = 0 : niveauscoreA = 0: scoreB = 0: scoreBactuel = 0: niveauscoreB = 0
                            decorS = decorS +1 ' changer de decor pendant la demo
                            if decorS > 4 THEN decorS = 1								
							GOTOU = 100 ' afficher le titre							
						END IF
                    END IF

                    IF GOTOU = 0 AND transition = 1 THEN GOTOU = 26

                    IF GOTOU = 0 AND transitionfinie = 1 THEN IA = IA + 1

                    IF GOTOU = 0 AND IA > 7 THEN
                        IA = 7: sorcier = 1
                        sens = 9
                        joueurB = 666: joueurA = 94
                        xA = 35: xB = 6
                        entree = 0: sortieA = 0
                        entreesorcier = 1
                        Boccupe = 1:
                        reftempsB = temps
                        couleurok = 0
                        GOTOU = 26
                    END IF
                    ' changement de decor
                    IF GOTOU = 0 THEN
                        IF IA = 0 THEN decorS = 2
                        IF IA = 1 THEN decorS = 1
                        IF IA = 2 THEN decorS = 2
                        IF IA = 3 THEN decorS = 1
                        IF IA = 4 THEN decorS = 3
                        IF IA = 5 THEN decorS = 4
                        IF IA = 6 THEN decorS = 3
                        IF IA = 7 THEN decorS = 4
						
						
                        IF demo = 1 THEN decorS = 1
                    END IF

                    IF GOTOU = 0 AND transitionfinie = 1 THEN GOTOU = 8

                    IF GOTOU = 0 AND sorcier = 0 THEN transition = 1: reftemps = temps: GOTOU = 26
                    IF GOTOU = 0 THEN GOTOU = 8
                END IF

                '******* round VS gagne en inverse
                IF GOTOU = 0 AND partie = 2 THEN
                    IF GOTOU = 0 AND transition = 1 THEN GOTOU = 26
                    IF GOTOU = 0 AND transitionfinie = 1 THEN
                        chronometre = 60
                        IF decorS = 2 THEN decorS = 1: GOTOU = 32
                        IF GOTOU = 0 AND decorS = 1 THEN decorS = 3: GOTOU = 32
                        IF GOTOU = 0 AND decorS = 3 THEN decorS = 4: GOTOU = 32
                        IF GOTOU = 0 AND decorS = 4 THEN decorS = 2: GOTOU = 32
                        IF GOTOU = 0 THEN GOTOU = 32
                    END IF
                    IF GOTOU = 0 THEN transition = 1: reftemps = temps: GOTOU = 26
                END IF
            END IF
        END IF



        IF GOTOU = 0 AND tempsfini = 0 THEN
            IF xA <= 1 AND xB >= 39 THEN
                '******* round solo gagne
                IF partie = 1 THEN
                    IF demo = 1 THEN
                        IF transition = 0 THEN transition = 1: reftemps = temps: GOTOU = 31
                        IF GOTOU = 0 AND transitionfinie = 1 THEN 
							IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, 0, 0, 0, 0) ' pour aretter les sons
							scoreA = 0: scoreAactuel = 0 : niveauscoreA = 0: scoreB = 0: scoreBactuel = 0: niveauscoreB = 0
                            decorS = decorS +1 ' changer de decor pendant la demo
                            if decorS > 4 THEN decorS = 1								
							GOTOU = 100 ' afficher le titre							
						END IF
                    END IF

                    IF GOTOU = 0 AND transition = 1 THEN GOTOU = 31

                    IF GOTOU = 0 AND transitionfinie = 1 THEN IA = IA + 1

                    IF GOTOU = 0 AND IA > 7 THEN
                        IA = 7: sorcier = 1
                        sens = 9
                        joueurB = 666: joueurA = 94
                        xA = 35: xB = 6
                        entree = 0: sortieA = 0
                        entreesorcier = 1
                        Boccupe = 1:
                        reftempsB = temps
                        couleurok = 0
                        GOTOU = 26
                    END IF
                    ' changement de decor
                    IF GOTOU = 0 THEN
                        IF IA = 0 THEN decorS = 2
                        IF IA = 1 THEN decorS = 1
                        IF IA = 2 THEN decorS = 2
                        IF IA = 3 THEN decorS = 1
                        IF IA = 4 THEN decorS = 3
                        IF IA = 5 THEN decorS = 4
                        IF IA = 6 THEN decorS = 3
                        IF IA = 7 THEN decorS = 4
						
                        IF demo = 1 THEN decorS = 1
                    END IF

                    IF GOTOU = 0 AND transitionfinie = 1 THEN GOTOU = 8

                    IF GOTOU = 0 AND sorcier = 0 THEN transition = 1: reftemps = temps: GOTOU = 31
                    IF GOTOU = 0 THEN GOTOU = 8
                END IF

                '******* round VS gagne
                IF GOTOU = 0 AND partie = 2 THEN

                    IF GOTOU = 0 AND transition = 1 THEN GOTOU = 31
                    IF GOTOU = 0 AND transitionfinie = 1 THEN
                        chronometre = 60
                        IF decorS = 2 THEN decorS = 1: GOTOU = 32
                        IF GOTOU = 0 AND decorS = 1 THEN decorS = 3: GOTOU = 32
                        IF GOTOU = 0 AND decorS = 3 THEN decorS = 4: GOTOU = 32
                        IF GOTOU = 0 AND decorS = 4 THEN decorS = 2: GOTOU = 32
                        IF GOTOU = 0 THEN GOTOU = 32
                    END IF

                    IF GOTOU = 0 THEN transition = 1: reftemps = temps: GOTOU = 31

                END IF
            END IF
        END IF

        IF GOTOU = 0 AND tempsfini = 1 THEN

            IF sens = 6 THEN
                IF xA < 1 AND xB >= 39 THEN
                    chronometre = 60
                    GOTOU = 32 'ex16
                END IF
            END IF
            IF GOTOU = 0 AND sens = 9 THEN
                IF xB < 1 AND xA >= 39 THEN
                    chronometre = 60
                    GOTOU = 32 'ex16
                END IF
            END IF

        END IF

        IF GOTOU = 0 THEN GOTOU = 22
    END IF

    IF GOTOU = 0 AND sortieB = 1 THEN
        IF xB < 1 THEN
            IF joueurA = 95 OR joueurA = 910 THEN

                '********** partie solo perdue par mort inversee
                IF partie = 1 THEN
                    IF demo = 1 THEN
                        IF transition = 0 THEN transition = 1: reftemps = temps: GOTOU = 31
                        IF GOTOU = 0 AND transitionfinie = 1 THEN 
							IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, 0, 0, 0, 0) ' pour aretter les sons
							scoreA = 0: scoreAactuel = 0 : niveauscoreA = 0: scoreB = 0: scoreBactuel = 0: niveauscoreB = 0
                            decorS = decorS +1 ' changer de decor pendant la demo
                            if decorS > 4 THEN decorS = 1								
							GOTOU = 100 ' afficher le titre							
						END IF							
                    END IF

                    IF GOTOU = 0 AND transition = 1 THEN GOTOU = 31
                    IF GOTOU = 0 AND transitionfinie = 1 THEN
                        IA = 0: scoreA = 0: scoreAactuel = 0 : niveauscoreA = 0: scoreB = 0: scoreBactuel = 0: niveauscoreB = 0
                        decorS = 2: GOTOU = 8 ' version AMIGA
                    END IF

                    IF GOTOU = 0 AND sorcier = 0 THEN transition = 1: reftemps = temps: GOTOU = 31

                    IF GOTOU = 0 THEN GOTOU = 8

                END IF

                '******* round VS perdu en inverse
                IF GOTOU = 0 AND partie = 2 THEN
                    IF GOTOU = 0 AND transition = 1 THEN GOTOU = 31
                    IF GOTOU = 0 AND transitionfinie = 1 THEN
                        chronometre = 60
                        IF decorS = 2 THEN decorS = 1: GOTOU = 32
                        IF GOTOU = 0 AND decorS = 1 THEN decorS = 3: GOTOU = 32
                        IF GOTOU = 0 AND decorS = 3 THEN decorS = 4: GOTOU = 32
                        IF GOTOU = 0 AND decorS = 4 THEN decorS = 2: GOTOU = 32
                        IF GOTOU = 0 THEN GOTOU = 32
                    END IF
                    IF GOTOU = 0 AND sorcier = 0 THEN transition = 1: reftemps = temps: GOTOU = 31

                END IF
            END IF
        END IF



        IF GOTOU = 0 AND tempsfini = 0 THEN
            IF xA >= 39 AND xB >= 39 THEN
                '********** partie solo perdue
                IF partie = 1 THEN
                    IF demo = 1 THEN
                        IF transition = 0 THEN transition = 1: reftemps = temps: GOTOU = 31
                        IF GOTOU = 0 AND transitionfinie = 1 THEN
							IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, 0, 0, 0, 0) ' pour aretter les sons
							scoreA = 0: scoreAactuel = 0 : niveauscoreA = 0: scoreB = 0: scoreBactuel = 0: niveauscoreB = 0
                            decorS = decorS +1 ' changer de decor pendant la demo
                            if decorS > 4 THEN decorS = 1								
							GOTOU = 100 ' afficher le titre
						END IF
                    END IF

                    IF GOTOU = 0 AND transition = 1 THEN GOTOU = 31
                    IF GOTOU = 0 AND transitionfinie = 1 THEN
                        IA = 0: scoreA = 0: scoreAactuel = 0 : niveauscoreA = 0: scoreB = 0: scoreBactuel = 0: niveauscoreB = 0
                        decorS = 2: GOTOU = 8 ' version AMIGA
                    END IF

                    IF GOTOU = 0 AND sorcier = 0 THEN transition = 1: reftemps = temps: GOTOU = 31
                    IF GOTOU = 0 THEN GOTOU = 8
                END IF

                '******* round VS perdu
                IF GOTOU = 0 AND partie = 2 THEN
                    IF GOTOU = 0 AND transition = 1 THEN GOTOU = 31
                    IF GOTOU = 0 AND transitionfinie = 1 THEN
                        chronometre = 60
                        IF decorS = 2 THEN decorS = 1: GOTOU = 32
                        IF GOTOU = 0 AND decorS = 1 THEN decorS = 3: GOTOU = 32
                        IF GOTOU = 0 AND decorS = 3 THEN decorS = 4: GOTOU = 32
                        IF GOTOU = 0 AND decorS = 4 THEN decorS = 2: GOTOU = 32
                        IF GOTOU = 0 THEN GOTOU = 32
                    END IF
                    IF GOTOU = 0 AND sorcier = 0 THEN transition = 1: reftemps = temps: GOTOU = 31

                END IF
            END IF
        END IF
        IF GOTOU = 0 THEN GOTOU = 21
    END IF

    IF GOTOU = 0 AND gnome = 1 THEN GOTOU = 12




    '                   ************************************
    '                   *******GESTION DES DEGATS***********
    '                   ************************************

    'degats:
    IF GOTOU = 23 THEN GOTOU = 0


    'degats sur joueurA

    IF GOTOU = 0 AND sorcier = 1 THEN

        IF xA < 31 THEN
            IF xAttB >= xTA AND xAttB <= xA + 2 THEN
                IF yAttB = yTA THEN
                    gnome = 0
                    IF jeu = 0 THEN GOTOU = 26
                    IF GOTOU = 0 THEN joueurA = 6500: Aoccupe = 1: reftemps = temps: sangA = 0
                    IF GOTOU = 0 THEN joueurB = 6660: spriteB = 55: Boccupe = 1: reftempsB = temps: sangB = 0 ' sorcierfini
                    IF GOTOU = 0 THEN jeu = 0: GOTOU = 26
                END IF
            END IF

            IF GOTOU = 0 AND xAttB >= xGA THEN
                IF yAttB = yGA THEN
                    gnome = 0
                    IF jeu = 0 THEN GOTOU = 26
                    IF GOTOU = 0 THEN joueurA = 6500: Aoccupe = 1: reftemps = temps: sangA = 0
                    IF GOTOU = 0 THEN joueurB = 6660: spriteB = 55: Boccupe = 1: reftempsB = temps: sangB = 0
                    IF GOTOU = 0 THEN jeu = 0: GOTOU = 26
                END IF
            END IF
        END IF

        IF GOTOU = 0 AND Aoccupe = 1 THEN GOTOU = 26
        IF GOTOU = 0 THEN sangA = 0: GOTOU = 22

    END IF


    IF GOTOU = 0 AND sens = 6 THEN
        IF xA < xB THEN
            IF xAttB <= xFA AND yAttB = yFA THEN
				positionSANG = yFA
                IF joueurA = 613 THEN joueurA = 20002: GOTOU = 26
                IF GOTOU = 0 THEN joueurA = 619: infoAdegatF = infoAdegatF + 1: GOTOU = 26
            END IF

            IF GOTOU = 0 AND xAttB <= xTA AND yAttB = yTA THEN
				positionSANG = yTA			
                IF joueurB = 617 THEN joueurA = 619: GOTOU = 26
                IF GOTOU = 0 THEN joueurA = 620: scoreB = scoreB + 250: infoAdegatT = infoAdegatT + 1: GOTOU = 26
            END IF

            IF GOTOU = 0 AND xAttB <= xMA AND yAttB = yMA THEN
				positionSANG = yMA			
                IF joueurA = 612 THEN joueurA = 2000: GOTOU = 26
                IF GOTOU = 0 THEN joueurA = 620: scoreB = scoreB + 250: GOTOU = 26
            END IF

            IF GOTOU = 0 AND xAttB <= xGA AND yAttB = yGA THEN
				positionSANG = yGA			
                IF joueurB = 618 THEN joueurA = 619: GOTOU = 26
                IF GOTOU = 0 AND joueurB = 615 THEN joueurA = 619: GOTOU = 26
                IF GOTOU = 0 AND joueurA = 612 THEN joueurA = 2000: GOTOU = 26
                IF GOTOU = 0 AND joueurB = 611 THEN joueurA = 619: infoAdegatG = infoAdegatG + 1: GOTOU = 26
                IF GOTOU = 0 THEN joueurA = 620: scoreB = scoreB + 100: infoAdegatG = infoAdegatG + 1: GOTOU = 26
            END IF
        END IF
    END IF

    IF GOTOU = 0 AND sens = 9 THEN
        IF xA > xB THEN
            IF xAttB >= xFA AND yAttB = yFA THEN
				positionSANG = yFA			
                IF joueurA = 913 THEN joueurA = 20002: GOTOU = 26
                IF GOTOU = 0 THEN joueurA = 919: infoAdegatF = infoAdegatF + 1: GOTOU = 26
            END IF

            IF GOTOU = 0 AND xAttB >= xTA AND yAttB = yTA THEN
				positionSANG = yTA			
                IF joueurB = 917 THEN joueurA = 919: GOTOU = 26
                IF GOTOU = 0 THEN joueurA = 920: scoreB = scoreB + 250: infoAdegatT = infoAdegatT + 1: GOTOU = 26
            END IF
            IF GOTOU = 0 AND xAttB >= xMA AND yAttB = yMA THEN
				positionSANG = yMA			
                IF joueurA = 912 THEN joueurA = 2000: GOTOU = 26
                IF GOTOU = 0 THEN joueurA = 920: scoreB = scoreB + 250: GOTOU = 26
            END IF
            IF GOTOU = 0 AND xAttB >= xGA AND yAttB = yGA THEN
				positionSANG = yGA			
                IF joueurB = 918 THEN joueurA = 919: GOTOU = 26
                IF GOTOU = 0 AND joueurB = 915 THEN joueurA = 919: GOTOU = 26
                IF GOTOU = 0 AND joueurA = 912 THEN joueurA = 2000: GOTOU = 26
                IF GOTOU = 0 AND joueurB = 911 THEN joueurA = 919: infoAdegatG = infoAdegatG + 1: GOTOU = 26
                IF GOTOU = 0 THEN joueurA = 920: scoreB = scoreB + 100: infoAdegatG = infoAdegatG + 1: GOTOU = 26
            END IF
        END IF
    END IF


    IF GOTOU = 0 AND Aoccupe = 1 THEN GOTOU = 26
    IF GOTOU = 0 THEN sangA = 0


    '               *********************************************************
    '               ***************** evenements clavier ********************
    '               *********************************************************


    'clavier:
    IF GOTOU = 22 THEN GOTOU = 0



    '                       remise a zero  du pave virtuel
    IF GOTOU = 0 THEN

        x1 = 7: y1 = 7
        levier1 = 5 ' neutre

        IF demo = 0 THEN
		
			'pad1=getpad(1)
 
		
            '                       ENTREE DES TOUCHES

            'IF pad1 band PAD_LEFT THEN x1 = x1 - 1
			IF zero_left_pad band Input_Pad_Left THEN x1 = x1 - 1
            'IF pad1 band PAD_RIGHT THEN x1 = x1 + 1
			IF zero_left_pad band Input_Pad_Right THEN x1 = x1 + 1
            'IF pad1 band PAD_DOWN THEN y1 = y1 + 1
			IF zero_left_pad band Input_Pad_Down THEN y1 = y1 + 1
            'IF pad1 band PAD_UP THEN y1 = y1 - 1
			IF zero_left_pad band Input_Pad_Up THEN y1 = y1 - 1
			
			
            ' touche A
            'IF pad1 band PAD_A THEN attaqueA = 1 ELSE attaqueA = 0
			IF zero_left_pad band Input_Pad_A THEN attaqueA = 1 ELSE attaqueA = 0



            '                       amplitude du pave virtuel
            IF y1 > 9 THEN y1 = 9
            IF y1 < 5 THEN y1 = 5
            IF x1 > 9 THEN x1 = 9
            IF x1 < 5 THEN x1 = 5


            '                        position du "levier"  virtuel


                IF x1 = 6 AND y1 = 6 THEN levier1 = 1
                ' hautG
                IF x1 = 8 AND y1 = 6 THEN levier1 = 3
                ' hautD
                IF x1 = 6 AND y1 = 8 THEN levier1 = 7
                'basG
                IF x1 = 8 AND y1 = 8 THEN levier1 = 9
                'basD
                IF x1 = 6 AND y1 = 7 THEN levier1 = 4
                'gauche
                IF x1 = 8 AND y1 = 7 THEN levier1 = 6
                'droite
                IF x1 = 7 AND y1 >= 8 THEN levier1 = 8
                'bas
                IF x1 = 7 AND y1 = 6 THEN levier1 = 2
                'haut

        END IF


    END IF
    '                       **********************************
    '                       ******* animations  auto *********
    '                       **********************************

    IF GOTOU = 0 AND entree = 1 THEN
        IF lancerintro = 0 THEN
			lancerintro = 1 
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_prepare), (strptr(sfx_prepare_end)-strptr(sfx_prepare)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
	'		' speed of sfx at 7694 for jaguar and 11542 for emulators			
		END IF
		IF serpentA = 0 AND xA <= 2 THEN serpentA = 1: refserpentA = temps: serpentB = 1: refserpentB = temps ' faire crier les serpents
        levier1 = 6: GOTOU = 25
    END IF

    IF GOTOU = 0 AND sortieA = 1 THEN
        IF sens = 9 THEN levier1 = 6: GOTOU = 25
        IF GOTOU = 0 THEN sens = 6: levier1 = 4: GOTOU = 25
    END IF

    IF GOTOU = 0 AND entreesorcier = 1 THEN
        IF serpentA = 0 AND xA >= 33 THEN serpentA = 1: refserpentA = temps: serpentB = 1: refserpentB = temps ' faire crier les serpents
		IF GOTOU = 0 AND xA <= 29 THEN entreesorcier = 0: GOTOU = 26
        IF GOTOU = 0 THEN levier1 = 4: GOTOU = 25
    END IF

    '                   ************************************
    '                   **********   MODE DEMO   ***********
    '                   ************************************



    IF GOTOU = 0 AND demo = 1 THEN

        IF sens = 6 THEN
            distance = xB - xA

            IF distance >= 15 THEN '  quand trop loin
                joueurA = 615: reftemps = temps: Aoccupe = 1: GOTOU = 26
            END IF


            IF GOTOU = 0 AND distance = 12 AND joueurB = 64 THEN joueurA = 61400: reftemps = temps: Aoccupe = 1: GOTOU = 26

            IF GOTOU = 0 AND distance = 9 THEN
                IF GOTOU = 0 AND attenteB > 25 THEN joueurA = 61400: reftemps = temps: Aoccupe = 1: GOTOU = 26
                IF GOTOU = 0 AND joueurB = 6150 THEN joueurA = 68: reftemps = temps: Aoccupe = 1: GOTOU = 26
                IF GOTOU = 0 AND Boccupe = 1 THEN joueurA = 615: reftemps = temps: Aoccupe = 1: GOTOU = 26
            END IF

            IF GOTOU = 0 AND distance < 9 AND distance > 6 THEN ' distance de combat 1

                ' pour se rapprocher
                IF joueurB = 6150 THEN joueurA = 68: reftemps = temps: Aoccupe = 1: GOTOU = 26
                IF GOTOU = 0 AND levier2 = 4 THEN joueurA = 618: reftemps = temps: Aoccupe = 1: GOTOU = 26

                IF GOTOU = 0 AND joueurB = 67 THEN joueurA = 613: reftemps = temps: GOTOU = 26


                'pour eviter les degats repetitifs
                IF GOTOU = 0 AND infoAdegatG > 4 THEN
                    IF joueurB = 61002 OR joueurB = 68 THEN joueurA = 68: reftemps = temps: Aoccupe = 1: GOTOU = 26
                END IF
                IF GOTOU = 0 AND infoAdegatG > 2 THEN
                    IF joueurB = 61002 OR joueurB = 68 THEN joueurA = 615: reftemps = temps: Aoccupe = 1: GOTOU = 26
                END IF

                IF GOTOU = 0 AND infoAdegatT > 2 THEN
                    IF joueurB = 63 THEN joueurA = 68: reftemps = temps: Aoccupe = 1: GOTOU = 26
                END IF

                IF GOTOU = 0 AND infoAdegatF > 2 THEN
                    IF joueurB = 67 THEN joueurA = 615: reftemps = temps: Aoccupe = 1: GOTOU = 26
                END IF

                'pour alterner les attaques

                IF GOTOU = 0 AND infocoupA < 10 THEN infocoupA = (RND*60): joueurA = 66: reftemps = temps: Aoccupe = 1: GOTOU = 26
                IF GOTOU = 0 AND infocoupA >= 10 AND infocoupA < 20 THEN infocoupA = (RND*60): joueurA = 67: reftemps = temps: Aoccupe = 1: GOTOU = 26
                IF GOTOU = 0 AND infocoupA >= 20 AND infocoupA < 30 THEN infocoupA = (RND*60): joueurA = 618: reftemps = temps: Aoccupe = 1: GOTOU = 26
                IF GOTOU = 0 AND infocoupA >= 30 AND infocoupA < 40 THEN infocoupA = (RND*60): joueurA = 618: reftemps = temps: Aoccupe = 1: GOTOU = 26
                IF GOTOU = 0 AND infocoupA >= 40 AND infocoupA < 50 THEN infocoupA = (RND*60): joueurA = 63: reftemps = temps: Aoccupe = 1: GOTOU = 26
                IF GOTOU = 0 AND infocoupA >= 50 THEN infocoupA = 0: levier1 = 4:  GOTOU = 25
                ' non aleatoire
				'IF GOTOU = 0 AND infocoupA = 0 THEN joueurA = 66: infocoupA = infocoupA + 1: reftemps = temps: Aoccupe = 1: GOTOU = 26
                'IF GOTOU = 0 AND infocoupA = 1 THEN joueurA = 67: infocoupA = infocoupA + 1: reftemps = temps: Aoccupe = 1: GOTOU = 26
                'IF GOTOU = 0 AND infocoupA = 2 THEN joueurA = 618: infocoupA = infocoupA + 1: reftemps = temps: Aoccupe = 1: GOTOU = 26
                'IF GOTOU = 0 AND infocoupA = 3 THEN joueurA = 618: infocoupA = infocoupA + 1: reftemps = temps: Aoccupe = 1: GOTOU = 26
                'IF GOTOU = 0 AND infocoupA = 4 THEN joueurA = 63: infocoupA = infocoupA + 1: reftemps = temps: Aoccupe = 1: GOTOU = 26
                'IF GOTOU = 0 AND infocoupA = 5 THEN levier1 = 4: infocoupA = 0: GOTOU = 25
            END IF

            IF GOTOU = 0 AND distance <= 6 THEN

                IF joueurB = 66 THEN joueurA = 612: reftemps = temps: GOTOU = 26

                IF GOTOU = 0 AND infoAdegatG > 4 THEN
                    IF joueurB = 61002 OR joueurB = 68 THEN joueurA = 68: reftemps = temps: Aoccupe = 1: GOTOU = 26
                END IF
                IF GOTOU = 0 AND infoAdegatG > 2 THEN
                    IF joueurB = 611 THEN joueurA = 615: reftemps = temps: Aoccupe = 1: GOTOU = 26
                    IF GOTOU = 0 AND joueurB = 61002 OR joueurB = 68 THEN joueurA = 615: reftemps = temps: Aoccupe = 1: GOTOU = 26
                END IF

                IF GOTOU = 0 AND infocoupA < 10 THEN infocoupA = (RND*60): joueurA = 611: reftemps = temps: Aoccupe = 1: GOTOU = 26
                IF GOTOU = 0 AND infocoupA >= 10 AND infocoupA < 20 THEN infocoupA = (RND*60): joueurA = 617: reftemps = temps: Aoccupe = 1: GOTOU = 26
                IF GOTOU = 0 AND infocoupA >= 20 AND infocoupA < 30 THEN infocoupA = (RND*60): joueurA = 618: reftemps = temps: Aoccupe = 1: GOTOU = 26
                IF GOTOU = 0 AND infocoupA >= 30 AND infocoupA < 40 THEN infocoupA = (RND*60): joueurA = 68: reftemps = temps: Aoccupe = 1: GOTOU = 26
                IF GOTOU = 0 AND infocoupA >= 40 AND infocoupA < 50 THEN infocoupA = (RND*60): joueurA = 68: reftemps = temps: Aoccupe = 1: GOTOU = 26
                IF GOTOU = 0 AND infocoupA >= 50 THEN infocoupA = 0: levier1 = 4:  GOTOU = 25
				'non aleatoire
                'IF GOTOU = 0 AND infocoupA = 0 THEN joueurA = 611: infocoupA = infocoupA + 1: reftemps = temps: Aoccupe = 1: GOTOU = 26
                'IF GOTOU = 0 AND infocoupA = 1 THEN joueurA = 617: infocoupA = infocoupA + 1: reftemps = temps: Aoccupe = 1: GOTOU = 26
                'IF GOTOU = 0 AND infocoupA = 2 THEN joueurA = 618: infocoupA = infocoupA + 1: reftemps = temps: Aoccupe = 1: GOTOU = 26
                'IF GOTOU = 0 AND infocoupA = 3 THEN joueurA = 68: infocoupA = infocoupA + 1: reftemps = temps: Aoccupe = 1: GOTOU = 26
                'IF GOTOU = 0 AND infocoupA = 4 THEN joueurA = 68: infocoupA = infocoupA + 1: reftemps = temps: Aoccupe = 1: GOTOU = 26
                'IF GOTOU = 0 AND infocoupA = 5 THEN levier1 = 4: infocoupA = 0: GOTOU = 25

				
            END IF

        END IF


        IF GOTOU = 0 AND sens = 9 THEN GOTOU = 8

    END IF



    '                       redirection suivant les touches

    IF GOTOU = 0 AND levier1 = 1 THEN GOTOU = 25
    IF GOTOU = 0 AND levier1 = 3 THEN GOTOU = 25
    IF GOTOU = 0 AND levier1 = 7 THEN GOTOU = 25
    IF GOTOU = 0 AND levier1 = 9 THEN GOTOU = 25
    IF GOTOU = 0 AND levier1 = 2 THEN GOTOU = 25
    IF GOTOU = 0 AND levier1 = 8 THEN GOTOU = 25
    IF GOTOU = 0 AND levier1 = 4 THEN GOTOU = 25
    IF GOTOU = 0 AND levier1 = 6 THEN GOTOU = 25


    '                       action si aucune touche n'a ete touchee
    IF GOTOU = 0 THEN
        spriteavanceA = 0
        spritereculeA = 0

        protegeDA = 0: protegeHA = 0

        attenteA = attenteA + 1
        levier1 = 5:
    END IF

    ' pour se relever
    IF GOTOU = 0 THEN assisA = 0
    IF GOTOU = 0 AND joueurA = 61002 THEN joueurA = 61000: Aoccupe = 1: reftemps = temps: GOTOU = 26
    IF GOTOU = 0 AND joueurA = 9102 THEN joueurA = 9106: Aoccupe = 1: reftemps = temps: GOTOU = 26


    'attente des 5 secondes
    IF GOTOU = 0 AND sens = 6 THEN
        IF attenteA > 300 THEN joueurA = 1: Aoccupe = 1: reftemps = temps: GOTOU = 26
    END IF
    IF GOTOU = 0 AND sens = 9 THEN
        IF attenteA > 300 THEN joueurA = 91: Aoccupe = 1: reftemps = temps: GOTOU = 26
    END IF

    ' etat debout
    IF GOTOU = 0 AND sens = 6 THEN joueurA = 0
    IF GOTOU = 0 AND sens = 9 THEN joueurA = 94

    IF GOTOU = 0 THEN GOTOU = 26



    '               *********************************************************
    '               ***************** ACTIONS suivant clavier ***************
    '               *********************************************************

    'action:
    IF GOTOU = 25 THEN GOTOU = 0

    IF GOTOU = 0 THEN attenteA = 1 ' remise a zero de l'attente


    '                       droite,gauche, decapite, devant (normal)


    IF GOTOU = 0 AND sens = 6 THEN
        IF levier1 = 6 THEN
            protegeDA = 0
			IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND entree = 0 THEN joueurA = 66: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 AND spriteavanceA = 1 THEN joueurA = 3: GOTOU = 26
            IF GOTOU = 0 AND spriteavanceA = 2 THEN joueurA = 4: GOTOU = 26
            IF GOTOU = 0 AND spriteavanceA = 3 THEN joueurA = 5: GOTOU = 26
            IF GOTOU = 0 AND spriteavanceA = 4 THEN joueurA = 6: GOTOU = 26			
            IF GOTOU = 0 THEN joueurA = 2: reftemps = temps: GOTOU = 26
            
        END IF

        IF GOTOU = 0 AND levier1 = 4 THEN
            protegeHA = 0
            IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND sortieA = 0 THEN joueurA = 61400: Aoccupe = 1: reftemps = temps: GOTOU = 26
			IF GOTOU = 0 AND spritereculeA = 1 THEN joueurA = 8: GOTOU = 26
            IF GOTOU = 0 AND spritereculeA = 2 THEN joueurA = 9: GOTOU = 26
            IF GOTOU = 0 AND spritereculeA = 3 THEN joueurA = 10: GOTOU = 26
            IF GOTOU = 0 AND spritereculeA = 4 THEN joueurA = 11: GOTOU = 26			
            IF GOTOU = 0 THEN joueurA = 7: reftemps = temps: GOTOU = 26
            
        END IF
    END IF

    '                       droite, gauche, decapite, devant (inverse)

    IF GOTOU = 0 AND sens = 9 THEN
        IF levier1 = 6 THEN
            protegeHA = 0
			IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND sortieA = 0 THEN joueurA = 9140: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 AND spritereculeA = 1 THEN joueurA = 9901: GOTOU = 26
            IF GOTOU = 0 AND spritereculeA = 2 THEN joueurA = 9902: GOTOU = 26
            IF GOTOU = 0 AND spritereculeA = 3 THEN joueurA = 9903: GOTOU = 26
            IF GOTOU = 0 AND spritereculeA = 4 THEN joueurA = 9904: GOTOU = 26			
            IF GOTOU = 0 THEN joueurA = 990: reftemps = temps: GOTOU = 26
            
        END IF

        IF GOTOU = 0 AND levier1 = 4 THEN
            protegeDA = 0
			IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND entreesorcier = 0 THEN joueurA = 96: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 AND spriteavanceA = 1 THEN joueurA = 991: GOTOU = 26
            IF GOTOU = 0 AND spriteavanceA = 2 THEN joueurA = 992: GOTOU = 26
            IF GOTOU = 0 AND spriteavanceA = 3 THEN joueurA = 993: GOTOU = 26
            IF GOTOU = 0 AND spriteavanceA = 4 THEN joueurA = 994: GOTOU = 26			
            IF GOTOU = 0 THEN joueurA = 99: reftemps = temps: GOTOU = 26
            
        END IF
    END IF

    '                           saute, attaque cou

    IF GOTOU = 0 AND sens = 6 THEN
        IF GOTOU = 0 AND levier1 = 2 THEN
            protegeDA = 0: protegeHA = 0
			IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 63: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 THEN joueurA = 616: Aoccupe = 1: reftemps = temps: GOTOU = 26
        END IF
    END IF

    IF GOTOU = 0 AND sens = 9 THEN
        IF levier1 = 2 THEN
            protegeDA = 0: protegeHA = 0
			IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 93: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 THEN joueurA = 916: Aoccupe = 1: reftemps = temps: GOTOU = 26
        END IF
    END IF



    '                               assis, attaque genou
    IF GOTOU = 0 AND sens = 6 THEN
        IF levier1 = 8 THEN
            IF attaqueA = 1 AND demo = 0 THEN joueurA = 68: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 AND assisA = 1 THEN joueurA = 61002: GOTOU = 26
            IF GOTOU = 0 THEN joueurA = 6100: Aoccupe = 1: reftemps = temps: GOTOU = 26
        END IF
    END IF
    IF GOTOU = 0 AND sens = 9 THEN
        IF levier1 = 8 THEN
            IF attaqueA = 1 AND demo = 0 THEN joueurA = 98: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 AND assisA = 1 THEN joueurA = 9102: GOTOU = 26
            IF GOTOU = 0 THEN joueurA = 9100: Aoccupe = 1: reftemps = temps: GOTOU = 26
        END IF
    END IF


    '                               roulade AV, coup de pied
    IF GOTOU = 0 AND sens = 6 THEN
        IF levier1 = 9 THEN
			IF attaqueA = 1 AND demo = 0 THEN joueurA = 611: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 THEN joueurA = 615: Aoccupe = 1: reftemps = temps: GOTOU = 26           
        END IF
    END IF
    IF GOTOU = 0 AND sens = 9 THEN
        IF levier1 = 7 THEN
			IF attaqueA = 1 AND demo = 0 THEN joueurA = 911: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 THEN joueurA = 915: Aoccupe = 1: reftemps = temps: GOTOU = 26           
        END IF
    END IF



    '                               roulade AR, coup sur front
    IF GOTOU = 0 AND sens = 6 THEN
        IF levier1 = 7 THEN
			IF attaqueA = 1 AND demo = 0 THEN joueurA = 67: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 THEN joueurA = 6150: Aoccupe = 1: reftemps = temps: GOTOU = 26            
        END IF
    END IF
    IF GOTOU = 0 AND sens = 9 THEN
        IF levier1 = 9 THEN
			IF attaqueA = 1 AND demo = 0 THEN joueurA = 97: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 THEN joueurA = 9159: Aoccupe = 1: reftemps = temps: GOTOU = 26            
        END IF
    END IF

    '                                   protection Haute, araignee
    IF GOTOU = 0 AND sens = 6 THEN
        IF levier1 = 1 THEN
			IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 618: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 AND protegeHA = 1 THEN joueurA = 613: GOTOU = 26
            IF GOTOU = 0 THEN joueurA = 6131: Aoccupe = 1: reftemps = temps: GOTOU = 26
            
        END IF
    END IF

    IF GOTOU = 0 AND sens = 9 THEN
        IF levier1 = 3 THEN
			IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 918: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 AND protegeHA = 1 THEN joueurA = 913: GOTOU = 26
            IF GOTOU = 0 THEN joueurA = 9131: Aoccupe = 1: reftemps = temps: GOTOU = 26
            
        END IF
    END IF


    '                                   protection devant, coup de tete
    IF GOTOU = 0 AND sens = 6 THEN
        IF levier1 = 3 THEN
			IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 617: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 AND protegeDA = 1 THEN joueurA = 612: GOTOU = 26
            IF GOTOU = 0 THEN joueurA = 6121: Aoccupe = 1: reftemps = temps: GOTOU = 26
            
        END IF
    END IF
    IF GOTOU = 0 AND sens = 9 THEN
        IF levier1 = 1 THEN
			IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 917: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 AND protegeDA = 1 THEN joueurA = 912: GOTOU = 26
            IF GOTOU = 0 THEN joueurA = 9121: Aoccupe = 1: reftemps = temps: GOTOU = 26
            
        END IF
    END IF


    '               ********************************************
    '               *************GESTION DES ETATS**************
    '               ********************************************
    'gestion:
    IF GOTOU = 26 THEN GOTOU = 0
	
    IF GOTOU = 0 AND joueurA = 0 THEN ' debout
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
		spriteA = 0
        decapiteA = 1
        sangA = 0
        xAttA = xA: yAttA = 14
        yFA = 15: yTA = 16: yMA = 18: yGA = 20
        IF GOTOU = 0 AND demo = 1 THEN
            IF GOTOU = 0 AND temps > reftemps + 20 THEN Aoccupe = 0
        END IF
        GOTOU = 1
    END IF
 
	IF GOTOU = 0 AND joueurA = 94 THEN ' deboutR
        xFA = xA: xTA = xA: xMA = xA: xGA = xA 
		spriteA = 0
        decapiteA = 1
        sangA = 0
        xAttA = xFA + 4: yAttA = 14
        yFA = 15: yTA = 16: yMA = 18: yGA = 20
        GOTOU = 1
    END IF
	
    IF GOTOU = 0 AND joueurA = 1 THEN ' attente
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        IF GOTOU = 0 AND temps > reftemps + 60 THEN Aoccupe = 0: attenteA = 1: joueurA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 50 THEN spriteA = 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 40 THEN spriteA = 2: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN spriteA = 3: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 21 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN 
			spriteA = 2: GOTOU = 1 '_SNDPLAY attente:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_attente), (strptr(sfx_attente_end)-strptr(sfx_attente)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)			
		END IF
        IF GOTOU = 0 AND temps > reftemps + 10 THEN spriteA = 1: GOTOU = 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 91 THEN ' attenteR
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        IF GOTOU = 0 AND temps > reftemps + 60 THEN Aoccupe = 0: attenteA = 1: joueurA = 94: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 50 THEN spriteA = 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 40 THEN spriteA = 2: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN spriteA = 3: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 21 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN 
			spriteA = 2: GOTOU = 1 '_SNDPLAY attente:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_attente), (strptr(sfx_attente_end)-strptr(sfx_attente)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)			
		END IF
        IF GOTOU = 0 AND temps > reftemps + 10 THEN spriteA = 1: GOTOU = 1 
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    '                               avance
    IF GOTOU = 0 AND joueurA = 2 THEN 'avance
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND entree = 0 THEN joueurA = 66: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 THEN spriteA = 4: spriteavanceA = 1: xA = xA + 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 3 THEN ' avance1
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND entree = 0 THEN joueurA = 66: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 9 THEN xA = xA + 1: spriteA = 5: spriteavanceA = 2
        IF GOTOU = 0 THEN GOTOU = 1
    END IF


    IF GOTOU = 0 AND joueurA = 4 THEN 'avance2
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        spriteA = 5
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND entree = 0 THEN joueurA = 66: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 18 THEN xA = xA + 1: spriteA = 6: spriteavanceA = 3
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 5 THEN ' avance3
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        spriteA = 6
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND entree = 0 THEN joueurA = 66: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 27 THEN xA = xA + 1: spriteA = 0: spriteavanceA = 4
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 6 THEN 'avance4
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        spriteA = 0
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND entree = 0 THEN joueurA = 66: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 36 THEN joueurA = 0: reftemps = temps: spriteavanceA = 0
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    '                                avance inversee

    IF GOTOU = 0 AND joueurA = 99 THEN 'avanceR
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        xAttA = xA + 4
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND entreesorcier = 0 THEN joueurA = 96: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 THEN spriteA = 4: spriteavanceA = 1: xA = xA - 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 991 THEN 'avance1R
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        xAttA = xA + 4
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND entreesorcier = 0 THEN joueurA = 96: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 9 THEN xA = xA - 1: spriteA = 5: spriteavanceA = 2
        IF GOTOU = 0 THEN GOTOU = 1
    END IF


    IF GOTOU = 0 AND joueurA = 992 THEN ' avance2R
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        xAttA = xA + 4
        spriteA = 5
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND entreesorcier = 0 THEN joueurA = 96: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 18 THEN xA = xA - 1: spriteA = 6: spriteavanceA = 3
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 993 THEN 'avance3R
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        xAttA = xA + 4
        spriteA = 6
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND entreesorcier = 0 THEN joueurA = 96: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 27 THEN xA = xA - 1: spriteA = 0: spriteavanceA = 4
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 994 THEN 'avance4R
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        xAttA = xA + 4
        spriteA = 0
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND entreesorcier = 0 THEN joueurA = 96: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 36 THEN joueurA = 94: reftemps = temps: spriteavanceA = 0
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    '                               recule
    IF GOTOU = 0 AND joueurA = 7 THEN 'recule
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND sortieA = 0 THEN joueurA = 61400: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 THEN spriteA = 6: spritereculeA = 1: xA = xA - 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 8 THEN 'recule1
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND sortieA = 0 THEN joueurA = 61400: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 9 THEN xA = xA - 1: spriteA = 5: spritereculeA = 2
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 9 THEN 'recule2
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        spriteA = 5
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND sortieA = 0 THEN joueurA = 61400: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 18 THEN xA = xA - 1: spriteA = 4: spritereculeA = 3
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 10 THEN 'recule3
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        spriteA = 4
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND sortieA = 0 THEN joueurA = 61400: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 27 THEN xA = xA - 1: spriteA = 0: spritereculeA = 4
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 11 THEN 'recule4
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        spriteA = 0
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND sortieA = 0 THEN joueurA = 61400: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 36 THEN joueurA = 0: reftemps = temps: spritereculeA = 0
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    '                               recule inverse

    IF GOTOU = 0 AND joueurA = 990 THEN 'reculeR
        xAttA = xA + 4
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND sortieA = 0 THEN joueurA = 9140: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 THEN spriteA = 6: spritereculeA = 1: xA = xA + 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 9901 THEN 'recule1R
        xAttA = xA + 4
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND sortieA = 0 THEN joueurA = 9140: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 9 THEN xA = xA + 1: spriteA = 5: spritereculeA = 2
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 9902 THEN 'recule2r
        xAttA = xA + 4
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        spriteA = 5
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND sortieA = 0 THEN joueurA = 9140: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 18 THEN xA = xA + 1: spriteA = 4: spritereculeA = 3
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 9903 THEN 'recule3R
        xAttA = xA + 4
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        spriteA = 4
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND sortieA = 0 THEN joueurA = 9140: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 27 THEN xA = xA + 1: spriteA = 0: spritereculeA = 4
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 9904 THEN 'recule4R
        xAttA = xA + 4
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        spriteA = 0
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 AND sortieA = 0 THEN joueurA = 9140: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 36 THEN joueurA = 94: reftemps = temps: spritereculeA = 0
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 616 THEN 'saute
        xAttA = xA: xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        decapiteA = 0
        yGA = yMA: yAttA = 14
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 63: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 60 THEN Aoccupe = 0: joueurA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 50 THEN spriteA = 0: xMA = xA + 4: xGA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 40 THEN spriteA = 7: xMA = xA + 4: xGA = xA + 1: decapiteA = 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN spriteA = 8: xMA = xA + 1: xGA = xA + 1: GOTOU = 1
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 7: xMA = xA + 4: xGA = xA + 1: GOTOU = 1
    END IF
	
    IF GOTOU = 0 AND joueurA = 916 THEN 'sauteR
        xAttA = xA + 4: xFA = xA: xTA = xA: xMA = xA: xGA = xA
        decapiteA = 0
        yGA = yMA: yAttA = 14
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 93: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 60 THEN Aoccupe = 0: joueurA = 94: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 50 THEN spriteA = 0: xMA = xA: xGA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 40 THEN spriteA = 7: xMA = xA: xGA = xA + 1: decapiteA = 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN spriteA = 8: xMA = xA + 3: xGA = xA + 3: GOTOU = 1
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 7: xMA = xA: xGA = xA + 3: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 6100 THEN 'assis
        xAttA = xA
        xFA = xA: xTA = xA: xMA = xA + 4: xGA = xA + 4
        spriteA = 9
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 68: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 10 THEN joueurA = 61002: GOTOU = 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 61002 THEN 'assis2
        Aoccupe = 0
        assisA = 1
        xAttA = xA
        xFA = xA: xTA = xA: xMA = xA + 4: xGA = xA + 4
        spriteA = 10
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 68: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND demo = 1 THEN
            IF GOTOU = 0 AND temps > reftemps + 20 THEN Aoccupe = 0
            GOTOU = 1
        END IF
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 61000 THEN 'releve
        xAttA = xA: yAttA = 14
        xFA = xA: xTA = xA: xMA = xA + 4: xGA = xA + 4
        spriteA = 9
        IF GOTOU = 0 AND temps > reftemps + 10 THEN joueurA = 0: Aoccupe = 0: GOTOU = 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF


    IF GOTOU = 0 AND joueurA = 9100 THEN 'assisR
        xAttA = xA + 4
        xFA = xA + 4: xTA = xA + 4: xMA = xA: xGA = xA + 4
        spriteA = 9
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 98: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 10 THEN joueurA = 9102: GOTOU = 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 9102 THEN 'assis2R
        Aoccupe = 0
        assisA = 1
        xAttA = xA + 4
        xFA = xA + 4: xTA = xA + 4: xMA = xA: xGA = xA + 4
        spriteA = 10
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 98: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND demo = 1 THEN
            IF GOTOU = 0 AND temps > reftemps + 20 THEN Aoccupe = 0
            GOTOU = 1
        END IF
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 9106 THEN 'releveR
        xAttA = xA + 4: yAttA = 14
        xFA = xA + 4: xTA = xA + 4: xMA = xA: xGA = xA
        spriteA = 9 
		IF GOTOU = 0 AND temps > reftemps + 10 THEN joueurA = 94: Aoccupe = 0: GOTOU = 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 615 THEN 'rouladeAV
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yGA = 20: yAttA = yGA: xAttA = xA: yTA = yGA
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN yTA = 16: joueurA = 611: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 48 THEN
            spriteA = 0: xTA = xA + 4: xMA = xA + 4: yTA = 16:
            Aoccupe = 0: xA = xA + 1: joueurA = 61500: GOTOU = 4
        END IF
        IF GOTOU = 0 AND temps > reftemps + 45 THEN spriteA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 42 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 41 THEN xA = xA + 1: spriteA = 16: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 38 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 37 THEN xA = xA + 1: spriteA = 15: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 34 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 33 THEN xA = xA + 1: spriteA = 15: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 39 THEN xA = xA + 1: spriteA = 14: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 26 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 25 THEN xA = xA + 1: spriteA = 14: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 22 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 21 THEN xA = xA + 1: xAttA = xA + 5: spriteA = 13: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 18 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 17 THEN xA = xA + 1: xAttA = xA + 5: spriteA = 13: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 14 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 13 THEN xA = xA + 1: spriteA = 12: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 9 THEN xA = xA + 1: spriteA = 12: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 6 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 5 THEN xA = xA + 1: spriteA = 11: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 1 THEN 
			xA = xA + 1: spriteA = 11: GOTOU = 1 
			IF musiqueLOOP = 0 AND joueurB != 61400 THEN SNDZEROPLAY(1, strptr(sfx_roule), (strptr(sfx_roule_end)-strptr(sfx_roule)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF		
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 11: GOTOU = 1
    END IF

    'finderoulade:
    IF GOTOU = 4 THEN GOTOU = 0

    IF GOTOU = 0 AND joueurA = 61500 THEN
        IF GOTOU = 0 AND xA < xB THEN
            joueurA = 0
            spriteA = 0
			spriteavanceA = 0
            xAttA = xA: yAttA = 17
            yFA = 15: yTA = 16: yMA = 18: yGA = 20
            xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
            GOTOU = 1
        END IF
        IF GOTOU = 0 AND xA > xB - 1 THEN
            joueurA = 614: yAttA = 14: Aoccupe = 1: reftemps = temps
            joueurB = 614: yAttB = 14: Boccupe = 1: reftempsB = temps
            GOTOU = 31
        END IF
    END IF

    IF GOTOU = 0 AND joueurA = 915 THEN 'rouladeAVR
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yGA = 20: yAttA = yGA: xAttA = xA + 4: yTA = yGA
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 911: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 48 THEN
            spriteA = 0: xTA = xA: xMA = xA
            Aoccupe = 0: xA = xA - 1: joueurA = 9150: GOTOU = 5
        END IF
        IF GOTOU = 0 AND temps > reftemps + 45 THEN yTA = 16: spriteA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 42 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 41 THEN xA = xA - 1: spriteA = 16: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 38 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 37 THEN xA = xA - 1: spriteA = 15: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 34 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 33 THEN xA = xA - 1: spriteA = 15: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 29 THEN xA = xA - 1: spriteA = 14: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 26 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 25 THEN xA = xA - 1: spriteA = 14: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 22 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 21 THEN xA = xA - 1: xAttA = xA - 1: spriteA = 13: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 18 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 17 THEN xA = xA - 1: xAttA = xA - 1: spriteA = 13: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 14 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 13 THEN xA = xA - 1: spriteA = 12: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 9 THEN xA = xA - 1: spriteA = 12: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 6 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 5 THEN xA = xA - 1: spriteA = 11: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 1 THEN 
			xA = xA - 1: spriteA = 11:  GOTOU = 1
			IF musiqueLOOP = 0 AND joueurB != 9140 THEN SNDZEROPLAY(1, strptr(sfx_roule), (strptr(sfx_roule_end)-strptr(sfx_roule)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF		
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 11: GOTOU = 1
    END IF

    'finderouladeR:
    IF GOTOU = 5 THEN GOTOU = 0

    IF GOTOU = 0 AND joueurA = 9150 THEN
        IF GOTOU = 0 AND xA > xB THEN
            joueurA = 94
            spriteA = 0
			spriteavanceA = 0
            xAttA = xA + 4: yAttA = 17
            yFA = 15: yTA = 16: yMA = 18: yGA = 20
            xFA = xA: xTA = xA: xMA = xA: xGA = xA
            GOTOU = 1
        END IF
        IF GOTOU = 0 AND xA < xB + 1 THEN
            joueurA = 914: yAttA = 14: Aoccupe = 1: reftemps = temps
            joueurB = 914: yAttB = 14: Boccupe = 1: reftempsB = temps
            GOTOU = 31
        END IF

    END IF

    IF GOTOU = 0 AND joueurA = 6150 THEN 'rouladeAR
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yGA = 20: yAttA = yGA: xAttA = xA

        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 67: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 44 THEN
            spriteA = 0: xTA = xA + 4: xMA = xA + 4
			spritereculeA = 0
            Aoccupe = 0: joueurA = 0: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftemps + 41 THEN spriteA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 38 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 37 THEN xA = xA - 1: spriteA = 11: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 34 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 33 THEN xA = xA - 1: spriteA = 11: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 29 THEN xA = xA - 1: spriteA = 12: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 26 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 25 THEN xA = xA - 1: spriteA = 12: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 22 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 21 THEN xA = xA - 1: spriteA = 13: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 18 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 17 THEN xA = xA - 1: spriteA = 13: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 14 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 13 THEN xA = xA - 1: spriteA = 14: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 9 THEN xA = xA - 1: spriteA = 14: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 6 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 5 THEN xA = xA - 1: spriteA = 15: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 1 THEN 
			xA = xA - 1: spriteA = 16: GOTOU = 1
			IF musiqueLOOP = 0 AND joueurB != 61400 THEN SNDZEROPLAY(1, strptr(sfx_roule), (strptr(sfx_roule_end)-strptr(sfx_roule)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 16: GOTOU = 1		
    END IF

    IF GOTOU = 0 AND joueurA = 9159 THEN 'rouladeARR
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yGA = 20: yAttA = yGA: xAttA = xA + 4
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 97: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 44 THEN
            spriteA = 0: xTA = xA: xMA = xA
			spritereculeA = 0
            Aoccupe = 0: joueurA = 94: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 41 THEN spriteA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 39 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 37 THEN xA = xA + 1: spriteA = 11: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 34 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 33 THEN xA = xA + 1: spriteA = 11: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 29 THEN xA = xA + 1: spriteA = 12: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 26 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 25 THEN xA = xA + 1: spriteA = 12: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 22 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 21 THEN xA = xA + 1: spriteA = 13: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 18 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 17 THEN xA = xA + 1: spriteA = 13: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 14 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 13 THEN xA = xA + 1: spriteA = 14: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 9 THEN xA = xA + 1: spriteA = 14: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 6 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 5 THEN xA = xA + 1: spriteA = 15: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 1 THEN 
			xA = xA + 1: spriteA = 16: GOTOU = 1
			IF musiqueLOOP = 0 AND joueurB != 9140 THEN SNDZEROPLAY(1, strptr(sfx_roule), (strptr(sfx_roule_end)-strptr(sfx_roule)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF		
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 16: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 6131 THEN 'protegeH1
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        xAttA = xA
        yGA = 20
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 618: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 5 THEN protegeHA = 1: spriteA = 17: Aoccupe = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 1 THEN 
			xA = xA - 1: spriteA = 4: GOTOU = 1 
			'_SNDPLAY protege:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_protege), (strptr(sfx_protege_end)-strptr(sfx_protege)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF		
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 4: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 613 THEN 'protegeH
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 618: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 THEN 
			xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
			xAttA = xA
			yGA = 20
			spriteA = 17
			GOTOU = 1
		END IF
    END IF

    IF GOTOU = 0 AND joueurA = 9131 THEN 'protegeHR1
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        xAttA = xA + 4
        yGA = 20
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 918: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 5 THEN protegeHA = 1: spriteA = 17: Aoccupe = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 1 THEN
			xA = xA + 1: spriteA = 4: GOTOU = 1
			'_SNDPLAY protege:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_protege), (strptr(sfx_protege_end)-strptr(sfx_protege)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF		
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 4: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 913 THEN 'protegeHR
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 918: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 THEN 
			xFA = xA: xTA = xA: xMA = xA: xGA = xA
			xAttA = xA + 4
			yGA = 20
			spriteA = 17
			GOTOU = 1
		END IF
    END IF

    IF GOTOU = 0 AND joueurA = 6121 THEN 'protegeD1
        xAttA = xA
        yGA = 20
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        decapiteA = 0
        spriteA = 17
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 617: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 5 THEN joueurA = 612: protegeDA = 1: Aoccupe = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 1 THEN
			GOTOU = 1 '_SNDPLAY protege:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_protege), (strptr(sfx_protege_end)-strptr(sfx_protege)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 612 THEN 'protegeD
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 617: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 THEN 
			xAttA = xA
			yGA = 20
			xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
			decapiteA = 0
			spriteA = 18
			GOTOU = 1
		END IF
    END IF
	
    IF GOTOU = 0 AND joueurA = 9121 THEN 'protegeDR1
        xAttA = xA + 4
        yGA = 20
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        decapiteA = 0
        spriteA = 17
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 917: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 AND temps > reftemps + 5 THEN joueurA = 912: protegeDA = 1: Aoccupe = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 1 THEN
			GOTOU = 1 '_SNDPLAY protege:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_protege), (strptr(sfx_protege_end)-strptr(sfx_protege)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 912 THEN 'protegeDR
        IF GOTOU = 0 AND attaqueA = 1 AND demo = 0 THEN joueurA = 917: Aoccupe = 1: reftemps = temps: GOTOU = 26
        IF GOTOU = 0 THEN 
			xAttA = xA + 4
			yGA = 20
			xFA = xA: xTA = xA: xMA = xA: xGA = xA
			decapiteA = 0
			spriteA = 18
			GOTOU = 1
		END IF
    END IF

    IF GOTOU = 0 AND joueurA = 63 THEN 'cou
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yGA = 20
        IF GOTOU = 0 AND temps > reftemps + 31 THEN Aoccupe = 0: joueurA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 25 THEN spriteA = 19: xAttA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 21 THEN xAttA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN
			spriteA = 20
            IF joueurB = 63 AND spriteB = 20 AND distance < 12 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
                GOTOU = 1
            END IF
            xTA = xA: xAttA = xA + 7: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteA = 19: yAttA = yTA: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 17: GOTOU = 1 'spriteprotegehaut
    END IF

    IF GOTOU = 0 AND joueurA = 93 THEN 'couR
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yGA = 20
        IF GOTOU = 0 AND temps > reftemps + 30 THEN Aoccupe = 0: joueurA = 94: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 25 THEN spriteA = 19: xAttA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 21 THEN xAttA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN
            spriteA = 20
            IF joueurB = 93 AND spriteB = 20 AND distance < 12 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
                GOTOU = 1
            END IF
            xTA = xA + 4: xAttA = xA - 3: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteA = 19: yAttA = yTA: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 17: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 66 THEN 'devant
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yGA = 20
        IF GOTOU = 0 AND temps > reftemps + 30 THEN Aoccupe = 0: joueurA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 25 THEN spriteA = 22: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 21 THEN spriteA = 23: xAttA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN
            spriteA = 23
            IF joueurB = 66 AND distance < 9 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)								
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
                GOTOU = 1
            END IF
            IF GOTOU = 0 AND joueurB = 612 AND distance < 7 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
                GOTOU = 1
            END IF
            xMA = xA: xAttA = xA + 6: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteA = 22: yAttA = yMA: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 21: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 96 THEN 'devantR
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yGA = 20
        IF GOTOU = 0 AND temps > reftemps + 30 THEN Aoccupe = 0: joueurA = 94: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 25 THEN spriteA = 22: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 21 THEN spriteA = 23: xAttA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN
            spriteA = 23
            IF joueurB = 96 AND distance < 9 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
                GOTOU = 1
            END IF
            IF GOTOU = 0 AND joueurB = 912 AND distance < 7 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)					
				END IF
                GOTOU = 1
            END IF
            xMA = xA + 4: xAttA = xA - 2: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteA = 22: yAttA = yMA: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 21: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 68 THEN 'genou
        xFA = xA: xTA = xA: xMA = xA: xGA = xA + 4
        yGA = 20
        IF GOTOU = 0 AND temps > reftemps + 30 THEN Aoccupe = 0: joueurA = 61002: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 25 THEN spriteA = 10: GOTOU = 1 ' sprite assis2
        IF GOTOU = 0 AND temps > reftemps + 21 THEN spriteA = 25: xAttA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN
            spriteA = 25:
            IF joueurB = 68 AND distance < 11 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
                GOTOU = 1
            END IF
            xGA = xA: xAttA = xA + 7: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteA = 10: yAttA = yGA: GOTOU = 1 ' sprite assis2
        END IF
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 24: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 98 THEN 'genouR
        yGA = 20
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA
        IF GOTOU = 0 AND temps > reftemps + 30 THEN Aoccupe = 0: joueurA = 9102: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 25 THEN spriteA = 10: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 21 THEN spriteA = 25: xAttA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN
            spriteA = 25
            IF joueurB = 98 AND distance < 11 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
                GOTOU = 1
            END IF
            xGA = xA + 4: xAttA = xA - 3: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteA = 10: yAttA = yGA: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 24: GOTOU = 1
    END IF


    IF GOTOU = 0 AND joueurA = 618 THEN 'araignee
        xFA = xA + 4: xTA = xA + 4: xMA = xA: xGA = xA + 4
        yAttA = yGA: xAttA = xA: yGA = 20
        IF GOTOU = 0 AND temps > reftemps + 35 THEN Aoccupe = 0: joueurA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 26 THEN xAttA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 25 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteA = 29
            distance = xB - xA
            IF joueurB = 618 AND distance <= 9 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
                GOTOU = 1
            END IF
            xAttA = xA + 5: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 20 THEN spriteA = 28: xAttA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteA = 27: xAttA = xA: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 26: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 918 THEN 'araigneeR
        xFA = xA: xTA = xA: xMA = xA + 4: xGA = xA
        yAttA = yGA: xAttA = xA + 4: yGA = 20
        IF GOTOU = 0 AND temps > reftemps + 35 THEN Aoccupe = 0: joueurA = 94: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 26 THEN xAttA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 25 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteA = 29
            distance = xA - xB
            IF joueurB = 918 AND distance <= 9 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
                GOTOU = 1
            END IF
            xAttA = xA - 1: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 20 THEN spriteA = 28: xAttA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteA = 27: xAttA = xA + 4: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 26: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 611 THEN 'coupdepied
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        spriteA = 30: yAttA = yGA: yGA = 20
        IF GOTOU = 0 AND temps > reftemps + 50 THEN Aoccupe = 0: spriteA = 0: joueurA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 40 THEN spriteA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN spriteA = 30: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 16 THEN spriteA = 31: xAttA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 15 THEN spriteA = 31: xAttA = xA + 5: GOTOU = 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 911 THEN 'coupdepiedR
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        spriteA = 30: yAttA = yGA: yGA = 20
        IF GOTOU = 0 AND temps > reftemps + 50 THEN Aoccupe = 0: spriteA = 0: joueurA = 94: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 40 THEN spriteA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN spriteA = 30: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 16 THEN spriteA = 31: xAttA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 15 THEN spriteA = 31: xAttA = xA - 1: GOTOU = 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 617 THEN 'coupdetete
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yGA = 20
        IF GOTOU = 0 AND temps > reftemps + 36 THEN Aoccupe = 0: joueurA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 29 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 28 THEN xA = xA - 1: spriteA = 32: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN xAttA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 17 THEN spriteA = 33: xAttA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 16 THEN xA = xA + 1: spriteA = 33: xAttA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 8 THEN spriteA = 32: yAttA = yTA: GOTOU = 1
		IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 32: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 917 THEN 'coupdeteteR
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yGA = 20: yTA = 16
        IF GOTOU = 0 AND temps > reftemps + 36 THEN Aoccupe = 0: joueurA = 94: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 29 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 28 THEN xA = xA + 1: spriteA = 32: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN xAttA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 17 THEN spriteA = 33: xAttA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 16 THEN xA = xA - 1: spriteA = 33: xAttA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 8 THEN spriteA = 32: yAttA = yTA: GOTOU = 1
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 32: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 61400 THEN 'decapite
        decapiteA = 0
        xFA = xA + 3: xTA = xA + 2: xMA = xA + 2: xGA = xA + 4
        IF GOTOU = 0 AND temps > reftemps + 58 THEN Aoccupe = 0: spriteA = 0: joueurA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 55 THEN spriteA = 19: xAttA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 51 THEN spriteA = 20: xAttA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 50 THEN spriteA = 20: xTA = xA: xAttA = xA + 6: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 39 THEN spriteA = 20: yAttA = yTA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 33 THEN spriteA = 19: yAttA = yTA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 29 THEN spriteA = 17: yAttA = yTA: GOTOU = 1 'spriteprotegehaut
        IF GOTOU = 0 AND temps > reftemps + 25 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 24 THEN xA = xA + 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN	spriteA = 39: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 19 THEN xA = xA + 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 15 THEN spriteA = 39: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 14 THEN xA = xA + 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN spriteA = 38: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 9 THEN xA = xA + 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 5 THEN spriteA = 38: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 4 THEN xA = xA + 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN spriteA = 37: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 1 THEN xA = xA + 1: spriteA = 37: GOTOU = 1
        IF GOTOU = 0 AND temps >= reftemps THEN 
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_decapite), (strptr(sfx_decapite_end)-strptr(sfx_decapite)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)			
			spriteA = 37: GOTOU = 1
		END IF
    END IF

    IF GOTOU = 0 AND joueurA = 9140 THEN 'decapiteR
        decapiteA = 0
        xFA = xA + 1: xTA = xA + 2: xMA = xA + 2: xGA = xA
        IF GOTOU = 0 AND temps > reftemps + 58 THEN Aoccupe = 0: spriteA = 0: joueurA = 94: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 55 THEN spriteA = 19: xAttA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 51 THEN spriteA = 20: xAttA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 50 THEN spriteA = 20: xTA = xA + 4: xAttA = xA - 2: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 39 THEN spriteA = 20: yAttA = yTA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 33 THEN spriteA = 19: yAttA = yTA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 29 THEN spriteA = 17: yAttA = yTA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 25 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 24 THEN xA = xA - 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN	spriteA = 39: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 19 THEN xA = xA - 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 15 THEN spriteA = 39: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 14 THEN xA = xA - 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN spriteA = 38: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 9 THEN xA = xA - 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 5 THEN spriteA = 38: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 4 THEN xA = xA - 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN spriteA = 37: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 1 THEN xA = xA - 1: spriteA = 37: GOTOU = 1
        IF GOTOU = 0 AND temps >= reftemps THEN 
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_decapite), (strptr(sfx_decapite_end)-strptr(sfx_decapite)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			spriteA = 37: GOTOU = 1
		END IF
    END IF

    IF GOTOU = 0 AND joueurA = 67 THEN 'front
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yGA = 20
        IF GOTOU = 0 AND temps > reftemps + 40 THEN Aoccupe = 0: joueurA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN spriteA = 35: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 24 THEN spriteA = 36: xAttA = xA: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 23 THEN
            spriteA = 36: distance = xB - xA
            IF joueurB = 67 AND spriteB = 36 AND distance < 11 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
            END IF
            IF joueurB = 613 AND distance < 9 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
            END IF
            xFA = xA: xAttA = xA + 7: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteA = 35: yAttA = yFA: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps THEN spriteA = 34: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 97 THEN 'frontR
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yGA = 20
        IF GOTOU = 0 AND temps > reftemps + 40 THEN Aoccupe = 0: joueurA = 94: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN spriteA = 35: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 24 THEN spriteA = 36: xAttA = xA + 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 23 THEN
            spriteA = 36: distance = xA - xB
            IF joueurB = 97 AND spriteB = 36 AND distance < 11 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
            END IF
            IF joueurB = 913 AND distance < 9 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
            END IF
            xFA = xA + 4: xAttA = xA - 3: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteA = 35: yAttA = yFA: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps THEN spriteA = 34: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 614 THEN 'retourne
        xAttA = xA: xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yAttA = 14:
        spriteA = 37
        IF GOTOU = 0 AND temps > reftemps + 20 THEN joueurA = 94: Aoccupe = 0: sens = 9: spriteA = 0: spriteB = 0: couleurok = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 15 THEN spriteA = 39: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN spriteA = 38: GOTOU = 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 914 THEN 'retourneR
        xAttA = xA + 4: xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yAttA = 14:
        spriteA = 37
        IF GOTOU = 0 AND temps > reftemps + 20 THEN joueurA = 0: Aoccupe = 0: sens = 6: couleurok = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 15 THEN spriteA = 39: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN spriteA = 38: GOTOU = 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF
'coco
    IF GOTOU = 0 AND joueurA = 621 THEN 'vainqueur
        spriteA = 40
        decapiteA = 1
        sangA = 0
		spritereculeA = 0
        xAttA = xA: yGA = 20: yAttA = 14
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        'psgvol 0,0
        IF GOTOU = 0 AND temps > reftemps + 100 THEN spriteA = 40: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 85 THEN spriteA = 41: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 36 THEN spriteA = 42: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 18 THEN spriteA = 41: GOTOU = 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 921 THEN 'vainqueurR
        spriteA = 40
        decapiteA = 1
        sangA = 0
		spritereculeA = 0
        xAttA = xFA + 4: yGA = 20: yAttA = 14
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        'psgvol 0,0
        IF GOTOU = 0 AND temps > reftemps + 100 THEN spriteA = 40: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 85 THEN spriteA = 41: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 36 THEN spriteA = 42: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 18 THEN spriteA = 41: GOTOU = 1
        IF GOTOU = 0 THEN GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 62100 THEN 'vainqueurKO
        decapiteA = 1
        sangA = 0
		spritereculeA = 0
        xAttA = xA: yGA = 20:
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4

        IF GOTOU = 0 AND temps > reftemps + 230 THEN
            gnome = 1: reftemps = temps
            xGNOME = 3
            xSPRt = 270
            GOTOU = 31
        END IF

        IF GOTOU = 0 AND temps > reftemps + 205 THEN spriteA = 40: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 195 THEN spriteA = 41: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 140 THEN spriteA = 42: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 123 THEN spriteA = 41: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 105 THEN spriteA = 40: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 100 THEN spriteA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 75 THEN spriteA = 30: spriteB = 50: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 71 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 70 THEN spriteA = 31: spriteB = 49: xB = xB + 2: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 55 THEN spriteA = 30: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 40 THEN spriteA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 36 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 35 THEN
            distance = xB - xA
            IF GOTOU = 0 AND distance < 5 THEN spriteA = 6: xA = xA - 1
            IF GOTOU = 0 AND distance > 5 THEN spriteA = 6: xA = xA + 1
            GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftemps + 30 THEN spriteA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 23 THEN spriteA = 39: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 15 THEN spriteA = 38: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 8 THEN spriteA = 37
        GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 9210 THEN 'vainqueurKOR
        decapiteA = 1
        sangA = 0
		spritereculeA = 0
        xAttA = xFA + 4: yGA = 20
        xFA = xA: xTA = xA: xMA = xA: xGA = xA

        IF GOTOU = 0 AND temps > reftemps + 230 THEN
            gnome = 1: reftemps = temps
            xGNOME = 3
            xSPRt = 270
            GOTOU = 31
        END IF

        IF GOTOU = 0 AND temps > reftemps + 205 THEN spriteA = 40: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 195 THEN spriteA = 41: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 140 THEN spriteA = 42: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 123 THEN spriteA = 41: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 105 THEN spriteA = 40: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 100 THEN spriteA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 75 THEN spriteA = 30: spriteB = 50: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 71 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 70 THEN spriteA = 31: spriteB = 49: xB = xB - 2: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 55 THEN spriteA = 30: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 40 THEN spriteA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 36 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 35 THEN
            distance = xA - xB
            IF GOTOU = 0 AND distance < 5 THEN spriteA = 6: xA = xA + 1
            IF GOTOU = 0 AND distance > 5 THEN spriteA = 6: xA = xA - 1
            GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftemps + 30 THEN spriteA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 23 THEN spriteA = 39: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 15 THEN spriteA = 38: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 8 THEN spriteA = 37
        GOTOU = 1
    END IF


    '                               ******degats******
    IF GOTOU = 0 AND joueurA = 620 THEN 'touche
        attenteA = 0
        xAttA = xA
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        yFA = 15: yTA = 16: yMA = 18: yGA = 20
        IF GOTOU = 0 AND joueurB = 611 THEN joueurA = 619: GOTOU = 26

        IF GOTOU = 0 AND serpentA = 0 THEN serpentA = 1: refserpentA = temps

        IF GOTOU = 0 AND joueurB = 61400 AND decapiteA = 1 THEN
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mortdecap), (strptr(sfx_mortdecap_end)-strptr(sfx_mortdecap)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            joueurA = 65: Aoccupe = 1: reftemps = temps
            xSPRt = xA + 3: scoreB = scoreB + 250
            sangA = 0: serpentA = 0
			GOTOU = 34
        END IF

        IF GOTOU = 0 THEN vieA = vieA - 1:
        IF GOTOU = 0 AND vieA <= 0 THEN
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			serpentA = 0: sangA = 1
            joueurA = 610: Aoccupe = 1: reftemps = temps: GOTOU = 34
        END IF

        IF GOTOU = 0 THEN
            joueurA = 6201: Aoccupe = 1: reftemps = temps: decapiteA = 1
            GOTOU = 1
        END IF
    END IF


    IF GOTOU = 0 AND joueurA = 6201 THEN 'touche1
        attenteA = 0
        xAttA = xA
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        IF GOTOU = 0 AND temps > reftemps + 20 THEN
            spriteA = 0: Aoccupe = 0
			sangA = 0
            joueurA = 0: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN xA = xA - 1: sangA = 0: spriteA = 43: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 7 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 6 THEN xA = xA - 2: spriteA = 44: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 3 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN
            xA = xA - 1: spriteA = 43
            choixTOUCHE = choixTOUCHE + 1
            IF choixTOUCHE > 3 THEN choixTOUCHE = 1
			IF musiqueLOOP = 0 THEN 
				IF choixTOUCHE = 1 THEN SNDZEROPLAY(1, strptr(sfx_touche1), (strptr(sfx_touche1_end)-strptr(sfx_touche1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				IF choixTOUCHE = 2 THEN SNDZEROPLAY(1, strptr(sfx_touche2), (strptr(sfx_touche2_end)-strptr(sfx_touche2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				IF choixTOUCHE = 3 THEN SNDZEROPLAY(1, strptr(sfx_touche3), (strptr(sfx_touche3_end)-strptr(sfx_touche3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			END IF
            GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 43: sangA = 1: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 920 THEN 'toucheR
        attenteA = 0
        xAttA = xA + 4
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        yFA = 15: yTA = 16: yMA = 18: yGA = 20
        IF GOTOU = 0 AND joueurB = 911 THEN joueurA = 919: GOTOU = 26

        IF GOTOU = 0 AND serpentA = 0 THEN serpentA = 1: refserpentA = temps

        IF GOTOU = 0 AND joueurB = 9140 AND decapiteA = 1 THEN
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mortdecap), (strptr(sfx_mortdecap_end)-strptr(sfx_mortdecap)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            joueurA = 95: Aoccupe = 1: reftemps = temps
            xSPRt = xA + 3: scoreB = scoreB + 250
            sangA = 0: serpentA = 0: GOTOU = 34
        END IF

        IF GOTOU = 0 THEN vieA = vieA - 1

        IF GOTOU = 0 AND vieA <= 0 THEN
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			sangA = 1: serpentA = 0
            joueurA = 910: Aoccupe = 1: reftemps = temps: GOTOU = 34
        END IF

        IF GOTOU = 0 THEN
            joueurA = 9201: Aoccupe = 1: reftemps = temps: decapiteA = 1
            GOTOU = 1
        END IF
    END IF

    IF GOTOU = 0 AND joueurA = 9201 THEN 'touche1R
        attenteA = 0
        xAttA = xA + 4
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        IF GOTOU = 0 AND temps > reftemps + 20 THEN
            spriteA = 0: Aoccupe = 0
            joueurA = 94: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN xA = xA + 1: sangA = 0: spriteA = 43: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 7 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 6 THEN xA = xA + 2: spriteA = 44: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 3 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN
            xA = xA + 1: spriteA = 43
            choixTOUCHE = choixTOUCHE + 1
            IF choixTOUCHE > 3 THEN choixTOUCHE = 1
			IF musiqueLOOP = 0 THEN 
				IF choixTOUCHE = 1 THEN SNDZEROPLAY(1, strptr(sfx_touche1), (strptr(sfx_touche1_end)-strptr(sfx_touche1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				IF choixTOUCHE = 2 THEN SNDZEROPLAY(1, strptr(sfx_touche2), (strptr(sfx_touche2_end)-strptr(sfx_touche2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				IF choixTOUCHE = 3 THEN SNDZEROPLAY(1, strptr(sfx_touche3), (strptr(sfx_touche3_end)-strptr(sfx_touche3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			END IF
            GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 43: sangA = 1: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 619 THEN 'tombe
        'psgvol 0,0
        xAttA = xA
        attenteA = 0
        xFA = xA: xTA = xA: xMA = xA: xGA = xA

        sangA = 1
        IF serpentA = 0 THEN serpentA = 1: refserpentA = temps
        vieA = vieA - 1: scoreB = scoreB + 100

        IF GOTOU = 0 AND joueurB = 615 THEN vieA = vieA + 1: sangA = 0: serpentA = 0: scoreB = scoreB - 100

        IF GOTOU = 0 AND vieA <= 0 THEN
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			sangA = 1: serpentA = 0
            joueurA = 610: Aoccupe = 1: reftemps = temps
            IF GOTOU = 0 AND joueurB = 617 OR joueurB = 611 THEN sangA = 0
            GOTOU = 34
        END IF

        IF GOTOU = 0 AND joueurB = 617 OR joueurB = 611 THEN scoreB = scoreB + 150: sangA = 0

        IF GOTOU = 0 THEN joueurA = 6191: Aoccupe = 1: reftemps = temps: GOTOU = 1
    END IF


    IF GOTOU = 0 AND joueurA = 6191 THEN 'tombe1
        xAttA = xA
        attenteA = 0
        xFA = xA: xTA = xA: xMA = xA: xGA = xA
        IF GOTOU = 0 AND temps > reftemps + 26 THEN
            spriteA = 0: xA = xA - 1: joueurA = 0: Aoccupe = 0: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 18 THEN spriteA = 47: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN sangA = 0: xA = xA - 2: spriteA = 46: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 3 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN
            xA = xA - 2
            '_SNDPLAY tombe
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tombe), (strptr(sfx_tombe_end)-strptr(sfx_tombe)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF joueurB = 611 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_pied), (strptr(sfx_pied_end)-strptr(sfx_pied)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF joueurB = 617 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_coupdeboule), (strptr(sfx_coupdeboule_end)-strptr(sfx_coupdeboule)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 45: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 919 THEN 'tombeR
        'psgvol 0,0
        xAttA = xA + 4
        attenteA = 0
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4

        sangA = 1
        IF serpentA = 0 THEN serpentA = 1: refserpentA = temps
        vieA = vieA - 1: scoreB = scoreB + 100

        IF GOTOU = 0 AND joueurB = 915 THEN vieA = vieA + 1: sangA = 0: serpentA = 0: scoreB = scoreB - 100

        IF GOTOU = 0 AND vieA <= 0 THEN
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			sangA = 1: serpentA = 0
            joueurA = 910: Aoccupe = 1: reftemps = temps
            IF GOTOU = 0 AND joueurB = 917 OR joueurB = 911 THEN sangA = 0
            GOTOU = 34
        END IF

        IF GOTOU = 0 AND joueurB = 917 OR joueurB = 911 THEN scoreB = scoreB + 150: sangA = 0

        IF GOTOU = 0 THEN joueurA = 9191: Aoccupe = 1: reftemps = temps: GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 9191 THEN 'tombe1r
        xAttA = xA + 4
        attenteA = 0
        xFA = xA + 4: xTA = xA + 4: xMA = xA + 4: xGA = xA + 4
        IF GOTOU = 0 AND temps > reftemps + 26 THEN
            spriteA = 0: xA = xA + 1: joueurA = 94: Aoccupe = 0: GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps > reftemps + 18 THEN spriteA = 47: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 11 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN sangA = 0: xA = xA + 2: spriteA = 46: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 3 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 2 THEN
            xA = xA + 2
            '_SNDPLAY tombe
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tombe), (strptr(sfx_tombe_end)-strptr(sfx_tombe)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF joueurB = 911 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_pied), (strptr(sfx_pied_end)-strptr(sfx_pied)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF joueurB = 917 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_coupdeboule), (strptr(sfx_coupdeboule_end)-strptr(sfx_coupdeboule)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            GOTOU = 1
        END IF
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 45: GOTOU = 1
    END IF


    '                               bruit des epees  et decapitation loupee
    IF GOTOU = 0 AND sens = 6 THEN

        IF GOTOU = 0 AND joueurA = 2000 THEN 'clingD

            IF GOTOU = 0 AND joueurB = 61400 AND decapiteA = 0 THEN joueurA = 620: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 AND joueurB = 68 THEN joueurA = 620: Aoccupe = 1: reftemps = temps: GOTOU = 26

            IF GOTOU = 0 THEN joueurA = 612: GOTOU = 1
        END IF

        IF GOTOU = 0 AND joueurA = 20002 THEN 'clingH
            joueurA = 613: GOTOU = 1
        END IF

    END IF

    IF GOTOU = 0 AND sens = 9 THEN

        IF GOTOU = 0 AND joueurA = 2000 THEN
            IF GOTOU = 0 AND joueurB = 9140 AND decapiteA = 0 THEN joueurA = 920: Aoccupe = 1: reftemps = temps: GOTOU = 26
            IF GOTOU = 0 AND joueurB = 98 THEN joueurA = 920: Aoccupe = 1: reftemps = temps: GOTOU = 26

            IF GOTOU = 0 THEN joueurA = 912: GOTOU = 1
        END IF

        IF GOTOU = 0 AND joueurA = 20002 THEN

            joueurA = 913: GOTOU = 1
        END IF

    END IF

'coco
    '                                   *************************************
    '                                   **********gestion de la mort*********
    '                                   *************************************

    'mort:
    IF GOTOU = 34 THEN GOTOU = 0

    IF GOTOU = 0 AND joueurA = 610 THEN 'mort
        IF GOTOU = 0 AND temps > reftemps + 16 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 15 THEN sangA = 0: spriteA = 48: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 14 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 13 THEN	
			GOTOU = 1 '_SNDPLAY mortKO:
			'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF
        IF GOTOU = 0 AND temps > reftemps + 1 THEN spriteA = 9: GOTOU = 1
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 9: joueurB = 62100: Boccupe = 1: reftempsB = temps
        GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 910 THEN 'mortR
        IF GOTOU = 0 AND temps > reftemps + 16 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 15 THEN sangA = 0: spriteA = 48: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 14 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 13 THEN 
			GOTOU = 1 '_SNDPLAY mortKO:
			'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF			
        IF GOTOU = 0 AND temps > reftemps + 1 THEN spriteA = 9: GOTOU = 1
        IF GOTOU = 0 AND temps >= reftemps THEN spriteA = 9: joueurB = 9210: Boccupe = 1: reftempsB = temps
        GOTOU = 1
    END IF

    IF GOTOU = 0 AND joueurA = 65 THEN 'mortdecap
        IF GOTOU = 0 AND temps > reftemps + 80 THEN spriteA = 54: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 70 THEN spriteA = 53: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 55 THEN sangdecapA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 50 THEN sangdecapA = 6: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 45 THEN sangdecapA = 5: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 40 THEN sangdecapA = 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN spriteA = 52: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN sangdecapA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 15 THEN sangdecapA = 3: GOTOU = 1
		IF GOTOU = 0 AND temps > reftemps + 10 THEN sangdecapA = 2: GOTOU = 1		
		IF GOTOU = 0 AND temps > reftemps + 7 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 6 THEN 
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			GOTOU = 1
		END IF
        IF GOTOU = 0 AND temps > reftemps + 5 THEN sangdecapA = 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 1 THEN GOTOU = 1
        IF GOTOU = 0 AND temps >= reftemps THEN
            spriteA = 51: joueurB = 621: Boccupe = 1: reftempsB = temps: GOTOU = 1
			'_SNDPLAY mortdecap
			'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mortdecap), (strptr(sfx_mortdecap_end)-strptr(sfx_mortdecap)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
        END IF
        
    END IF

    IF GOTOU = 0 AND joueurA = 95 THEN 'mortdecapR
        IF GOTOU = 0 AND temps > reftemps + 80 THEN spriteA = 54: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 70 THEN spriteA = 53: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 55 THEN sangdecapA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 50 THEN sangdecapA = 6: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 45 THEN sangdecapA = 5: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 40 THEN sangdecapA = 4: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 30 THEN spriteA = 52: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 20 THEN sangdecapA = 0: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 15 THEN sangdecapA = 3: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 10 THEN sangdecapA = 2: GOTOU = 1
		IF GOTOU = 0 AND temps > reftemps + 7 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 6 THEN 
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			GOTOU = 1
		END IF
        IF GOTOU = 0 AND temps > reftemps + 2 THEN sangdecapA = 1: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 1 THEN GOTOU = 1
        IF GOTOU = 0 AND temps >= reftemps THEN
            spriteA = 51: joueurB = 921: Boccupe = 1: reftempsB = temps: GOTOU = 1
			'_SNDPLAY mortdecap
			'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mortdecap), (strptr(sfx_mortdecap_end)-strptr(sfx_mortdecap)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
        END IF
    END IF

    IF GOTOU = 0 AND joueurA = 6500 THEN 'mortsorcier
        IF temps > reftemps + 51 THEN joueurA = 6660: GOTOU = 1
        ' sorcierfini
        IF GOTOU = 0 AND temps > reftemps + 86 THEN sangA = 0: spriteA = 50: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 71 THEN GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 70 THEN sangA = 0: spriteA = 49: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 15 THEN sangA = 0: spriteA = 48: GOTOU = 1
        IF GOTOU = 0 AND temps > reftemps + 1 THEN spriteA = 9: GOTOU = 1
        IF GOTOU = 0 THEN spriteA = 9: GOTOU = 1
    END IF

    '                         **************************************
    '                         *********     joueur 2    ************
    '                         **************************************
    'joueur2:
    'debut joueur 2
    IF GOTOU = 1 THEN GOTOU = 0


    IF GOTOU = 0 AND sorcier = 1 OR marianna = 1 THEN sangB = 0: GOTOU = 24

    IF GOTOU = 0 AND sortieA = 1 THEN
        IF joueurB = 610 OR joueurB = 65 OR joueurB = 910 OR joueurB = 95 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND sortieB = 1 THEN GOTOU = 21


    '                           ************degats sur joueurB************

    IF GOTOU = 0 AND sens = 6 THEN
        IF xB > xA THEN
            IF xAttA >= xFB AND yAttA = yFB THEN
				positionSANG = yFB			
                IF joueurB = 613 THEN joueurB = 20002: GOTOU = 24
                IF GOTOU = 0 THEN joueurB = 619: infoBdegatF = infoBdegatF + 1: GOTOU = 24
            END IF

            IF GOTOU = 0 AND xAttA >= xTB AND yAttA = yTB THEN
				positionSANG = yTB	
                IF joueurA = 617 THEN joueurB = 619: GOTOU = 24
                IF GOTOU = 0 THEN joueurB = 620: scoreA = scoreA + 250: infoBdegatT = infoBdegatT + 1: GOTOU = 24
            END IF

            IF GOTOU = 0 AND xAttA >= xMB AND yAttA = yMB THEN
				positionSANG = yMB	
                IF joueurB = 612 THEN joueurB = 2000: GOTOU = 24
                IF GOTOU = 0 THEN joueurB = 620: scoreA = scoreA + 250: GOTOU = 24
            END IF

            IF GOTOU = 0 AND xAttA >= xGB AND yAttA = yGB THEN
				positionSANG = yGB	
                IF joueurA = 618 THEN joueurB = 619: GOTOU = 24
                IF GOTOU = 0 AND joueurA = 615 THEN joueurB = 619: GOTOU = 24
                IF GOTOU = 0 AND joueurB = 612 THEN joueurB = 2000: GOTOU = 24
                IF GOTOU = 0 AND joueurA = 611 THEN joueurB = 619: infoBdegatG = infoBdegatG + 1: GOTOU = 24
                IF GOTOU = 0 THEN joueurB = 620: scoreA = scoreA + 100: infoBdegatG = infoBdegatG + 1: GOTOU = 24
            END IF
        END IF
    END IF

    IF GOTOU = 0 AND sens = 9 THEN
        IF xB < xA THEN
            IF xAttA <= xFB AND yAttA = yFB THEN
				positionSANG = yFB	
                IF joueurB = 913 THEN joueurB = 20002: GOTOU = 24
                IF GOTOU = 0 THEN joueurB = 919: infoBdegatF = infoBdegatF + 1: GOTOU = 24
            END IF

            IF GOTOU = 0 AND xAttA <= xTB AND yAttA = yTB THEN
				positionSANG = yTB	
                IF joueurA = 917 THEN joueurB = 919: GOTOU = 24
                IF GOTOU = 0 THEN joueurB = 920: scoreA = scoreA + 250: infoBdegatT = infoBdegatT + 1: GOTOU = 24
            END IF

            IF GOTOU = 0 AND xAttA <= xMB AND yAttA = yMB THEN
				positionSANG = yMB	
                IF joueurB = 912 THEN joueurB = 2000: GOTOU = 24
                IF GOTOU = 0 THEN joueurB = 920: scoreA = scoreA + 250: GOTOU = 24
            END IF

            IF GOTOU = 0 AND xAttA <= xGB AND yAttA = yGB THEN
				positionSANG = yGB	
                IF joueurA = 918 THEN joueurB = 919: GOTOU = 24
                IF GOTOU = 0 AND joueurA = 915 THEN joueurB = 919: GOTOU = 24
                IF GOTOU = 0 AND joueurB = 912 THEN joueurB = 2000: GOTOU = 24
                IF GOTOU = 0 AND joueurA = 911 THEN joueurB = 919: infoBdegatG = infoBdegatG + 1: GOTOU = 24
                IF GOTOU = 0 THEN joueurB = 920: scoreA = scoreA + 100: infoBdegatG = infoBdegatG + 1: GOTOU = 24
            END IF
        END IF
    END IF

    IF GOTOU = 0 AND Boccupe = 1 THEN GOTOU = 24
    IF GOTOU = 0 THEN sangB = 0

    '                       ********************************************
    '                       ******* evenements clavier joueurB *********
    '                       ********************************************

    'clavierB:
    IF GOTOU = 21 THEN GOTOU = 0


    IF GOTOU = 0 THEN

        x2 = 7: y2 = 7
        levier2 = 5 ' neutre

        IF partie = 2 THEN
            '                       ENTREE DES TOUCHES

			'pad2=getpad(2)
			
			
            'IF pad2 band PAD_LEFT THEN x2 = x2 - 1
			IF zero_right_pad band Input_Pad_Left THEN x2 = x2 - 1
            'IF pad2 band PAD_RIGHT THEN x2 = x2 + 1
			IF zero_right_pad band Input_Pad_Right THEN x2 = x2 + 1
            'IF pad2 band PAD_DOWN THEN y2 = y2 + 1
			IF zero_right_pad band Input_Pad_Down THEN y2 = y2 + 1
            'IF pad2 band PAD_UP THEN y2 = y2 - 1
			IF zero_right_pad band Input_Pad_Up THEN y2 = y2 - 1

			

            'IF pad2 band PAD_A THEN attaqueB = 1 ELSE attaqueB = 0
			IF zero_right_pad band Input_Pad_A THEN attaqueB = 1 ELSE attaqueB = 0



            '                       amplitude du pave virtuel
            IF y2 > 9 THEN y2 = 9
            IF y2 < 5 THEN y2 = 5
            IF x2 > 9 THEN x2 = 9
            IF x2 < 5 THEN x2 = 5

            '                        position du "levier"  virtuel


                IF x2 <= 6 AND y2 <= 6 THEN levier2 = 1
                ' hautG
                IF x2 >= 8 AND y2 <= 6 THEN levier2 = 3
                ' hautD
                IF x2 <= 6 AND y2 >= 8 THEN levier2 = 7
                'basG
                IF x2 >= 8 AND y2 >= 8 THEN levier2 = 9
                ' basD
                IF x2 <= 6 AND y2 = 7 THEN levier2 = 4
                ' gauche
                IF x2 >= 8 AND y2 = 7 THEN levier2 = 6
                ' droite
                IF x2 = 7 AND y2 >= 8 THEN levier2 = 8
                ' bas
                IF x2 = 7 AND y2 <= 6 THEN levier2 = 2
                ' haut



        END IF
    END IF

    '                       **********************************
    '                       ******* animations  auto *********
    '                       **********************************

    IF GOTOU = 0 AND entree = 1 THEN levier2 = 4: GOTOU = 20


    IF GOTOU = 0 AND sortieB = 1 THEN
        'IF GOTOU=0 and tempsfini = 1 THEN
        IF GOTOU = 0 AND sens = 9 THEN levier2 = 4: GOTOU = 20
        'END IF

        IF GOTOU = 0 THEN sens = 6: levier2 = 6: GOTOU = 20
    END IF


    '                       *****************************************
    '                       ******* Intelligence Artificielle *******
    '                       *****************************************

    ' *BUG* IF GOTOU=0 and joueurA = 6150 OR joueurA = 9150 OR joueurB = 6150 OR joueurB = 9150 THEN GOTOU=24

    IF GOTOU = 0 AND partie = 1 THEN

        ' ***************************IA de 1,2,3,6
        IF IA = 0 OR IA = 1 OR IA = 2 OR IA = 3 OR IA = 6 THEN
            IF sens = 6 THEN
			
                distance = xB - xA

				 IF temps < 35 THEN ' bug shining */
                           IF joueurA = 61400 THEN joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24
                 END IF
				
                IF GOTOU = 0 AND distance >= 15 THEN '  quand trop loin
                    joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24
                END IF

                IF GOTOU = 0 AND IA = 6 THEN
                    IF distance < 15 THEN
                        IF joueurA = 61400 THEN joueurB = 68: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    END IF
                END IF

                IF GOTOU = 0 AND IA = 3 THEN
                    IF distance < 15 THEN
                        IF infoBdegatT > 2 THEN
                            IF joueurA = 61400 THEN joueurB = 61002: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND joueurA = 61400 THEN joueurB = 612: reftempsB = temps: GOTOU = 24
                    END IF
                END IF


                IF GOTOU = 0 AND distance = 12 AND joueurA = 0 THEN joueurB = 61400: reftempsB = temps: Boccupe = 1: GOTOU = 24

                IF GOTOU = 0 AND distance > 9 AND distance < 15 THEN ' pour se rapprocher
                    IF levier1 = 4 THEN joueurB = 64: GOTOU = 24
                    IF GOTOU = 0 THEN levier2 = 4: GOTOU = 20
                END IF

                IF GOTOU = 0 AND distance = 9 THEN
                    IF attenteA > 50 OR attenteB > 50 THEN levier2 = 4: GOTOU = 20
                    IF GOTOU = 0 AND joueurA = 6150 THEN joueurB = 66: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND Aoccupe = 1 THEN levier2 = 4: GOTOU = 20

                END IF

                IF GOTOU = 0 AND distance < 9 AND distance > 6 THEN ' distance de combat 1
                    ' pour autoriser les croisements
                    IF demo = 0 AND joueurA = 615 THEN joueurB = 616: reftempsB = temps: Boccupe = 1: GOTOU = 24

                    ' pour se rapprocher
                    IF GOTOU = 0 AND joueurA = 6150 THEN joueurB = 68: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND levier1 = 4 THEN joueurB = 618: reftempsB = temps: Boccupe = 1: GOTOU = 24


                    'pour eviter les degats repetitIF GOTOU=0 ands

                    IF GOTOU = 0 AND IA > 1 THEN
                        IF infoBdegatG > 4 THEN
                            IF joueurA = 61002 OR joueurA = 68 THEN joueurB = 68: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF
                        IF GOTOU = 0 AND infoBdegatG > 2 THEN
                            IF joueurA = 61002 OR joueurA = 615 THEN joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND infoBdegatT > 2 THEN
                            IF joueurA = 63 THEN joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND infoBdegatF > 2 THEN
                            IF joueurA = 67 THEN joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF

                    END IF


                    'pour alterner les attaques
                    IF GOTOU = 0 AND infocoupB = 0 THEN joueurB = 611: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 1 THEN joueurB = 64: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 2 THEN joueurB = 618: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 3 THEN joueurB = 64: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 4 THEN joueurB = 61002: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 5 THEN joueurB = 68: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 6 THEN levier2 = 4: infocoupB = 0: GOTOU = 20

                END IF

                IF GOTOU = 0 AND distance <= 6 THEN

                    ' pour autoriser les croisements
                    IF demo = 0 AND joueurA = 616 THEN joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24

                    IF GOTOU = 0 AND IA = 3 THEN
                        IF joueurA = 66 THEN joueurB = 612: reftempsB = temps: GOTOU = 24
                    END IF

                    IF GOTOU = 0 AND IA = 2 THEN
                        IF joueurA = 68 THEN joueurB = 616: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    END IF

                    IF GOTOU = 0 AND IA > 1 THEN
                        IF infoBdegatG > 4 THEN
                            IF joueurA = 61002 OR joueurA = 68 THEN joueurB = 611: reftempsB = temps: Boccupe = 1: GOTOU = 24
                            IF GOTOU = 0 AND IA > 2 THEN
                                IF joueurA = 618 THEN joueurB = 618: reftempsB = temps: Boccupe = 1: GOTOU = 24
                            END IF
                        END IF
                        IF GOTOU = 0 AND infoBdegatG > 2 THEN
                            IF joueurA = 611 THEN joueurB = 611: reftempsB = temps: Boccupe = 1: GOTOU = 24
                            IF GOTOU = 0 AND joueurA = 61002 OR joueurA = 68 THEN joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF
                    END IF

                    IF GOTOU = 0 AND infocoupB = 0 THEN joueurB = 611: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 1 THEN joueurB = 617: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 2 THEN joueurB = 618: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 3 THEN joueurB = 64: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 4 THEN joueurB = 61002: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 5 THEN joueurB = 68: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 6 THEN joueurB = 64: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 7 THEN levier2 = 4: infocoupB = 0: GOTOU = 20

                END IF
            END IF


            IF GOTOU = 0 AND sens = 9 THEN

                distance = xA - xB

                IF GOTOU = 0 AND distance >= 15 THEN '  quand trop loin
                    joueurB = 915: reftempsB = temps: Boccupe = 1: GOTOU = 24
                END IF

                IF GOTOU = 0 AND IA = 6 THEN
                    IF distance < 15 THEN
                        IF joueurA = 9140 THEN joueurB = 98: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    END IF
                END IF

                IF GOTOU = 0 AND IA = 3 THEN
                    IF distance < 15 THEN
                        IF infoBdegatT > 2 THEN
                            IF joueurA = 9140 THEN joueurB = 9102: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND joueurA = 9140 THEN joueurB = 912: reftempsB = temps: GOTOU = 24
                    END IF
                END IF

                IF GOTOU = 0 AND distance = 12 AND joueurA = 94 THEN joueurB = 9140: reftempsB = temps: Boccupe = 1: GOTOU = 24

                IF GOTOU = 0 AND distance > 9 AND distance < 15 THEN ' pour se rapprocher
                    IF levier1 = 6 THEN joueurB = 94: GOTOU = 24
                    IF GOTOU = 0 THEN levier2 = 6: GOTOU = 20
                END IF

                IF GOTOU = 0 AND distance = 9 THEN
                    IF attenteA > 50 OR attenteB > 50 THEN levier2 = 6: GOTOU = 20
                    IF GOTOU = 0 AND joueurA = 9150 THEN joueurB = 96: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND Aoccupe = 1 THEN levier2 = 6: GOTOU = 20

                END IF

                IF GOTOU = 0 AND distance < 9 AND distance > 6 THEN ' distance de combat 1
                    ' pour autoriser les croisements
                    IF demo = 0 AND joueurA = 915 THEN joueurB = 916: reftempsB = temps: Boccupe = 1: GOTOU = 24

                    ' pour se rapprocher
                    IF GOTOU = 0 AND joueurA = 9150 THEN joueurB = 98: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND levier1 = 6 THEN joueurB = 918: reftempsB = temps: Boccupe = 1: GOTOU = 24


                    'pour eviter les degats repetitifs

                    IF GOTOU = 0 AND IA > 1 THEN
                        IF infoBdegatG > 4 THEN
                            IF joueurA = 9102 OR joueurA = 98 THEN joueurB = 98: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF
                        IF GOTOU = 0 AND infoBdegatG > 2 THEN
                            IF joueurA = 9102 OR joueurA = 915 THEN joueurB = 915: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND infoBdegatT > 2 THEN
                            IF joueurA = 93 THEN joueurB = 915: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND infoBdegatF > 2 THEN
                            IF joueurA = 97 THEN joueurB = 915: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF

                    END IF


                    'pour alterner les attaques
                    IF GOTOU = 0 AND infocoupB = 0 THEN joueurB = 911: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 1 THEN joueurB = 94: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 2 THEN joueurB = 918: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 3 THEN joueurB = 94: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 4 THEN joueurB = 9102: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 5 THEN joueurB = 98: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 6 THEN levier2 = 6: infocoupB = 0: GOTOU = 20

                END IF

                IF GOTOU = 0 AND distance <= 6 THEN

                    ' pour autoriser les croisements
                    IF demo = 0 AND joueurA = 916 THEN joueurB = 915: reftempsB = temps: Boccupe = 1: GOTOU = 24

                    IF GOTOU = 0 AND IA = 3 THEN
                        IF joueurA = 96 THEN joueurB = 912: reftempsB = temps: GOTOU = 24
                    END IF

                    IF GOTOU = 0 AND IA = 2 THEN
                        IF joueurA = 98 THEN joueurB = 916: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    END IF


                    IF GOTOU = 0 AND IA > 1 THEN
                        IF infoBdegatG > 4 THEN
                            IF joueurA = 9102 OR joueurA = 98 THEN joueurB = 98: reftempsB = temps: Boccupe = 1: GOTOU = 24
                            IF GOTOU = 0 AND IA > 2 THEN
                                IF joueurA = 918 THEN joueurB = 918: reftempsB = temps: Boccupe = 1: GOTOU = 24
                            END IF
                        END IF
                        IF GOTOU = 0 AND infoBdegatG > 2 THEN
                            IF joueurA = 911 THEN joueurB = 911: reftempsB = temps: Boccupe = 1: GOTOU = 24
                            IF GOTOU = 0 AND joueurA = 9102 OR joueurA = 911 THEN joueurB = 98: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF
                    END IF

                    IF GOTOU = 0 AND infocoupB = 0 THEN joueurB = 911: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 1 THEN joueurB = 917: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 2 THEN joueurB = 918: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 3 THEN joueurB = 94: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 4 THEN joueurB = 9102: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 5 THEN joueurB = 98: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 6 THEN joueurB = 94: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    IF GOTOU = 0 AND infocoupB = 7 THEN levier2 = 6: infocoupB = 0: GOTOU = 20

                END IF
            END IF

        END IF


        ' ************************* IA de 4,5,7

        IF GOTOU = 0 THEN
            IF IA = 4 OR IA = 5 OR IA = 7 THEN

                IF sens = 6 THEN
				
				 IF temps < 35 THEN ' bug shining */
                           IF joueurA = 61400 THEN joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24
                 END IF				
			
				
                    distance = xB - xA

                    IF GOTOU = 0 AND distance >= 15 THEN '  quand trop loin
                        joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    END IF


                    IF GOTOU = 0 AND distance = 12 AND joueurA = 0 THEN joueurB = 61400: reftempsB = temps: Boccupe = 1: GOTOU = 24

                    IF GOTOU = 0 AND distance > 9 AND distance < 15 THEN ' pour se rapprocher
                        IF levier1 = 4 THEN joueurB = 64: GOTOU = 24
                        IF GOTOU = 0 THEN levier2 = 4: GOTOU = 20
                    END IF

                    IF GOTOU = 0 AND distance = 9 THEN
                        IF attenteA > 50 OR attenteB > 50 THEN joueurB = 61400: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND demo = 1 THEN
                            IF attenteA > 50 THEN joueurB = 61400: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF
                        IF GOTOU = 0 AND joueurA = 6150 THEN joueurB = 68: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        'IF GOTOU = 0 AND IA < 7 THEN
                            'IF Aoccupe = 1 THEN joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        'END IF
                        IF GOTOU = 0 AND IA = 7 THEN
                            IF Aoccupe = 1 THEN levier2 = 4: GOTOU = 20
                        END IF
                    END IF



                    IF GOTOU = 0 AND distance < 9 AND distance > 6 THEN ' distance de combat 1
                        ' pour autoriser les croisements
                        IF demo = 0 AND joueurA = 615 THEN joueurB = 616: reftempsB = temps: Boccupe = 1: GOTOU = 24

                        ' pour se rapprocher
                        IF GOTOU = 0 AND joueurA = 6150 THEN joueurB = 68: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND levier1 = 4 THEN joueurB = 618: reftempsB = temps: Boccupe = 1: GOTOU = 24


                        'plus l'IA est forte, plus il y des des coups impos‚s avant infocoupB ou infodegat

                        IF GOTOU = 0 AND IA = 5 THEN
                            IF joueurA = 67 THEN joueurB = 613: reftempsB = temps: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND distance < 15 AND demo = 1 THEN
                            joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF


                        'pour eviter les degats repetitifs 
                        IF GOTOU = 0 AND infoBdegatG > 4 THEN
                            IF joueurA = 61002 OR joueurA = 68 OR joueurA = 618 THEN joueurB = 618: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF
                        IF GOTOU = 0 AND infoBdegatG > 2 THEN
                            IF joueurA = 61002 OR joueurA = 68 OR joueurA = 618 THEN joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND infoBdegatT > 2 THEN
                            IF joueurA = 63 THEN joueurB = 68: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND infoBdegatF > 2 THEN
                            IF IA < 7 THEN
                                IF joueurA = 67 THEN joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24
                            END IF
                        END IF


                        'pour alterner les attaques

                        IF GOTOU = 0 AND infocoupB = 0 THEN joueurB = 66: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 1 THEN joueurB = 67: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 2 THEN joueurB = 618: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 3 THEN joueurB = 618: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 4 THEN joueurB = 63: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 5 THEN levier2 = 4: infocoupB = 0: GOTOU = 20

                    END IF

                    IF GOTOU = 0 AND distance <= 6 THEN

                        ' pour autoriser les croisements
                        IF demo = 0 AND joueurA = 616 THEN joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24


                        IF GOTOU = 0 AND IA > 4 THEN
                            IF joueurA = 66 THEN joueurB = 612: reftempsB = temps: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND IA > 4 AND IA < 7 THEN
                            IF joueurA = 68 THEN joueurB = 616: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND infoBdegatG > 4 THEN
                            IF joueurA = 61002 OR joueurA = 68 OR joueurA = 618 THEN joueurB = 618: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF
                        IF GOTOU = 0 AND infoBdegatG > 2 THEN
                            IF joueurA = 611 THEN joueurB = 611: reftempsB = temps: Boccupe = 1: GOTOU = 24
                            IF GOTOU = 0 THEN
                                IF joueurA = 61002 OR joueurA = 68 OR joueurA = 618 THEN joueurB = 615: reftempsB = temps: Boccupe = 1: GOTOU = 24
                            END IF
                        END IF

                        IF GOTOU = 0 AND infocoupB = 0 THEN joueurB = 611: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 1 THEN joueurB = 617: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 2 THEN joueurB = 618: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 3 THEN joueurB = 68: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 4 THEN joueurB = 68: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 5 THEN levier2 = 4: infocoupB = 0: GOTOU = 20

                    END IF

                END IF


                IF GOTOU = 0 AND sens = 9 THEN

                    distance = xA - xB

                    IF distance >= 15 THEN '  quand trop loin
                        joueurB = 915: reftempsB = temps: Boccupe = 1: GOTOU = 24
                    END IF

                    'IF GOTOU = 0 AND distance < 15 THEN
					'	IF IA = 7 AND joueurA = 9140 THEN joueurB = 915: reftempsB = temps: Boccupe = 1: GOTOU=24
                    'END IF

                    IF GOTOU = 0 AND distance = 12 AND joueurA = 94 THEN joueurB = 9140: reftempsB = temps: Boccupe = 1: GOTOU = 24

                    IF GOTOU = 0 AND distance > 9 AND distance < 15 THEN ' pour se rapprocher
                        IF GOTOU = 0 AND levier1 = 6 THEN joueurB = 94: GOTOU = 24
                        IF GOTOU = 0 THEN levier2 = 6: GOTOU = 20
                    END IF

                    IF GOTOU = 0 AND distance = 9 THEN
                        IF attenteA > 50 OR attenteB > 50 THEN joueurB = 9140: reftempsB = temps: Boccupe = 1: GOTOU = 24
						IF GOTOU = 0 AND demo = 1 THEN
                            IF attenteA > 50 THEN joueurB = 9140: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF
                        IF GOTOU = 0 AND joueurA = 9150 THEN joueurB = 98: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        'IF GOTOU = 0 AND IA < 7 THEN
							'IF Aoccupe = 1 THEN joueurB = 915: reftempsB = temps: Boccupe = 1: GOTOU=24
                        'END IF
                        IF GOTOU = 0 AND IA = 7 THEN
                            IF Aoccupe = 1 THEN levier2 = 6: GOTOU = 20
                        END IF
                    END IF

                    IF GOTOU = 0 AND distance < 9 AND distance > 6 THEN ' distance de combat 1
                        ' pour autoriser les croisements
                        IF GOTOU = 0 AND demo = 0 AND joueurA = 615 THEN joueurB = 916: reftempsB = temps: Boccupe = 1: GOTOU = 24

                        ' pour se rapprocher
                        IF GOTOU = 0 AND joueurA = 9150 THEN joueurB = 98: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND levier1 = 6 THEN joueurB = 918: reftempsB = temps: Boccupe = 1: GOTOU = 24


                        'plus l'IA est forte, plus il y des des coups imposes avant infocoupB ou infodegat

                        IF GOTOU = 0 AND IA = 5 THEN
                            IF joueurA = 97 THEN joueurB = 913: reftempsB = temps: GOTOU = 24
                        END IF

                        'pour eviter les degats repetitifs
                        IF GOTOU = 0 AND infoBdegatG > 4 THEN
                            IF joueurA = 9102 OR joueurA = 98 OR joueurA = 918 THEN joueurB = 918: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF
                        IF GOTOU = 0 AND infoBdegatG > 2 THEN
                            IF joueurA = 9102 OR joueurA = 98 OR joueurA = 918 THEN joueurB = 915: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND infoBdegatT > 2 THEN
                            IF joueurA = 93 THEN joueurB = 98: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND infoBdegatF > 2 THEN
                            IF IA < 7 THEN
                                IF joueurA = 97 THEN joueurB = 915: reftempsB = temps: Boccupe = 1: GOTOU = 24
                            END IF
                        END IF



                        'pour alterner les attaques

                        IF GOTOU = 0 AND infocoupB = 0 THEN joueurB = 96: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 1 THEN joueurB = 97: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 2 THEN joueurB = 918: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 3 THEN joueurB = 918: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 4 THEN joueurB = 93: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 5 THEN levier2 = 6: infocoupB = 0: GOTOU = 20

                    END IF

                    IF GOTOU = 0 AND distance <= 6 THEN

                        ' pour autoriser les croisements
                        IF demo = 0 AND joueurA = 916 THEN joueurB = 915: reftempsB = temps: Boccupe = 1: GOTOU = 24


                        IF GOTOU = 0 AND IA > 4 THEN
                            IF joueurA = 96 THEN joueurB = 912: reftempsB = temps: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND IA > 4 AND IA < 7 THEN
                            IF joueurA = 98 THEN joueurB = 916: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF

                        IF GOTOU = 0 AND infoBdegatG > 4 THEN
                            IF joueurA = 9102 OR joueurA = 98 OR joueurA = 918 THEN joueurB = 918: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        END IF
                        IF GOTOU = 0 AND infoBdegatG > 2 THEN
                            IF joueurA = 911 THEN joueurB = 911: reftempsB = temps: Boccupe = 1: GOTOU = 24
                            IF GOTOU = 0 THEN
                                IF joueurA = 9102 OR joueurA = 98 OR joueurA = 918 THEN joueurB = 915: reftempsB = temps: Boccupe = 1: GOTOU = 24
                            END IF
                        END IF

                        IF GOTOU = 0 AND infocoupB = 0 THEN joueurB = 911: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 1 THEN joueurB = 917: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 2 THEN joueurB = 918: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 3 THEN joueurB = 98: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 4 THEN joueurB = 98: infocoupB = infocoupB + 1: reftempsB = temps: Boccupe = 1: GOTOU = 24
                        IF GOTOU = 0 AND infocoupB = 5 THEN levier2 = 6: infocoupB = 0: GOTOU = 20


                    END IF

                END IF

            END IF
        END IF

    END IF




    '                       redirection suivant les touches

    IF GOTOU = 0 AND levier2 = 1 THEN GOTOU = 20
    IF GOTOU = 0 AND levier2 = 3 THEN GOTOU = 20
    IF GOTOU = 0 AND levier2 = 7 THEN GOTOU = 20
    IF GOTOU = 0 AND levier2 = 9 THEN GOTOU = 20
    IF GOTOU = 0 AND levier2 = 8 THEN GOTOU = 20
    IF GOTOU = 0 AND levier2 = 2 THEN GOTOU = 20
    IF GOTOU = 0 AND levier2 = 4 THEN GOTOU = 20
    IF GOTOU = 0 AND levier2 = 6 THEN GOTOU = 20


    '                       actions si aucune touche n'a ete touchee

    IF GOTOU = 0 THEN
        spriteavanceB = 0
        spritereculeB = 0

        protegeDB = 0: protegeHB = 0

        attenteB = attenteB + 1
        levier2 = 5
    END IF

    ' pour se relever
    IF GOTOU = 0 THEN assisB = 0
    IF GOTOU = 0 AND joueurB = 61002 THEN joueurB = 61000: Boccupe = 1: reftempsB = temps: GOTOU = 24
    IF GOTOU = 0 AND joueurB = 9102 THEN joueurB = 9106: Boccupe = 1: reftempsB = temps: GOTOU = 24


    'attente des 5 secondes
    IF GOTOU = 0 AND sens = 6 THEN
        IF attenteB > 300 THEN joueurB = 61: Boccupe = 1: reftempsB = temps: GOTOU = 24
    END IF
    IF GOTOU = 0 AND sens = 9 THEN
        IF attenteB > 300 THEN joueurB = 91: Boccupe = 1: reftempsB = temps: GOTOU = 24
    END IF

    IF GOTOU = 0 AND sens = 6 THEN joueurB = 64
    IF GOTOU = 0 AND sens = 9 THEN joueurB = 94

    IF GOTOU = 0 THEN GOTOU = 24



    '                       *****************************************
    '                       *************actions joueur 2************
    '                       *****************************************
    'actionB:
    IF GOTOU = 20 THEN GOTOU = 0

    IF GOTOU = 0 THEN attenteB = 1

    IF GOTOU = 0 AND partie = 1 THEN '  ****** IA mode ******

        '                       droite,gauche, decapite, devant (normal)  IA
        IF GOTOU = 0 AND sens = 6 THEN
            IF levier2 = 4 THEN
                protegeDB = 0
                IF GOTOU = 0 AND spriteavanceB = 1 THEN joueurB = 3: GOTOU = 24
                IF GOTOU = 0 AND spriteavanceB = 2 THEN joueurB = 4: GOTOU = 24
                IF GOTOU = 0 AND spriteavanceB = 3 THEN joueurB = 5: GOTOU = 24
                IF GOTOU = 0 AND spriteavanceB = 4 THEN joueurB = 6: GOTOU = 24
                IF GOTOU = 0 THEN joueurB = 2: reftempsB = temps
            END IF

            IF GOTOU = 0 AND levier2 = 6 THEN
                protegeHB = 0
                IF GOTOU = 0 AND spritereculeB = 1 THEN joueurB = 8: GOTOU = 24
                IF GOTOU = 0 AND spritereculeB = 2 THEN joueurB = 9: GOTOU = 24
                IF GOTOU = 0 AND spritereculeB = 3 THEN joueurB = 10: GOTOU = 24
                IF GOTOU = 0 AND spritereculeB = 4 THEN joueurB = 11: GOTOU = 24
                IF GOTOU = 0 THEN joueurB = 7: reftempsB = temps
            END IF
        END IF
        '                       droite, gauche, decapite, devant (inverse)  ******* IA mode ********

        IF GOTOU = 0 AND sens = 9 THEN
            IF levier2 = 6 THEN
                protegeDB = 0
                IF GOTOU = 0 AND spriteavanceB = 1 THEN joueurB = 991: GOTOU = 24
                IF GOTOU = 0 AND spriteavanceB = 2 THEN joueurB = 992: GOTOU = 24
                IF GOTOU = 0 AND spriteavanceB = 3 THEN joueurB = 993: GOTOU = 24
                IF GOTOU = 0 AND spriteavanceB = 4 THEN joueurB = 994: GOTOU = 24
                IF GOTOU = 0 THEN joueurB = 99: reftempsB = temps
            END IF

            IF GOTOU = 0 AND levier2 = 4 THEN
                protegeHB = 0
                IF GOTOU = 0 AND spritereculeB = 1 THEN joueurB = 9901: GOTOU = 24
                IF GOTOU = 0 AND spritereculeB = 2 THEN joueurB = 9902: GOTOU = 24
                IF GOTOU = 0 AND spritereculeB = 3 THEN joueurB = 9903: GOTOU = 24
                IF GOTOU = 0 AND spritereculeB = 4 THEN joueurB = 9904: GOTOU = 24
                IF GOTOU = 0 THEN joueurB = 990: reftempsB = temps
            END IF
        END IF

        GOTOU = 24
    END IF



    '                       droite,gauche, decapite, devant (normal)


    IF GOTOU = 0 AND sens = 6 THEN
        IF levier2 = 4 THEN
            protegeDB = 0
			IF GOTOU = 0 AND attaqueB = 1 AND entree = 0 THEN joueurB = 66: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 AND spriteavanceB = 1 THEN joueurB = 3: GOTOU = 24
            IF GOTOU = 0 AND spriteavanceB = 2 THEN joueurB = 4: GOTOU = 24
            IF GOTOU = 0 AND spriteavanceB = 3 THEN joueurB = 5: GOTOU = 24
            IF GOTOU = 0 AND spriteavanceB = 4 THEN joueurB = 6: GOTOU = 24			
            IF GOTOU = 0 THEN joueurB = 2: reftempsB = temps: GOTOU = 24
            
        END IF

        IF GOTOU = 0 AND levier2 = 6 THEN
            protegeHB = 0
			IF GOTOU = 0 AND attaqueB = 1 AND sortieB = 0 THEN joueurB = 61400: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 AND spritereculeB = 1 THEN joueurB = 8: GOTOU = 24
            IF GOTOU = 0 AND spritereculeB = 2 THEN joueurB = 9: GOTOU = 24
            IF GOTOU = 0 AND spritereculeB = 3 THEN joueurB = 10: GOTOU = 24
            IF GOTOU = 0 AND spritereculeB = 4 THEN joueurB = 11: GOTOU = 24			
            IF GOTOU = 0 THEN joueurB = 7: reftempsB = temps: GOTOU = 24
            
        END IF
    END IF


    '                       droite, gauche, decapite, devant (inverse)

    IF GOTOU = 0 AND sens = 9 THEN
        IF levier2 = 6 THEN
            protegeDB = 0
			IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 96: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 AND spriteavanceB = 1 THEN joueurB = 991: GOTOU = 24
            IF GOTOU = 0 AND spriteavanceB = 2 THEN joueurB = 992: GOTOU = 24
            IF GOTOU = 0 AND spriteavanceB = 3 THEN joueurB = 993: GOTOU = 24
            IF GOTOU = 0 AND spriteavanceB = 4 THEN joueurB = 994: GOTOU = 24			
            IF GOTOU = 0 THEN joueurB = 99: reftempsB = temps: GOTOU = 24
            
        END IF

        IF GOTOU = 0 AND levier2 = 4 THEN
            protegeHB = 0
			IF GOTOU = 0 AND attaqueB = 1 AND sortieB = 0 THEN joueurB = 9140: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 AND spritereculeB = 1 THEN joueurB = 9901: GOTOU = 24
            IF GOTOU = 0 AND spritereculeB = 2 THEN joueurB = 9902: GOTOU = 24
            IF GOTOU = 0 AND spritereculeB = 3 THEN joueurB = 9903: GOTOU = 24
            IF GOTOU = 0 AND spritereculeB = 4 THEN joueurB = 9904: GOTOU = 24
            IF GOTOU = 0 THEN joueurB = 990: reftempsB = temps: GOTOU = 24            
        END IF
    END IF

    '                           saute, attaque cou

    IF GOTOU = 0 AND sens = 6 THEN
        IF levier2 = 2 THEN
            protegeDB = 0: protegeHB = 0
			IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 63: Boccupe = 1: reftempsB = temps: GOTOU = 2
            IF GOTOU = 0 THEN joueurB = 616: Boccupe = 1: reftempsB = temps: GOTOU = 24
        END IF
    END IF

    IF GOTOU = 0 AND sens = 9 THEN
        IF levier2 = 2 THEN
            protegeDB = 0: protegeHB = 0
			IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 93: Boccupe = 1: reftempsB = temps: GOTOU = 2
            IF GOTOU = 0 THEN joueurB = 916: Boccupe = 1: reftempsB = temps: GOTOU = 24
        END IF
    END IF


    '                               assis, attaque genou
    IF GOTOU = 0 AND sens = 6 THEN
        IF levier2 = 8 THEN
            IF attaqueB = 1 THEN joueurB = 68: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 AND assisB = 1 THEN joueurB = 61002: GOTOU = 24
            IF GOTOU = 0 THEN joueurB = 6100: Boccupe = 1: reftempsB = temps: GOTOU = 24
        END IF
    END IF
    IF GOTOU = 0 AND sens = 9 THEN
        IF levier2 = 8 THEN
            IF attaqueB = 1 THEN joueurB = 98: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 AND assisB = 1 THEN joueurB = 9102: GOTOU = 24
            IF GOTOU = 0 THEN joueurB = 9100: Boccupe = 1: reftempsB = temps: GOTOU = 24
        END IF
    END IF


    '                               roulade AV, coup de pied
    IF GOTOU = 0 AND sens = 6 THEN
        IF levier2 = 7 THEN
			IF attaqueB = 1 THEN joueurB = 611: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 THEN joueurB = 615: Boccupe = 1: reftempsB = temps: GOTOU = 24           
        END IF
    END IF
    IF GOTOU = 0 AND sens = 9 THEN
        IF levier2 = 9 THEN
			IF attaqueB = 1 THEN joueurB = 911: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 THEN joueurB = 915: Boccupe = 1: reftempsB = temps: GOTOU = 24            
        END IF
    END IF



    '                               roulade AR, coup sur front
    IF GOTOU = 0 AND sens = 6 THEN
        IF levier2 = 9 THEN
			IF attaqueB = 1 THEN joueurB = 67: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 THEN joueurB = 6150: Boccupe = 1: reftempsB = temps: GOTOU = 24            
        END IF
    END IF
    IF GOTOU = 0 AND sens = 9 THEN
        IF levier2 = 7 THEN
			IF attaqueB = 1 THEN joueurB = 97: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 THEN joueurB = 9159: Boccupe = 1: reftempsB = temps: GOTOU = 24            
        END IF
    END IF

    '                                   protection Haute, araignee
    IF GOTOU = 0 AND sens = 6 THEN
        IF levier2 = 3 THEN
            IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 618: Boccupe = 1: reftempsB = temps: GOTOU = 24		
            IF GOTOU = 0 AND protegeHB = 1 THEN joueurB = 613: GOTOU = 24
            IF GOTOU = 0 THEN joueurB = 6131: Boccupe = 1: reftempsB = temps: GOTOU = 24
        END IF
    END IF

    IF GOTOU = 0 AND sens = 9 THEN
        IF levier2 = 1 THEN
            IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 918: Boccupe = 1: reftempsB = temps: GOTOU = 24 
			IF GOTOU = 0 AND protegeHB = 1 THEN joueurB = 913: GOTOU = 24
            IF GOTOU = 0 THEN joueurB = 9131: Boccupe = 1: reftempsB = temps: GOTOU = 24
        END IF
    END IF


    '                                   protection devant, coup de tete
    IF GOTOU = 0 AND sens = 6 THEN
        IF levier2 = 1 THEN
			IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 617: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 AND protegeDB = 1 THEN joueurB = 612: GOTOU = 24
            IF GOTOU = 0 THEN joueurB = 6121: Boccupe = 1: reftempsB = temps: GOTOU = 24            
        END IF
    END IF
    IF GOTOU = 0 AND sens = 9 THEN
        IF levier2 = 3 THEN
			IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 917: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 AND protegeDB = 1 THEN joueurB = 912: GOTOU = 24
            IF GOTOU = 0 THEN joueurB = 9121: Boccupe = 1: reftempsB = temps: GOTOU = 24            
        END IF
    END IF


    '                       ***********************************
    '                       *********gestion joueur 2**********
    '                       ***********************************
    'gestionB:
    IF GOTOU = 24 THEN GOTOU = 0

    IF GOTOU = 0 AND joueurB = 64 THEN 'debout
        spriteB = 0
        'IF GOTOU=0 and marianna=1 then spriteB=6969
        decapiteB = 1
        sangB = 0
        xAttB = xB + 4: yAttB = 14:
        yFB = 15: yTB = 16: yMB = 18: yGB = 20
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        IF GOTOU = 0 AND partie = 1 THEN
            IF GOTOU = 0 AND temps > reftempsB + 20 THEN Boccupe = 0
        END IF
        GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 94 THEN ' deboutR
        spriteB = 0
        decapiteB = 1
        sangB = 0
        xAttB = xB: yAttB = 14
        yFB = 15: yTB = 16: yMB = 18: yGB = 20
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        IF GOTOU = 0 AND partie = 1 THEN
            IF GOTOU = 0 AND temps > reftempsB + 20 THEN Boccupe = 0
        END IF
        GOTOU = 2
    END IF


    IF GOTOU = 0 AND joueurB = 61 THEN ' attente
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        IF GOTOU = 0 AND temps > reftempsB + 60 THEN Boccupe = 0: attenteB = 1: joueurB = 64: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 50 THEN spriteB = 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 40 THEN spriteB = 2: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN spriteB = 3: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 21 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN 
			spriteB = 2: GOTOU = 2 '_SNDPLAY attente:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_attente), (strptr(sfx_attente_end)-strptr(sfx_attente)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)			
		END IF
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN spriteB = 1: GOTOU = 2
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 91 THEN ' attenteR
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        IF GOTOU = 0 AND temps > reftempsB + 60 THEN Boccupe = 0: attenteB = 1: joueurB = 94: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 50 THEN spriteB = 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 40 THEN spriteB = 2: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN spriteB = 3: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 21 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN 
			spriteB = 2: GOTOU = 2 '_SNDPLAY attente:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_attente), (strptr(sfx_attente_end)-strptr(sfx_attente)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)			
		END IF
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN spriteB = 1: GOTOU = 2 
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    '                                   avance
    IF GOTOU = 0 AND joueurB = 2 THEN
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        IF GOTOU = 0 AND attaqueB = 1 AND entree = 0 THEN joueurB = 66: Boccupe = 1: reftempsB = temps: GOTOU = 24
        spriteB = 4: spriteavanceB = 1: xB = xB - 1
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 3 THEN ' avance1
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        IF GOTOU = 0 AND attaqueB = 1 AND entree = 0 THEN joueurB = 66: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 9 THEN xB = xB - 1: spriteB = 5: spriteavanceB = 2
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 4 THEN ' avance2
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        spriteB = 5
        IF GOTOU = 0 AND attaqueB = 1 AND entree = 0 THEN joueurB = 66: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 18 THEN xB = xB - 1: spriteB = 6: spriteavanceB = 3
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 5 THEN ' avance3
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        spriteB = 6
        IF GOTOU = 0 AND attaqueB = 1 AND entree = 0 THEN joueurB = 66: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 27 THEN xB = xB - 1: spriteB = 0: spriteavanceB = 4
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 6 THEN ' avance4
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        spriteB = 0
        IF GOTOU = 0 AND attaqueB = 1 AND entree = 0 THEN joueurB = 66: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 36 THEN joueurB = 64: reftempsB = temps: spriteavanceB = 0
        IF GOTOU = 0 THEN GOTOU = 2
    END IF


    IF GOTOU = 0 AND joueurB = 99 THEN ' avanceR
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        xAttB = xB
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 96: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 THEN spriteB = 4: spriteavanceB = 1: xB = xB + 1
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 991 THEN ' avance1R
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        xAttB = xB
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 96: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 9 THEN xB = xB + 1: spriteB = 5: spriteavanceB = 2
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 992 THEN ' avance2R
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        xAttB = xB
        spriteB = 5
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 96: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 18 THEN xB = xB + 1: spriteB = 6: spriteavanceB = 3
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 993 THEN ' avance3R
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        xAttB = xB
        spriteB = 6
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 96: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 27 THEN xB = xB + 1: spriteB = 0: spriteavanceB = 4
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 994 THEN ' avance4R
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        xAttB = xB
        spriteB = 0
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 96: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 36 THEN joueurB = 94: reftempsB = temps: spriteavanceB = 0
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    '                                        recule
    IF GOTOU = 0 AND joueurB = 7 THEN
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        IF GOTOU = 0 AND attaqueB = 1 AND sortieB = 0 THEN joueurB = 61400: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 THEN spriteB = 6: spritereculeB = 1: xB = xB + 1
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 8 THEN ' recule1
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        IF GOTOU = 0 AND attaqueB = 1 AND sortieB = 0 THEN joueurB = 61400: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 9 THEN xB = xB + 1: spriteB = 5: spritereculeB = 2
        IF GOTOU = 0 THEN GOTOU = 2
    END IF
    IF GOTOU = 0 AND joueurB = 9 THEN ' recule2
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        spriteB = 5
        IF GOTOU = 0 AND attaqueB = 1 AND sortieB = 0 THEN joueurB = 61400: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 18 THEN xB = xB + 1: spriteB = 4: spritereculeB = 3
        IF GOTOU = 0 THEN GOTOU = 2
    END IF
    IF GOTOU = 0 AND joueurB = 10 THEN ' recule3
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        spriteB = 4
        IF GOTOU = 0 AND attaqueB = 1 AND sortieB = 0 THEN joueurB = 61400: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 27 THEN xB = xB + 1: spriteB = 0: spritereculeB = 4
        IF GOTOU = 0 THEN GOTOU = 2
    END IF
    IF GOTOU = 0 AND joueurB = 11 THEN ' recule4
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        spriteB = 0
        IF GOTOU = 0 AND attaqueB = 1 AND sortieB = 0 THEN joueurB = 61400: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 36 THEN joueurB = 64: reftempsB = temps: spritereculeB = 0
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    '                               recule inverse
    IF GOTOU = 0 AND joueurB = 990 THEN
        xAttB = xB
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        IF GOTOU = 0 AND attaqueB = 1 AND sortieB = 0 THEN joueurB = 9140: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 THEN spriteB = 6: spritereculeB = 1: xB = xB - 1
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 9901 THEN ' recule1R
        xAttB = xB
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        IF GOTOU = 0 AND attaqueB = 1 AND sortieB = 0 THEN joueurB = 9140: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 9 THEN xB = xB - 1: spriteB = 5: spritereculeB = 2
        IF GOTOU = 0 THEN GOTOU = 2
    END IF
    IF GOTOU = 0 AND joueurB = 9902 THEN ' recule2R
        xAttB = xB
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        spriteB = 5
        IF GOTOU = 0 AND attaqueB = 1 AND sortieB = 0 THEN joueurB = 9140: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 18 THEN xB = xB - 1: spriteB = 4: spritereculeB = 3
        IF GOTOU = 0 THEN GOTOU = 2
    END IF
    IF GOTOU = 0 AND joueurB = 9903 THEN ' recule3R
        xAttB = xB
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        spriteB = 4
        IF GOTOU = 0 AND attaqueB = 1 AND sortieB = 0 THEN joueurB = 9140: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 27 THEN xB = xB - 1: spriteB = 0: spritereculeB = 4
        IF GOTOU = 0 THEN GOTOU = 2
    END IF
    IF GOTOU = 0 AND joueurB = 9904 THEN ' recule4R
        xAttB = xB
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        spriteB = 0
        IF GOTOU = 0 AND attaqueB = 1 AND sortieB = 0 THEN joueurB = 9140: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 36 THEN joueurB = 94: reftempsB = temps: spritereculeB = 0
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 616 THEN ' saute
        xAttB = xB + 4: xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yGB = yMB: yAttB = 14
        decapiteB = 0
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 63: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 60 THEN Boccupe = 0: spriteB = 0: joueurB = 64: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 50 THEN spriteB = 0: xMB = xB: xGB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 40 THEN spriteB = 7: xMB = xB: xGB = xB + 1: decapiteB = 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN spriteB = 8: xMB = xB + 3: xGB = xB + 3: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN spriteB = 7: xMB = xB: xGB = xB + 3: GOTOU = 2
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 7: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 916 THEN 'sauteR
        xAttB = xB: xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        yGB = yMB: yAttB = 14
        decapiteB = 0
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 93: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 60 THEN Boccupe = 0: spriteB = 0: joueurB = 94: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 50 THEN spriteB = 0: xMB = xB + 4: xGB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 40 THEN spriteB = 7: xMB = xB + 4: xGB = xB + 1: decapiteB = 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN spriteB = 8: xMB = xB + 1: xGB = xB + 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN spriteB = 7: xMB = xB + 4: xGB = xB + 1: GOTOU = 2
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 7: GOTOU = 2
    END IF


    IF GOTOU = 0 AND joueurB = 6100 THEN ' assis
        xAttB = xB + 4
        xFB = xB + 4: xTB = xB + 4: xMB = xB: xGB = xB
        spriteB = 9
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 68: Boccupe = 1: reftempsB = temps: GOTOU = 24 
		IF GOTOU = 0 AND temps > reftempsB + 10 THEN joueurB = 61002: GOTOU = 2
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 61002 THEN ' assis2
        Boccupe = 0
		assisB = 1
        xAttB = xB + 4
        xFB = xB + 4: xTB = xB + 4: xMB = xB: xGB = xB
        spriteB = 10
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 68: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND partie = 1 THEN
            IF GOTOU = 0 AND temps > reftempsB + 20 THEN Boccupe = 0
            GOTOU = 2
        END IF
		IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 61000 THEN 'releve
        xAttB = xB + 4: yAttA = 14
        xFB = xB + 4: xTB = xB + 4: xMB = xB: xGB = xB
        spriteB = 9
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN joueurB = 64: Boccupe = 0: GOTOU = 2
        IF GOTOU = 0 THEN GOTOU = 2
    END IF


    IF GOTOU = 0 AND joueurB = 9100 THEN ' assisR
        xAttB = xB
        xFB = xB: xTB = xB: xMB = xB + 4: xGB = xB + 4
        spriteB = 9
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 98: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN joueurB = 9102: GOTOU = 2
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 9102 THEN ' assis2R
        Boccupe = 0
		assisB = 1
        xAttB = xB
        xFB = xB: xTB = xB: xMB = xB + 4: xGB = xB + 4
        spriteB = 10
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 98: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND partie = 1 THEN
            IF GOTOU = 0 AND temps > reftempsB + 20 THEN Boccupe = 0
            GOTOU = 2
        END IF
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 9106 THEN ' releveR
        xAttB = xB: yAttA = 14
        xFB = xB: xTB = xB: xMB = xB + 4: xGB = xB + 4
        spriteB = 9
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN joueurB = 94: Boccupe = 0: GOTOU = 2
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 615 THEN ' rouladeAV
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB
        yGB = 20: yAttB = yGB: xAttB = xB + 4
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 611: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 48 THEN
            spriteB = 0: xTB = xB: xMB = xB:
            Boccupe = 0: xB = xB - 1: joueurB = 61500: GOTOU = 6
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 45 THEN spriteB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 42 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 41 THEN xB = xB - 1: spriteB = 16: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 38 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 37 THEN xB = xB - 1: spriteB = 15: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 34 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 33 THEN xB = xB - 1: spriteB = 15: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 29 THEN xB = xB - 1: spriteB = 14: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 26 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN xB = xB - 1: spriteB = 14: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 22 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 21 THEN xB = xB - 1: xAttB = xB - 1: spriteB = 13: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 18 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 17 THEN xB = xB - 1: xAttB = xB - 1: spriteB = 13: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 14 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 13 THEN xB = xB - 1: spriteB = 12: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 9 THEN xB = xB - 1: spriteB = 12: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 6 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 5 THEN xB = xB - 1: spriteB = 11: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN 
			xB = xB - 1: spriteB = 11: GOTOU = 2 
			IF musiqueLOOP = 0 AND joueurA != 61400 THEN SNDZEROPLAY(1, strptr(sfx_roule), (strptr(sfx_roule_end)-strptr(sfx_roule)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF		
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 11: GOTOU = 2
    END IF

    'finderouladeB:
    IF GOTOU = 6 THEN GOTOU = 0

    IF GOTOU = 0 AND joueurB = 61500 THEN
        IF GOTOU = 0 AND xB > xA THEN
            joueurB = 64
            spriteB = 0
			spriteavanceB = 0
            xAttB = xB + 4: yAttB = 17
            yFB = 15: yTB = 16: yMB = 18: yGB = 20
            xFB = xB: xTB = xB: xMB = xB: xGB = xB
            GOTOU = 2
        END IF
        IF GOTOU = 0 AND xB < xA + 1 THEN
            joueurA = 614: yAttA = 14: Aoccupe = 1: reftemps = temps
            joueurB = 614: yAttB = 14: Boccupe = 1: reftempsB = temps
            GOTOU = 31
        END IF
    END IF

    IF GOTOU = 0 AND joueurB = 915 THEN 'rouladeAVR
        xFB = xB: xTB = xB: xMB = xB: xGB = xB + 4
        yGB = 20: yAttB = yGB: xAttB = xB
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 911: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 48 THEN
            spriteB = 0: xTB = xB + 4: xMB = xB + 4:
            Boccupe = 0: xB = xB + 1: joueurB = 9150: GOTOU = 7
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 45 THEN spriteB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 42 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 41 THEN xB = xB + 1: spriteB = 16: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 38 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 37 THEN xB = xB + 1: spriteB = 15: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 34 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 33 THEN xB = xB + 1: spriteB = 15: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 29 THEN xB = xB + 1: spriteB = 14: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 26 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN xB = xB + 1: spriteB = 14: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 22 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 21 THEN xB = xB + 1: xAttB = xB + 5: spriteB = 13: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 18 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 17 THEN xB = xB + 1: xAttB = xB + 5: spriteB = 13: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 14 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 13 THEN xB = xB + 1: spriteB = 12: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 9 THEN xB = xB + 1: spriteB = 12: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 6 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 5 THEN xB = xB + 1: spriteB = 11: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN 
			xB = xB + 1: spriteB = 11: GOTOU = 2
			IF musiqueLOOP = 0 AND joueurA != 9140 THEN SNDZEROPLAY(1, strptr(sfx_roule), (strptr(sfx_roule_end)-strptr(sfx_roule)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF		
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 11: GOTOU = 2
    END IF

    'finderouladeBR:
    IF GOTOU = 7 THEN GOTOU = 0

    IF GOTOU = 0 AND joueurB = 9150 THEN
        IF GOTOU = 0 AND xB < xA THEN
            joueurB = 94
            spriteB = 0
			spriteavanceB = 0
            xAttB = xB: yAttB = 17
            yFB = 15: yTB = 16: yMB = 18: yGB = 20
            xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
            GOTOU = 2
        END IF
        IF GOTOU = 0 AND xB > xA - 1 THEN
            joueurA = 914: Aoccupe = 1: reftemps = temps
            joueurB = 914: Boccupe = 1: reftempsB = temps
            GOTOU = 31
        END IF
    END IF


    IF GOTOU = 0 AND joueurB = 6150 THEN 'rouladeAR
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB
        yGB = 20: yAttB = yGB: xAttB = xB + 4
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 67: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 44 THEN
            spriteB = 0: xTB = xB: xMB = xB:
			spritereculeB = 0
            Boccupe = 0: joueurB = 64: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 41 THEN spriteB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 38 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 37 THEN xB = xB + 1: spriteB = 11: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 34 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 33 THEN xB = xB + 1: spriteB = 11: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 29 THEN xB = xB + 1: spriteB = 12: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 26 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN xB = xB + 1: spriteB = 12: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 22 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 21 THEN xB = xB + 1: spriteB = 13: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 18 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 17 THEN xB = xB + 1: spriteB = 13: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 14 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 13 THEN xB = xB + 1: spriteB = 14: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 9 THEN xB = xB + 1: spriteB = 14: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 6 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 5 THEN xB = xB + 1: spriteB = 15: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN 
			xB = xB + 1: spriteB = 16: GOTOU = 2
			IF musiqueLOOP = 0 AND joueurA != 61400 THEN SNDZEROPLAY(1, strptr(sfx_roule), (strptr(sfx_roule_end)-strptr(sfx_roule)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF		
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 16: GOTOU = 2
    END IF
	
    IF GOTOU = 0 AND joueurB = 9159 THEN 'rouladeARR
        xFB = xB: xTB = xB: xMB = xB: xGB = xB + 4
        yGB = 20: yAttB = yGB: xAttB = xB
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 97: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 44 THEN
            spriteB = 0: xTB = xB + 4: xMB = xB + 4
			spritereculeB = 0
            Boccupe = 0: joueurB = 94: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 41 THEN spriteB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 38 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 37 THEN xB = xB - 1: spriteB = 11: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 34 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 33 THEN xB = xB - 1: spriteB = 11: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 29 THEN xB = xB - 1: spriteB = 12: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 26 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN xB = xB - 1: spriteB = 12: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 22 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 21 THEN xB = xB - 1: spriteB = 13: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 18 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 17 THEN xB = xB - 1: spriteB = 13: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 14 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 13 THEN xB = xB - 1: spriteB = 14: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 9 THEN xB = xB - 1: spriteB = 14: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 6 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 5 THEN xB = xB - 1: spriteB = 15: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN 
			xB = xB - 1: spriteB = 16: GOTOU = 2
			IF musiqueLOOP = 0 AND joueurA != 9140 THEN SNDZEROPLAY(1, strptr(sfx_roule), (strptr(sfx_roule_end)-strptr(sfx_roule)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF		
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 16: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 6131 THEN 'protegeH1
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        xAttB = xB + 4
        yGB = 20
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 618: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 5 THEN protegeHB = 1: spriteB = 17: Boccupe = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN 
			xB = xB + 1: spriteB = 4: GOTOU = 2
			'_SNDPLAY protege:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_protege), (strptr(sfx_protege_end)-strptr(sfx_protege)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF		
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 4: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 613 THEN 'protegeH
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 618: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 THEN 
			xFB = xB: xTB = xB: xMB = xB: xGB = xB
			xAttB = xB + 4
			yGB = 20
			spriteB = 17
			GOTOU = 2
		END IF
    END IF

    IF GOTOU = 0 AND joueurB = 9131 THEN 'protegeH1R
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        xAttB = xB
        yGB = 20
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 918: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 5 THEN protegeHB = 1: spriteB = 17: Boccupe = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN 
			xB = xB - 1: spriteB = 4: GOTOU = 2
			'_SNDPLAY protege:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_protege), (strptr(sfx_protege_end)-strptr(sfx_protege)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 4: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 913 THEN 'protegeHR
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 918: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 THEN 
			xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
			xAttB = xB
			yGB = 20
			spriteB = 17
			GOTOU = 2
		END IF
    END IF

    IF GOTOU = 0 AND joueurB = 6121 THEN ' protegeD1
        xAttB = xB + 4
        yGB = 20
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        decapiteB = 0
        spriteB = 17
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 617: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 5 THEN joueurB = 612: protegeDB = 1: Boccupe = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN
			GOTOU = 2 '_SNDPLAY protege:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_protege), (strptr(sfx_protege_end)-strptr(sfx_protege)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF 
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 612 THEN 'protedeD
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 617: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 THEN 
			xAttB = xB + 4
			yGB = 20
			xFB = xB: xTB = xB: xMB = xB: xGB = xB
			decapiteB = 0
			spriteB = 18
			GOTOU = 2
		END IF
    END IF

    IF GOTOU = 0 AND joueurB = 9121 THEN 'protegeD1R
        xAttB = xB
        yGB = 20
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        decapiteB = 0
        spriteB = 17
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 917: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 AND temps > reftempsB + 5 THEN joueurB = 912: protegeDB = 1: Boccupe = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN
			GOTOU = 2 '_SNDPLAY protege:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_protege), (strptr(sfx_protege_end)-strptr(sfx_protege)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF 
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 912 THEN 'protegeDR
        IF GOTOU = 0 AND attaqueB = 1 THEN joueurB = 917: Boccupe = 1: reftempsB = temps: GOTOU = 24
        IF GOTOU = 0 THEN 
			xAttB = xB
			yGB = 20
			xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
			decapiteB = 0
			spriteB = 18
			GOTOU = 2
		END IF
    END IF

    IF GOTOU = 0 AND joueurB = 63 THEN ' cou
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yGB = 20
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN Boccupe = 0: joueurB = 64: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN spriteB = 19: xAttB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 21 THEN xAttB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN
            spriteB = 20
            IF GOTOU = 0 AND joueurA = 63 THEN GOTOU = 2
            xTB = xB + 4: xAttB = xB - 3: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteB = 19: yAttB = yTB: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 17: GOTOU = 2 'spriteprotegehaut
    END IF

    IF GOTOU = 0 AND joueurB = 93 THEN ' couR
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        yGB = 20
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN Boccupe = 0: joueurB = 94: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN spriteB = 19: xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 21 THEN xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN
            spriteB = 20
            IF GOTOU = 0 AND joueurA = 93 THEN GOTOU = 2
            xTB = xB: xAttB = xB + 7: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)			
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteB = 19: yAttB = yTB: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 17: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 66 THEN 'devant
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yGB = 20
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN Boccupe = 0: joueurB = 64: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN spriteB = 22: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 21 THEN spriteB = 23: xAttB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN
            spriteB = 23
            IF joueurA = 66 THEN GOTOU = 2
            IF GOTOU = 0 AND joueurA = 612 AND distance < 7 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
            END IF
            xMB = xB + 4: xAttB = xB - 2: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteB = 22: yAttB = yMB: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 21: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 96 THEN ' devantR
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        yGB = 20
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN Boccupe = 0: joueurB = 94: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN spriteB = 22: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 21 THEN spriteB = 23: xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN
            spriteB = 23
            IF joueurA = 96 THEN GOTOU = 2
            IF GOTOU = 0 AND joueurA = 912 AND distance < 7 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
            END IF
            xMB = xB: xAttB = xB + 6: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteB = 22: yAttB = yMB: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 21: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 68 THEN 'genou
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB
        yGB = 20
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN Boccupe = 0: joueurB = 61002: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN spriteB = 10: GOTOU = 2 ' sprite assis2
        IF GOTOU = 0 AND temps > reftempsB + 21 THEN spriteB = 25: xAttB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN
            spriteB = 25
            IF GOTOU = 0 AND joueurA = 68 THEN GOTOU = 2
            xGB = xB + 4: xAttB = xB - 3: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)			
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteB = 10: yAttB = yGB: GOTOU = 2 ' sprite assis2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 24: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 98 THEN ' genouR
        xFB = xB: xTB = xB: xMB = xB: xGB = xB + 4
        yGB = 20
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN Boccupe = 0: joueurB = 9102: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN spriteB = 10: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 21 THEN spriteB = 25: xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN
            spriteB = 25
            IF GOTOU = 0 AND joueurA = 98 THEN GOTOU = 2
            xGB = xB: xAttB = xB + 7: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteB = 10: yAttB = yGB: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 24: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 618 THEN ' araignee
        xFB = xB: xTB = xB: xMB = xB + 4: xGB = xB
        yAttB = yGB: xAttB = xB + 4: yGB = 20
        IF GOTOU = 0 AND temps > reftempsB + 35 THEN Boccupe = 0: joueurB = 64: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN xAttB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteB = 29
            xAttB = xB - 1: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN spriteB = 28: xAttB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteB = 27: xAttB = xB + 4: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 26: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 918 THEN ' araigneeR
        xFB = xB + 4: xTB = xB + 4: xMB = xB: xGB = xB + 4
        yAttB = yGB: xAttB = xB: yGB = 20
        IF GOTOU = 0 AND temps > reftempsB + 35 THEN Boccupe = 0: joueurB = 94: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteB = 29
            xAttB = xB + 5: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN spriteB = 28: xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteB = 27: xAttB = xB: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 26: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 611 THEN 'coupdepied
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        spriteB = 30: yAttB = yGB: yGB = 20
        IF GOTOU = 0 AND temps > reftempsB + 50 THEN Boccupe = 0: spriteB = 0: joueurB = 64: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 40 THEN spriteB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN spriteB = 30: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 16 THEN spriteB = 31: xAttB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 15 THEN spriteB = 31: xAttB = xB - 1: GOTOU = 2
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 911 THEN 'coupdepiedR
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        spriteB = 30: yAttB = yGB: yGB = 20
        IF GOTOU = 0 AND temps > reftempsB + 50 THEN Boccupe = 0: spriteB = 0: joueurB = 94: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 40 THEN spriteB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN spriteB = 30: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 16 THEN spriteB = 31: xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 15 THEN spriteB = 31: xAttB = xB + 5: GOTOU = 2
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 617 THEN 'coupdetete
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yGB = 20
        IF GOTOU = 0 AND temps > reftempsB + 36 THEN Boccupe = 0: joueurB = 64: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 29 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 28 THEN xB = xB + 1: spriteB = 32: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN xAttB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 17 THEN spriteB = 33: xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 16 THEN xB = xB - 1: spriteB = 33: xAttB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 8 THEN spriteB = 32: yAttB = yTB: GOTOU = 2
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 32: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 917 THEN 'coupdeteteR
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        yGB = 20
        IF GOTOU = 0 AND temps > reftempsB + 36 THEN Boccupe = 0: joueurB = 94: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 29 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 28 THEN xB = xB - 1: spriteB = 32: xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 17 THEN spriteB = 33: xAttB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 16 THEN xB = xB + 1: spriteB = 33: xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 8 THEN spriteB = 32: yAttB = yTB: GOTOU = 2
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 32: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 61400 THEN 'decapite
        decapiteB = 0
        xFB = xB + 1: xTB = xB + 2: xMB = xB + 2: xGB = xB
        IF GOTOU = 0 AND temps > reftempsB + 58 THEN Boccupe = 0: spriteB = 0: joueurB = 64: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 55 THEN spriteB = 19: xAttB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 51 THEN spriteB = 20: xAttB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 50 THEN spriteB = 20: xTB = xB + 4: xAttB = xB - 2: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 39 THEN spriteB = 20: yAttB = yTB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 33 THEN spriteB = 19: yAttB = yTB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 29 THEN spriteB = 17: yAttB = yTB: GOTOU = 2 'spriteprotegehaut
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 24 THEN xB = xB - 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN spriteB = 39: GOTOU = 2 
        IF GOTOU = 0 AND temps > reftempsB + 19 THEN xB = xB - 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 15 THEN spriteB = 39: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 14 THEN xB = xB - 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN spriteB = 38: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 9 THEN xB = xB - 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 5 THEN spriteB = 38: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 4 THEN xB = xB - 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN spriteB = 37: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN xB = xB - 1: spriteB = 37: GOTOU = 2
        IF GOTOU = 0 AND temps >= reftempsB THEN 
			spriteB = 37: GOTOU = 2
			'_SNDPLAY decapite:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_decapite), (strptr(sfx_decapite_end)-strptr(sfx_decapite)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END If		
    END IF

    IF GOTOU = 0 AND joueurB = 9140 THEN 'decapiteR
        decapiteB = 0
        xFB = xB + 3: xTB = xB + 2: xMB = xB + 2: xGB = xB + 4
        IF GOTOU = 0 AND temps > reftempsB + 58 THEN Boccupe = 0: spriteB = 0: joueurB = 94: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 55 THEN spriteB = 19: xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 51 THEN spriteB = 20: xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 50 THEN spriteB = 20: xTB = xB: xAttB = xB + 6: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 39 THEN spriteB = 20: yAttB = yTB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 33 THEN spriteB = 19: yAttB = yTB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 29 THEN spriteB = 17: yAttB = yTB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 24 THEN xB = xB + 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN spriteB = 39: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 19 THEN xB = xB + 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 15 THEN spriteB = 39: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 14 THEN xB = xB + 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN spriteB = 38: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 9 THEN xB = xB + 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 5 THEN spriteB = 38: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 4 THEN xB = xB + 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN spriteB = 37: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN xB = xB + 1: spriteB = 37: GOTOU = 2
        IF GOTOU = 0 AND temps >= reftempsB THEN
			spriteB = 37: GOTOU = 2
			'_SNDPLAY decapite:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_decapite), (strptr(sfx_decapite_end)-strptr(sfx_decapite)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END If		
    END IF

    IF GOTOU = 0 AND joueurB = 67 THEN 'front
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yGB = 20
        IF GOTOU = 0 AND temps > reftempsB + 40 THEN Boccupe = 0: joueurB = 64: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN spriteB = 35: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 24 THEN spriteB = 36: xAttB = xB + 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 23 THEN
            spriteB = 36: distance = xB - xA
            IF joueurA = 67 THEN GOTOU = 2
            IF GOTOU = 0 AND joueurA = 613 AND distance < 9 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
            END IF
            xFB = xB + 4: xAttB = xB - 3: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteB = 35: yAttB = yFB: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 34: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 97 THEN 'frontR
        yGB = 20
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        IF GOTOU = 0 AND temps > reftempsB + 40 THEN Boccupe = 0: joueurB = 94: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN spriteB = 35: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 24 THEN spriteB = 36: xAttB = xB: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 23 THEN
            spriteB = 36: distance = xA - xB
            IF joueurA = 97 THEN GOTOU = 2
            IF GOTOU = 0 AND joueurA = 913 AND distance < 9 THEN
                choixCLING = choixCLING + 1
                IF choixCLING > 3 THEN choixCLING = 1
				IF musiqueLOOP = 0 THEN 
					IF choixCLING = 1 THEN SNDZEROPLAY(1, strptr(sfx_cling1), (strptr(sfx_cling1_end)-strptr(sfx_cling1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 2 THEN SNDZEROPLAY(1, strptr(sfx_cling2), (strptr(sfx_cling2_end)-strptr(sfx_cling2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					IF choixCLING = 3 THEN SNDZEROPLAY(1, strptr(sfx_cling3), (strptr(sfx_cling3_end)-strptr(sfx_cling3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
					'IF choixCLING = 4 THEN SNDZEROPLAY(1, strptr(sfx_cling4), (strptr(sfx_cling4_end)-strptr(sfx_cling4)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				END IF
            END IF
            xFB = xB: xAttB = xB + 7: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN
            '_SNDPLAY epee
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_epee), (strptr(sfx_epee_end)-strptr(sfx_epee)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            songrogne = songrogne + 1
            IF songrogne > 6 THEN songrogne = 0
            IF songrogne = 3 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne1), (strptr(sfx_grogne1_end)-strptr(sfx_grogne1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF songrogne = 6 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_grogne2), (strptr(sfx_grogne2_end)-strptr(sfx_grogne2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            spriteB = 35: yAttB = yFB: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 34: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 614 THEN 'retourne
        xAttB = xB + 4: xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yAttB = 14:
        spriteB = 37
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN joueurB = 94: Boccupe = 0: sens = 9: spriteA = 0: spriteB = 0: couleurok = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 15 THEN spriteB = 39: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN spriteB = 38: GOTOU = 2
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 914 THEN 'retourneR
        xAttB = xB: xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        yAttB = 14:
        spriteB = 37
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN joueurB = 64: Boccupe = 0: sens = 6: spriteA = 0: spriteB = 0: couleurok = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 15 THEN spriteB = 39: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN spriteB = 38: GOTOU = 2
        IF GOTOU = 0 THEN GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 621 THEN 'vainqueur
        spriteB = 40
        decapiteB = 1
        sangB = 0
		spritereculeB = 0
        xAttB = xB + 4: yAttB = 14: yGB = 20
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        'psgvol 0,0
        IF GOTOU = 0 AND temps > reftempsB + 100 THEN spriteB = 40: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 85 THEN spriteB = 41: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 36 THEN spriteB = 42: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 18 THEN spriteB = 41: GOTOU = 2
        GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 921 THEN 'vainqueurR
        spriteB = 40
        decapiteB = 1
        sangB = 0
		spritereculeB = 0
        xAttB = xB: yAttB = 14: yGB = 20
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        'psgvol 0,0
        IF GOTOU = 0 AND temps > reftempsB + 100 THEN spriteB = 40: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 85 THEN spriteB = 41: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 36 THEN spriteB = 42: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 18 THEN spriteB = 41: GOTOU = 2
        GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 62100 THEN 'vainqueurKO
        decapiteB = 1
        sangB = 0
		spritereculeB = 0
        xAttB = xB + 4: yGB = 20: 'yAttB = 14:
        xFB = xB: xTB = xB: xMB = xB: xGB = xB

        IF GOTOU = 0 AND temps > reftemps + 230 THEN
            gnome = 1: reftemps = temps
            xGNOME = 3
            xSPRt = 270
            GOTOU = 31
        END IF

        IF GOTOU = 0 AND temps > reftempsB + 205 THEN spriteB = 40: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 195 THEN spriteB = 41: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 140 THEN spriteB = 42: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 123 THEN spriteB = 41: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 105 THEN spriteB = 40: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 100 THEN spriteB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 75 THEN spriteB = 30: spriteA = 50: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 71 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 70 THEN spriteB = 31: spriteA = 49: xA = xA - 2: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 55 THEN spriteB = 30: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 40 THEN spriteB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 36 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 35 THEN
            distance = xB - xA
            IF GOTOU = 0 AND distance < 5 THEN spriteB = 6: xB = xB + 1
            IF GOTOU = 0 AND distance > 5 THEN spriteB = 6: xB = xB - 1
            GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN spriteB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 23 THEN spriteB = 39: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 15 THEN spriteB = 38: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 8 THEN spriteB = 37
        GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 9210 THEN ' vainqueurKOR
        decapiteB = 1
        sangB = 0
		spritereculeB = 0
        xAttB = xB: yGB = 20: ' yAttB = 14
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4

        IF GOTOU = 0 AND temps > reftemps + 230 THEN
            gnome = 1: reftemps = temps
            xGNOME = 3
            xSPRt = 270
            GOTOU = 31
        END IF

        IF GOTOU = 0 AND temps > reftempsB + 205 THEN spriteB = 40: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 195 THEN spriteB = 41: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 140 THEN spriteB = 42: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 123 THEN spriteB = 41: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 105 THEN spriteB = 40: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 100 THEN spriteB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 75 THEN spriteB = 30: spriteA = 50: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 71 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 70 THEN spriteB = 31: spriteA = 49: xA = xA + 2: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 55 THEN spriteB = 30: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 40 THEN spriteB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 36 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 35 THEN
            distance = xA - xB
            IF GOTOU = 0 AND distance < 5 THEN spriteB = 6: xB = xB - 1
            IF GOTOU = 0 AND distance > 5 THEN spriteB = 6: xB = xB + 1
            GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 30 THEN spriteB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 23 THEN spriteB = 39: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 15 THEN spriteB = 38: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 8 THEN spriteB = 37
        GOTOU = 2
    END IF


    '                               ******degats B ******
    IF GOTOU = 0 AND joueurB = 620 THEN 'touche
        'psgvol 2,0
        attenteB = 0
        xAttB = xB + 4
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        yFB = 15: yTB = 16: yMB = 18: yGB = 20
        IF GOTOU = 0 AND joueurA = 611 THEN joueurB = 619: GOTOU = 24

        IF GOTOU = 0 AND serpentB = 0 THEN serpentB = 1: refserpentB = temps

        IF GOTOU = 0 AND joueurA = 61400 AND decapiteB = 1 THEN	
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mortdecap), (strptr(sfx_mortdecap_end)-strptr(sfx_mortdecap)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            joueurB = 65: Boccupe = 1: reftempsB = temps
            xSPRt = xB + 3: scoreA = scoreA + 250
            sangB = 0: serpentB = 0: GOTOU = 33
        END IF

        IF GOTOU = 0 THEN vieB = vieB - 1

        IF GOTOU = 0 AND vieB <= 0 THEN
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			sangB = 1: serpentB = 0
            joueurB = 610: Boccupe = 1: reftempsB = temps: GOTOU = 33
        END IF
        IF GOTOU = 0 THEN
            joueurB = 6201: Boccupe = 1: reftempsB = temps: decapiteB = 1
            GOTOU = 2
        END IF
    END IF

    IF GOTOU = 0 AND joueurB = 6201 THEN 'touche1
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN
            spriteB = 0: sangB = 0: Boccupe = 0
            joueurB = 64: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN xB = xB + 1: sangB = 0: spriteB = 43: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 7 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 6 THEN xB = xB + 2: spriteB = 44: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 3 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN
            xB = xB + 1: spriteB = 43
            choixTOUCHE = choixTOUCHE + 1
            IF choixTOUCHE > 3 THEN choixTOUCHE = 1
			IF musiqueLOOP = 0 THEN 
				IF choixTOUCHE = 1 THEN SNDZEROPLAY(1, strptr(sfx_touche1), (strptr(sfx_touche1_end)-strptr(sfx_touche1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				IF choixTOUCHE = 2 THEN SNDZEROPLAY(1, strptr(sfx_touche2), (strptr(sfx_touche2_end)-strptr(sfx_touche2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				IF choixTOUCHE = 3 THEN SNDZEROPLAY(1, strptr(sfx_touche3), (strptr(sfx_touche3_end)-strptr(sfx_touche3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            END IF
			GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 43: sangB = 1: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 920 THEN 'toucheR
        attenteB = 0
        xAttB = xB
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        yFB = 15: yTB = 16: yMB = 18: yGB = 20
        IF GOTOU = 0 AND joueurA = 911 THEN joueurB = 919: GOTOU = 24

        IF GOTOU = 0 AND serpentB = 0 THEN serpentB = 1: refserpentB = temps

        IF GOTOU = 0 AND joueurA = 9140 AND decapiteB = 1 THEN
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mortdecap), (strptr(sfx_mortdecap_end)-strptr(sfx_mortdecap)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            joueurB = 95: Boccupe = 1: reftempsB = temps
            xSPRt = xB + 3: scoreA = scoreA + 250
            sangB = 0: serpentB = 0: GOTOU = 33
        END IF

        IF GOTOU = 0 THEN vieB = vieB - 1

        IF GOTOU = 0 AND vieB <= 0 THEN
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			sangB = 1: serpentB = 0
            joueurB = 910: Boccupe = 1: reftempsB = temps: GOTOU = 33
        END IF
        IF GOTOU = 0 THEN
            joueurB = 9201: Boccupe = 1: reftempsB = temps: decapiteB = 1
            GOTOU = 2
        END IF
    END IF

    IF GOTOU = 0 AND joueurB = 9201 THEN 'touche1R
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN
            spriteB = 0: sangB = 0: Boccupe = 0
            joueurB = 94: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN xB = xB - 1: sangB = 0: spriteB = 43: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 7 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 6 THEN xB = xB - 2: spriteB = 44: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 3 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN
            xB = xB - 1: spriteB = 43
            choixTOUCHE = choixTOUCHE + 1
            IF choixTOUCHE > 3 THEN choixTOUCHE = 1
			IF musiqueLOOP = 0 THEN 
				IF choixTOUCHE = 1 THEN SNDZEROPLAY(1, strptr(sfx_touche1), (strptr(sfx_touche1_end)-strptr(sfx_touche1)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				IF choixTOUCHE = 2 THEN SNDZEROPLAY(1, strptr(sfx_touche2), (strptr(sfx_touche2_end)-strptr(sfx_touche2)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				IF choixTOUCHE = 3 THEN SNDZEROPLAY(1, strptr(sfx_touche3), (strptr(sfx_touche3_end)-strptr(sfx_touche3)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			END IF
            GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 43: sangB = 1: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 619 THEN 'tombe
        'psgvol 2,0
        attenteB = 0
        xAttB = xB + 4
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4

        sangB = 1
        IF serpentB = 0 THEN serpentB = 1: refserpentB = temps
        vieB = vieB - 1: scoreA = scoreA + 100

        IF GOTOU = 0 AND joueurA = 615 THEN vieB = vieB + 1: sangB = 0: serpentB = 0: scoreA = scoreA - 100
        IF GOTOU = 0 AND vieB <= 0 THEN
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			sangB = 1: serpentB = 0
            joueurB = 610: Boccupe = 1: reftempsB = temps
            IF GOTOU = 0 AND joueurA = 617 OR joueurA = 611 THEN sangB = 0
            GOTOU = 33
        END IF

        IF GOTOU = 0 AND joueurA = 617 OR joueurA = 611 THEN
            scoreA = scoreA + 150: sangB = 0
        END IF

        IF GOTOU = 0 THEN joueurB = 6191: Boccupe = 1: reftempsB = temps: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 6191 THEN 'tombe1
        attenteB = 0
        xAttB = xB + 4
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        IF GOTOU = 0 AND temps > reftempsB + 26 THEN
            spriteB = 0: xB = xB + 1: joueurB = 64: Boccupe = 0: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 18 THEN spriteB = 47: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN sangB = 0: xB = xB + 2: spriteB = 46: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 3 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN
            xB = xB + 2
            '_SNDPLAY tombe:
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tombe), (strptr(sfx_tombe_end)-strptr(sfx_tombe)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF joueurA = 611 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_pied), (strptr(sfx_pied_end)-strptr(sfx_pied)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF joueurA = 617 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_coupdeboule), (strptr(sfx_coupdeboule_end)-strptr(sfx_coupdeboule)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 45: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 919 THEN 'tombeR
        'psgvol 2,0
        xAttB = xB
        attenteB = 0
        xFB = xB: xTB = xB: xMB = xB: xGB = xB

        sangB = 1
        IF serpentB = 0 THEN serpentB = 1: refserpentB = temps
        vieB = vieB - 1: scoreA = scoreA + 100

        IF GOTOU = 0 AND joueurA = 915 THEN vieB = vieB + 1: sangB = 0: serpentB = 0: scoreA = scoreA - 100
        IF GOTOU = 0 AND vieB <= 0 THEN
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			sangB = 1: serpentB = 0
            joueurB = 910: Boccupe = 1: reftempsB = temps
            IF GOTOU = 0 AND joueurA = 917 OR joueurA = 911 THEN sangB = 0
            GOTOU = 33
        END IF

        IF GOTOU = 0 AND joueurA = 917 OR joueurA = 911 THEN scoreA = scoreA + 150: sangB = 0

        IF GOTOU = 0 THEN joueurB = 9191: Boccupe = 1: reftempsB = temps: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 9191 THEN 'tombe1R
        xAttB = xB
        attenteB = 0
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        IF GOTOU = 0 AND temps > reftempsB + 26 THEN
            spriteB = 0: xB = xB - 1: joueurB = 94: Boccupe = 0: GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps > reftempsB + 18 THEN spriteB = 47: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN sangB = 0: xB = xB - 2: spriteB = 46: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 3 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN
            xB = xB - 2
            '_SNDPLAY tombe
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tombe), (strptr(sfx_tombe_end)-strptr(sfx_tombe)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF joueurA = 911 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_pied), (strptr(sfx_pied_end)-strptr(sfx_pied)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            IF joueurA = 917 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_coupdeboule), (strptr(sfx_coupdeboule_end)-strptr(sfx_coupdeboule)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 45: GOTOU = 2
    END IF


    '                               bruit des epees  et decapitations loupees
    IF GOTOU = 0 AND sens = 6 THEN

        IF GOTOU = 0 AND joueurB = 2000 THEN
            IF GOTOU = 0 AND joueurA = 61400 AND decapiteB = 0 THEN joueurB = 620: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 AND joueurA = 68 THEN joueurB = 620: Boccupe = 1: reftempsB = temps: GOTOU = 24

            IF GOTOU = 0 THEN joueurB = 612: GOTOU = 2
        END IF

        IF GOTOU = 0 AND joueurB = 20002 THEN

            joueurB = 613: GOTOU = 2
        END IF

    END IF

    IF GOTOU = 0 AND sens = 9 THEN

        IF GOTOU = 0 AND joueurB = 2000 THEN

            IF GOTOU = 0 AND joueurA = 9140 AND decapiteB = 0 THEN joueurB = 920: Boccupe = 1: reftempsB = temps: GOTOU = 24
            IF GOTOU = 0 AND joueurA = 98 THEN joueurB = 920: Boccupe = 1: reftempsB = temps: GOTOU = 24

            IF GOTOU = 0 THEN joueurB = 912: GOTOU = 2
        END IF

        IF GOTOU = 0 AND joueurB = 20002 THEN

            joueurB = 913: GOTOU = 2
        END IF

    END IF

    '                                   *************************************
    '                                   **********gestion de la mort*********
    '                                   *************************************
    'mortB:
    IF GOTOU = 33 THEN GOTOU = 0

    IF GOTOU = 0 AND joueurB = 610 THEN 'mort
        xFB = xB: xTB = xB: xMB = xB: xGB = xB
        IF GOTOU = 0 AND temps > reftempsB + 16 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 15 THEN sangB = 0: spriteB = 48: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 14 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 13 THEN 
			GOTOU = 2 '_SNDPLAY mortKO: 
			'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF			
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN spriteB = 9: GOTOU = 2
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 9: joueurA = 62100: Aoccupe = 1: reftemps = temps: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 910 THEN 'mortR
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4
        IF GOTOU = 0 AND temps > reftempsB + 16 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 15 THEN sangB = 0: spriteB = 48: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 14 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 13 THEN 
			GOTOU = 2 '_SNDPLAY mortKO:
			'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
		END IF			
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN spriteB = 9: GOTOU = 2
        IF GOTOU = 0 AND temps >= reftempsB THEN spriteB = 9: joueurA = 9210: Aoccupe = 1: reftemps = temps: GOTOU = 2
    END IF

    IF GOTOU = 0 AND joueurB = 65 THEN 'mortdecap
        IF GOTOU = 0 AND temps > reftempsB + 80 THEN spriteB = 54: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 70 THEN spriteB = 53: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 55 THEN sangdecapB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 50 THEN sangdecapB = 6: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 45 THEN sangdecapB = 5: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 40 THEN sangdecapB = 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN spriteB = 52: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN sangdecapB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 15 THEN sangdecapB = 3: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN sangdecapB = 2: GOTOU = 2
		IF GOTOU = 0 AND temps > reftempsB + 7 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 6 THEN 
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			GOTOU = 2
		END IF
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN sangdecapB = 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN GOTOU = 2
        IF GOTOU = 0 AND temps >= reftempsB THEN
            spriteB = 51: joueurA = 621: Aoccupe = 1: reftemps = temps: GOTOU = 2
			'SNDPLAY mortdecap
			'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mortdecap), (strptr(sfx_mortdecap_end)-strptr(sfx_mortdecap)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
        END IF
    END IF
    IF GOTOU = 0 AND joueurB = 95 THEN 'mortdecapR
        IF GOTOU = 0 AND temps > reftempsB + 80 THEN spriteB = 54: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 70 THEN spriteB = 53: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 55 THEN sangdecapB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 50 THEN sangdecapB = 6: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 45 THEN sangdecapB = 5: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 40 THEN sangdecapB = 4: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 25 THEN spriteB = 52: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 20 THEN sangdecapB = 0: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 15 THEN sangdecapB = 3: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 10 THEN sangdecapB = 2: GOTOU = 2
		IF GOTOU = 0 AND temps > reftempsB + 7 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 6 THEN 
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mort), (strptr(sfx_mort_end)-strptr(sfx_mort)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
			GOTOU = 2
		END IF
        IF GOTOU = 0 AND temps > reftempsB + 2 THEN sangdecapB = 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 1 THEN GOTOU = 2
        IF GOTOU = 0 AND temps >= reftempsB THEN
            spriteB = 51: joueurA = 921: Aoccupe = 1: reftemps = temps: GOTOU = 2
			': _SNDPLAY mortdecap
			'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_mortdecap), (strptr(sfx_mortdecap_end)-strptr(sfx_mortdecap)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
        END IF
    END IF

    '                   ***************************************
    '                   ***********   SORCIER    **************
    '                   ***************************************

    IF GOTOU = 0 AND joueurB = 666 THEN

        gnome = 0
        xFB = xB + 4: xTB = xB + 4: xMB = xB + 4: xGB = xB + 4

        IF GOTOU = 0 AND temps > reftempsB + 271 THEN spriteB = 55: reftempsB = temps: GOTOU = 2


        IF GOTOU = 0 AND temps > reftempsB + 270 THEN xAttB = 3: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 260 THEN xAttB = 27: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 250 THEN xAttB = 24: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 240 THEN xAttB = 21: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 230 THEN xAttB = 18: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 220 THEN xAttB = 15: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 210 THEN xAttB = 12: spriteB = 55: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 200 THEN xAttB = 9: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 191 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 190 THEN
            spriteB = 56: yAttB = 16
            '_SNDPLAY feu
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_feu), (strptr(sfx_feu_end)-strptr(sfx_feu)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            GOTOU = 2
        END IF

        IF GOTOU = 0 AND temps > reftempsB + 140 THEN xAttB = 1: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 130 THEN xAttB = 27: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 120 THEN xAttB = 24: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 110 THEN xAttB = 21: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 100 THEN xAttB = 18: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 90 THEN xAttB = 15: yAttB = 20: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 80 THEN xAttB = 12: spriteB = 55: yAttB = 18: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 70 THEN xAttB = 9: GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 61 THEN GOTOU = 2
        IF GOTOU = 0 AND temps > reftempsB + 60 THEN
            spriteB = 56
            '_SNDPLAY feu
			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_feu), (strptr(sfx_feu_end)-strptr(sfx_feu)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
            GOTOU = 2
        END IF
        IF GOTOU = 0 AND temps >= reftempsB THEN
            spriteB = 55
            xAttB = xB: yAttB = 16: yGB = 20
            sangB = 0
        END IF
    END IF


    '                   ***************************************
    '                   ***********   COLISION   **************
    '                   ***************************************
    'colision:
    IF GOTOU = 2 THEN GOTOU = 0

    IF GOTOU = 0 AND sens = 9 THEN GOTOU = 3

    IF GOTOU = 0 AND joueurA = 616 AND joueurB = 615 THEN GOTOU = 28
    IF GOTOU = 0 AND joueurB = 616 AND joueurA = 615 THEN GOTOU = 28

    '                               pour empecher que A entre dans B


    IF GOTOU = 0 AND levier1 = 6 OR joueurA = 615 OR joueurA = 61400 THEN
        distance = xB - xA
        IF GOTOU = 0 AND distance < 4 THEN xA = xA - 1:
    END IF


    '                                pour empecher que B entre dans A

    IF GOTOU = 0 AND levier2 = 4 OR joueurB = 615 OR joueurB = 61400 THEN
        distance = xB - xA
        IF GOTOU = 0 AND distance < 4 THEN xB = xB + 1
    END IF

    '                               garder la distance debout
    IF GOTOU = 0 AND joueurB = 64 AND joueurA = 0 THEN
        distance = xB - xA
        IF GOTOU = 0 AND distance < 4 THEN xA = xA - 1: xB = xB + 1
    END IF


    '                               sortie du cadre
    'sortiecadre:
    IF GOTOU = 28 THEN GOTOU = 0

    IF GOTOU = 0 AND entree = 1 THEN
        IF xA < 0 THEN xA = 0
        IF xB < 0 THEN xB = 0
        IF xA > 40 THEN xA = 40
        IF xB > 40 THEN xB = 40
        GOTOU = 30
    END IF

    IF GOTOU = 0 THEN
        IF sortieA = 1 OR sortieB = 1 THEN
            IF xA < 0 THEN xA = 0
            IF xB > 40 THEN xB = 40
            GOTOU = 30
        END IF
    END IF

    IF GOTOU = 0 AND entree = 0 THEN
        IF xA < 5 THEN xA = 5
        IF xA > 32 THEN xA = 32
        IF xB < 5 THEN xB = 5
        IF xB > 32 THEN xB = 32
    END IF


    IF GOTOU = 0 THEN GOTOU = 30

    '                   ***************************************
    '                   ***********   COLISION INVERSE ********
    '                   ***************************************

    IF GOTOU = 0 AND sens = 6 THEN GOTOU = 31

    'colisionR:
    IF GOTOU = 3 THEN GOTOU = 0

    IF GOTOU = 0 AND joueurA = 916 AND joueurB = 915 THEN GOTOU = 27
    IF GOTOU = 0 AND joueurB = 916 AND joueurA = 915 THEN GOTOU = 27

    '                               pour empecher que A entre dans B (inverse)

    IF GOTOU = 0 THEN
        IF levier1 = 4 OR joueurA = 915 OR joueurA = 9140 THEN
            distance = xA - xB
            IF distance < 4 THEN xA = xA + 1
        END IF
    END IF


    '                                pour empecher que B entre dans A (inverse)

    IF GOTOU = 0 THEN
        IF levier2 = 6 OR joueurB = 915 OR joueurB = 9140 THEN
            distance = xA - xB
            IF distance < 4 THEN xB = xB - 1
        END IF
    END IF

    '                               garder la distance debout
    IF GOTOU = 0 AND joueurB = 94 AND joueurA = 94 THEN
        distance = xA - xB
        IF distance < 4 THEN xA = xA + 1: xB = xB - 1
    END IF


    'sortiecadreR:
    IF GOTOU = 27 THEN GOTOU = 0

    IF GOTOU = 0 THEN
        IF sortieA = 1 OR sortieB = 1 OR entreesorcier = 1 THEN
            IF xB < 0 THEN xB = 0
            IF xA > 40 THEN xA = 40
            GOTOU = 30
        END IF
    END IF

    IF GOTOU = 0 THEN
        IF xA < 5 THEN xA = 5
        IF xA > 31 THEN xA = 32
        IF xB < 5 THEN xB = 5
        IF xB > 32 THEN xB = 32
    END IF


    '                       ****************************************
    '                       ********* les tetes volantes ! *********
    '                       ****************************************
    'tetesvolantes:
    IF GOTOU = 30 THEN GOTOU = 0

    IF GOTOU = 0 THEN
        IF sortieA = 1 OR sortieB = 1 THEN GOTOU = 31
    END IF

    IF GOTOU = 0 THEN

        IF xA > 19 AND xB > 20 THEN GOTOU = 29

        IF GOTOU = 0 THEN
            IF joueurA = 65 OR joueurA = 95 THEN


                IF GOTOU = 0 AND temps > reftemps + 125 THEN
                    gnome = 1: reftemps = temps
                    xGNOME = 3
                    GOTOU = 12
                END IF

                IF GOTOU = 0 AND temps > reftemps + 56 THEN ySPRt = 164: xSPRt = xA + 16: numerotete = 3: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 52 THEN ySPRt = 157: xSPRt = xA + 15: numerotete = 2: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 48 THEN ySPRt = 159: xSPRt = xA + 14: numerotete = 1: GOTOU = 31

                IF GOTOU = 0 AND temps > reftemps + 45 THEN ySPRt = 157: xSPRt = xA + 13: numerotete = 6: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 44 THEN
                    'IF xSPRt < 273 THEN
						'_SNDPLAY tete
						'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tete), (strptr(sfx_tete_end)-strptr(sfx_tete)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)					
					'END IF 
                    ySPRt = 157: xSPRt = xA + 13: numerotete = 6: GOTOU = 31
                END IF

                IF GOTOU = 0 AND temps > reftemps + 40 THEN ySPRt = 159: xSPRt = xA + 12: numerotete = 5: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 36 THEN ySPRt = 159: xSPRt = xA + 11: numerotete = 4: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 32 THEN ySPRt = 159: xSPRt = xA + 10: numerotete = 3: GOTOU = 31

                IF GOTOU = 0 AND temps > reftemps + 29 THEN ySPRt = 159: xSPRt = xA + 9: numerotete = 2: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 28 THEN
                    'IF xSPRt < 273 THEN
						'_SNDPLAY tete
						'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tete), (strptr(sfx_tete_end)-strptr(sfx_tete)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)					
					'END IF 
                    ySPRt = 159: xSPRt = xA + 9: numerotete = 2: GOTOU = 31
                END IF

                IF GOTOU = 0 AND temps > reftemps + 24 THEN ySPRt = 139: xSPRt = xA + 8: numerotete = 1: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 20 THEN ySPRt = 125: xSPRt = xA + 7: numerotete = 6: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 16 THEN ySPRt = 125: xSPRt = xA + 6: numerotete = 5: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 12 THEN ySPRt = 118: xSPRt = xA + 5: numerotete = 4: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 8 THEN ySPRt = 111: xSPRt = xA + 4: numerotete = 3: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 4 THEN ySPRt = 111: xSPRt = xA + 3: numerotete = 2: GOTOU = 31
                IF GOTOU = 0 AND temps >= reftemps THEN ySPRt = 111: xSPRt = xA + 2: numerotete = 1: GOTOU = 31

            END IF
        END IF


        IF GOTOU = 0 THEN
            IF joueurB = 65 OR joueurB = 95 THEN

                IF GOTOU = 0 AND temps > reftemps + 125 THEN
                    gnome = 1: reftemps = temps
                    xGNOME = 3
                    GOTOU = 12
                END IF

                IF GOTOU = 0 AND temps > reftemps + 56 THEN ySPRt = 164: xSPRt = xB + 16: numerotete = 3: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 52 THEN ySPRt = 157: xSPRt = xB + 15: numerotete = 2: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 48 THEN ySPRt = 159: xSPRt = xB + 14: numerotete = 1: GOTOU = 31

                IF GOTOU = 0 AND temps > reftemps + 45 THEN ySPRt = 157: xSPRt = xB + 13: numerotete = 6: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 44 THEN
                    'IF xSPRt < 273 THEN
						'_SNDPLAY tete
						'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tete), (strptr(sfx_tete_end)-strptr(sfx_tete)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)					
					'END IF 
                    ySPRt = 157: xSPRt = xB + 13: numerotete = 6: GOTOU = 31
                END IF

                IF GOTOU = 0 AND temps > reftemps + 40 THEN ySPRt = 159: xSPRt = xB + 12: numerotete = 5: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 36 THEN ySPRt = 159: xSPRt = xB + 11: numerotete = 4: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 32 THEN ySPRt = 159: xSPRt = xB + 10: numerotete = 3: GOTOU = 31

                IF GOTOU = 0 AND temps > reftemps + 29 THEN ySPRt = 159: xSPRt = xB + 9: numerotete = 2: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 28 THEN
                    'IF xSPRt < 273 THEN
						'_SNDPLAY tete
						'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tete), (strptr(sfx_tete_end)-strptr(sfx_tete)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)					
					'END IF 
                    ySPRt = 159: xSPRt = xB + 9: numerotete = 2: GOTOU = 31
                END IF

                IF GOTOU = 0 AND temps > reftemps + 24 THEN ySPRt = 139: xSPRt = xB + 8: numerotete = 1: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 20 THEN ySPRt = 125: xSPRt = xB + 7: numerotete = 6: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 16 THEN ySPRt = 125: xSPRt = xB + 6: numerotete = 5: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 12 THEN ySPRt = 118: xSPRt = xB + 5: numerotete = 4: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 8 THEN ySPRt = 111: xSPRt = xB + 4: numerotete = 3: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 4 THEN ySPRt = 111: xSPRt = xB + 3: numerotete = 2: GOTOU = 31
                IF GOTOU = 0 AND temps >= reftemps THEN ySPRt = 111: xSPRt = xB + 2: numerotete = 1: GOTOU = 31
                GOTOU = 31
            END IF
        END IF

        'teteagauche:
        IF GOTOU = 29 THEN GOTOU = 0

        IF GOTOU = 0 THEN
            IF joueurA = 65 OR joueurA = 95 THEN

                IF GOTOU = 0 AND temps > reftemps + 125 THEN
                    gnome = 1: reftemps = temps
                    xGNOME = 3
                    GOTOU = 12
                END IF

                IF GOTOU = 0 AND temps > reftemps + 56 THEN ySPRt = 164: xSPRt = xA - 12: numerotete = 3: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 52 THEN ySPRt = 157: xSPRt = xA - 11: numerotete = 2: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 48 THEN ySPRt = 159: xSPRt = xA - 10: numerotete = 1: GOTOU = 31

                IF GOTOU = 0 AND temps > reftemps + 45 THEN ySPRt = 157: xSPRt = xA - 9: numerotete = 6: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 44 THEN
                    'IF xSPRt < 273 THEN
						'_SNDPLAY tete
						'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tete), (strptr(sfx_tete_end)-strptr(sfx_tete)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)					
					'END IF 
                    ySPRt = 157: xSPRt = xA - 9: numerotete = 6: GOTOU = 31
                END IF

                IF GOTOU = 0 AND temps > reftemps + 40 THEN ySPRt = 159: xSPRt = xA - 8: numerotete = 5: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 36 THEN ySPRt = 159: xSPRt = xA - 7: numerotete = 4: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 32 THEN ySPRt = 159: xSPRt = xA - 6: numerotete = 3: GOTOU = 31

                IF GOTOU = 0 AND temps > reftemps + 29 THEN ySPRt = 159: xSPRt = xA - 5: numerotete = 2: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 28 THEN
                    'IF xSPRt < 273 THEN
						'_SNDPLAY tete
						'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tete), (strptr(sfx_tete_end)-strptr(sfx_tete)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)					
					'END IF 
                    ySPRt = 159: xSPRt = xA - 5: numerotete = 2: GOTOU = 31
                END IF

                IF GOTOU = 0 AND temps > reftemps + 24 THEN ySPRt = 139: xSPRt = xA - 4: numerotete = 1: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 20 THEN ySPRt = 125: xSPRt = xA - 3: numerotete = 6: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 16 THEN ySPRt = 125: xSPRt = xA - 2: numerotete = 5: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 12 THEN ySPRt = 118: xSPRt = xA - 1: numerotete = 4: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 8 THEN ySPRt = 111: xSPRt = xA: numerotete = 3: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 4 THEN ySPRt = 111: xSPRt = xA + 1: numerotete = 2: GOTOU = 31
                IF GOTOU = 0 AND temps >= reftemps THEN ySPRt = 111: xSPRt = xA + 2: numerotete = 1: GOTOU = 31

            END IF
        END IF

        IF GOTOU = 0 THEN
            IF joueurB = 65 OR joueurB = 95 THEN

                IF GOTOU = 0 AND temps > reftemps + 125 THEN
                    gnome = 1: reftemps = temps
                    xGNOME = 3
                    GOTOU = 12
                END IF

                IF GOTOU = 0 AND temps > reftemps + 56 THEN ySPRt = 164: xSPRt = xB - 14: numerotete = 3: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 52 THEN ySPRt = 157: xSPRt = xB - 13: numerotete = 2: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 48 THEN ySPRt = 159: xSPRt = xB - 12: numerotete = 1: GOTOU = 31

                IF GOTOU = 0 AND temps > reftemps + 45 THEN ySPRt = 157: xSPRt = xB - 11: numerotete = 6: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 44 THEN
                    'IF xSPRt < 273 THEN
						'_SNDPLAY tete
						'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tete), (strptr(sfx_tete_end)-strptr(sfx_tete)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)					
					'END IF 
                    ySPRt = 157: xSPRt = xB - 11: numerotete = 6: GOTOU = 31
                END IF

                IF GOTOU = 0 AND temps > reftemps + 40 THEN ySPRt = 159: xSPRt = xB - 10: numerotete = 5: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 36 THEN ySPRt = 159: xSPRt = xB - 9: numerotete = 4: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 32 THEN ySPRt = 159: xSPRt = xB - 8: numerotete = 3: GOTOU = 31

                IF GOTOU = 0 AND temps > reftemps + 29 THEN ySPRt = 159: xSPRt = xB - 7: numerotete = 2: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 28 THEN
                    'IF xSPRt < 273 THEN
						'_SNDPLAY tete
						'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tete), (strptr(sfx_tete_end)-strptr(sfx_tete)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)					
					'END IF 
                    ySPRt = 159: xSPRt = xB - 7: numerotete = 2: GOTOU = 31
                END IF

                IF GOTOU = 0 AND temps > reftemps + 24 THEN ySPRt = 139: xSPRt = xB - 6: numerotete = 1: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 20 THEN ySPRt = 125: xSPRt = xB - 5: numerotete = 6: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 16 THEN ySPRt = 125: xSPRt = xB - 4: numerotete = 5: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 12 THEN ySPRt = 118: xSPRt = xB - 3: numerotete = 4: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 5 THEN ySPRt = 111: xSPRt = xB - 2: numerotete = 3: GOTOU = 31
                IF GOTOU = 0 AND temps > reftemps + 4 THEN ySPRt = 111: xSPRt = xB - 1: numerotete = 2: GOTOU = 31
                IF GOTOU = 0 AND temps >= reftemps THEN ySPRt = 111: xSPRt = xB: numerotete = 1: GOTOU = 31

            END IF
        END IF


    END IF

    '                   *********************************
    '                   *******  PASSAGE DU GNOME *******
    '                   *********************************

    'gnome:

    IF GOTOU = 12 THEN GOTOU = 0
    IF gnome = 1 THEN

				'IF songnome = 0 THEN
					'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_gameover), (strptr(sfx_gameover_end)-strptr(sfx_gameover)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)		
					'songnome = 1
				'END IF
				
				'IF musiqueLOOP = 0 AND xGNOME > 38 THEN SNDZEROPLAY(1, 0, 0, 0, 0) ' pour aretter les sons
				
				
				numerognome = 4

                IF GOTOU = 0 AND temps > reftemps + 6 THEN numerognome = 1 
                IF GOTOU = 0 AND temps > reftemps + 12 THEN numerognome = 2 
                IF GOTOU = 0 AND temps > reftemps + 18 THEN numerognome = 3 

                IF GOTOU = 0 AND temps > reftemps + 24 THEN reftemps = temps: GOTOU = 31 
                IF GOTOU = 0 AND temps > reftemps + 19 THEN GOTOU = 31 
                IF GOTOU = 0 AND temps > reftemps + 18 THEN xGNOME = xGNOME + 1: GOTOU = 31 
                IF GOTOU = 0 AND temps > reftemps + 7 THEN GOTOU = 31 
                IF GOTOU = 0 AND temps > reftemps + 6 THEN xGNOME = xGNOME + 1: GOTOU = 31



    END IF

    '                   **********************************************
    '                   ************      VSYNC            ***********
    '                   **********************************************
	vsync ' Sync to VBLANK and Update ALL RAPTOR objects

    '                   **********************************************
    '                   ************      AFFICHAGE        ***********
    '                   **********************************************
    'affichage:
    IF GOTOU = 31 THEN GOTOU = 0



    IF transition = 1 THEN
        IF temps > reftemps + 100 THEN transition = 0: transitionfinie = 1
    END IF


    IF GOTOU = 0 AND sorcier = 1 THEN

        'cache des points de vie
        IF afficheFINAL = 0 THEN
            afficheFINAL = 1
			basic_r_size=0 ' taille 
			basic_r_indx=0 ' couleur			
			'cacher message easter
			RLOCATE 124,136: RPRINT "          ": RLOCATE 148,144: RPRINT "    "
			' cacher les points de vie
			RLOCATE 4,8: RPRINT "      ": RLOCATE 4,20: RPRINT "      "		
			RLOCATE 276,8: RPRINT "      ":	RLOCATE 276,20: RPRINT "      "

        END IF


        ' cache Drax
				rlist[NoSPRcache1].x=128<<16
				rlist[NoSPRcache1].y=115<<16

        'cache marianna
        IF marianna = 1 THEN
				rlist[NoSPRcache2].x=199<<16
				rlist[NoSPRcache2].y=115<<16
        END IF


    END IF



    '                               affichage du temps


    IF GOTOU = 0 THEN
        IF joueurA = 65 OR joueurA = 95 OR joueurB = 65 OR joueurB = 95 THEN GOTOU = 13
        IF joueurA = 610 OR joueurA = 910 OR joueurB = 610 OR joueurB = 910 THEN GOTOU = 13
    END IF

    IF GOTOU = 0 AND temps > chrono + 60 THEN
        chronometre = chronometre - 1
        chrono = temps
    END IF

    IF GOTOU = 0 THEN
        IF chronometre < 1 OR chronometre > 60 THEN
            chronometre = 0
            IF partie = 2 THEN
                sortieA = 1: sortieB = 1: tempsfini = 1: Aoccupe = 0: Boccupe = 0
            END IF
        END IF
    END IF

    'affichetemps:
    IF GOTOU = 13 THEN GOTOU = 0

	basic_r_size=0 ' taille 
	basic_r_indx=0 ' couleur

    IF GOTOU = 0 AND partie = 1 THEN RLOCATE 156,71: RPRINT "0" : PRINT "0": RLOCATE 164,71: RPRINTINT IA

    IF GOTOU = 0 AND partie = 2 THEN

        IF chronometre >= 10 THEN RLOCATE 156,71: RPRINTINT chronometre
        IF chronometre < 10 THEN RLOCATE 156,71: RPRINT "0" : PRINT "0": RLOCATE 164,71: RPRINTINT chronometre
		
    END IF


    '                                  affichage du score
	
	IF GOTOU = 0 THEN
	
		basic_r_size=0 ' taille 
		basic_r_indx=0 ' couleur

            ' remise a zero en cas de depassement
		if scoreA < 0 OR niveauscoreA > 99 THEN scoreA = 0: scoreAactuel = 0: niveauscoreA = 0: RLOCATE 100,71: RPRINT "00000"
		if scoreB < 0 OR niveauscoreB > 99 THEN scoreB = 0: scoreBactuel = 0: niveauscoreB = 0: RLOCATE 188,71: RPRINT "00000"


        if scoreAactuel != scoreA THEN

            scoreAactuel = scoreA

            ' affichage du score (inf à 1000)
            if scoreA >=1000 THEN
                scoreA = scoreA - 1000: niveauscoreA = niveauscoreA + 1
            END IF
            RLOCATE 116,71: RPRINTINT scoreA
            if scoreA <= 99 THEN RLOCATE 116,71: RPRINT "00": RLOCATE 124,71: RPRINTINT scoreA

            'affichage des dizaines de milliers
           
            if niveauscoreA <= 9 THEN 
				RLOCATE 100,71: RPRINT "0"
				RLOCATE 108,71: RPRINTINT niveauscoreA
			END IF
			
            if niveauscoreA > 9 THEN RLOCATE 100,71: RPRINTINT niveauscoreA

        END IF

		if scoreBactuel != scoreB THEN

            scoreBactuel = scoreB

            ' affichage du score (inf à 1000)
            if scoreB >=1000 THEN
                    scoreB = scoreB - 1000: niveauscoreB = niveauscoreB + 1
            END IF
            RLOCATE 204,71: RPRINTINT scoreB
            if scoreB <= 99 THEN RLOCATE 204,71: RPRINT "00": RLOCATE 212,71: RPRINTINT scoreB

            'affichage des dizaines de milliers
            
            if niveauscoreB <= 9 THEN 
				RLOCATE 188,71: RPRINT "0"
				RLOCATE 196,71: RPRINTINT niveauscoreB
			END IF
			
            if niveauscoreB > 9 THEN RLOCATE 188,71: RPRINTINT niveauscoreB

        END IF

    '                                  effacement des points de vie

        IF vieactuelleA != vieA THEN

            vieactuelleA = vieA
			IF vieA = 11 THEN RLOCATE 44,20: RPRINT " "
			IF vieA = 10 THEN RLOCATE 36,20: RPRINT " "
			IF vieA = 9 THEN RLOCATE 28,20: RPRINT " "
			IF vieA = 8 THEN RLOCATE 20,20: RPRINT " "
			IF vieA = 7 THEN RLOCATE 12,20: RPRINT " "
			IF vieA = 6 THEN RLOCATE 4,20: RPRINT " "
			IF vieA = 5 THEN RLOCATE 44,8: RPRINT " "
			IF vieA = 4 THEN RLOCATE 36,8: RPRINT " "
			IF vieA = 3 THEN RLOCATE 28,8: RPRINT " "
			IF vieA = 2 THEN RLOCATE 20,8: RPRINT " "
			IF vieA = 1 THEN RLOCATE 12,8: RPRINT " "
			IF vieA = 0 THEN RLOCATE 4,8: RPRINT " "
	
		END IF
    
		IF vieactuelleB != vieB THEN

            vieactuelleB = vieB
			IF vieB = 11 THEN RLOCATE 316,20: RPRINT " "
			IF vieB = 10 THEN RLOCATE 308,20: RPRINT " "
			IF vieB = 9 THEN RLOCATE 300,20: RPRINT " "
			IF vieB = 8 THEN RLOCATE 292,20: RPRINT " "
			IF vieB = 7 THEN RLOCATE 284,20: RPRINT " "
			IF vieB = 6 THEN RLOCATE 276,20: RPRINT " "
			IF vieB = 5 THEN RLOCATE 316,8: RPRINT " "
			IF vieB = 4 THEN RLOCATE 308,8: RPRINT " "
			IF vieB = 3 THEN RLOCATE 300,8: RPRINT " "
			IF vieB = 2 THEN RLOCATE 292,8: RPRINT " "
			IF vieB = 1 THEN RLOCATE 284,8: RPRINT " "
			IF vieB = 0 THEN RLOCATE 276,8: RPRINT " "
		END IF


		IF easter = 1 THEN
			basic_r_size=0 ' taille 
			basic_r_indx=1 ' couleur		
			RLOCATE 124,136: RPRINT "FL VERSION": RLOCATE 148,144: RPRINT "2018"
		END IF
	
	END IF ' gotou


    '                       *********************************************
    '                       ***********   reglage des couleurs **********
    '                       *********************************************
	
	IF GOTOU = 0 and couleurok = 0 THEN
	
		couleurok = 1
	
		IF sens = 6 THEN 
		
			rsetobj(NoSPRspriteA,R_sprite_flip, 1 ) ' 1= normal
			rsetobj(NoSPRspriteAmort,R_sprite_flip, 1 ) 
		
			rsetobj(NoSPRspriteB,R_sprite_flip, -1 ) ' -1= inverse
	
		END IF
	
		IF sens = 9 THEN 
		
			rsetobj(NoSPRspriteA,R_sprite_flip, -1 ) ' 1= inverse
			rsetobj(NoSPRspriteAmort,R_sprite_flip, -1 ) 
			
			rsetobj(NoSPRspriteB,R_sprite_flip, 1 ) ' -1= normal
		
		END IF	
	
	
	END IF
	
	
	
	
	

    '                       ****************************************
    '                       *********** affichage sprite A**********
    '                       ****************************************




    IF GOTOU = 0 THEN

		' choix du sprite
		if spriteA > 57 THEN spriteA = 0
					
 		rsetobj(NoSPRspriteA,R_sprite_gfxbase,(int)strptr(spritesAB)+ (3200 * spriteA ) ) ' choix de la frame dans la planche 2048 = 80*(80*4)/8 
		
        ' sens normal : spriteA à gauche
		IF sens = 6 THEN positionX= ((xA+1)* 8)+3: ' positionY= ((yFA - 2) * 8) 	

				
		' sens inverse : spriteA à droite		
		IF sens = 9 THEN positionX= ((xA-4) * 8)+3 ': positionY= ((yFB - 2) * 8)			

		' pour cacher derriere les arbres
		IF xA <= 1 THEN  positionX = -100
		
		' affichage du sprite 
		rlist[NoSPRspriteA].x= positionX<<16 
		



    END IF
    '                       ****************************************
    '                       *********** affichage sprite B**********
    '                       ****************************************


    IF GOTOU = 0 THEN

		' choix du sprite
		if spriteB > 57 THEN spriteB = 0

		rsetobj(NoSPRspriteB,R_sprite_gfxbase,(int)strptr(spritesAB)+ (3200 * spriteB ) ) ' choix de la frame dans la planche 2048 = 80*(80*4)/8
		
        ' sens normal : spriteB à droite
		IF sens = 6 THEN positionX= ((xB-4) * 8)+3 ': positionY= ((yFB - 2) * 8)
		
				
        ' sens inverse : spriteB à gauche
		IF sens = 9 THEN positionX= ((xB+1)* 8)+3: ' positionY= ((yFA - 2) * 8)
		
		
		' pour cacher derriere les arbres
		IF xB >= 39 THEN  positionX = -100
		
		' affichage du sprite B
		rlist[NoSPRspriteB].x=positionX<<16 ' affichage sprite7 en xB
    

			

    END IF

    '                           ***********************************************
    '                           re-affichage du spriteA en cas de chevauchement



    IF GOTOU = 0 THEN

            rlist[NoSPRspriteAmort].x= -80<<16 ' cacher le sprite
			rlist[NoSPRspriteAmort].y=700<<16
	
        IF joueurA = 610 OR joueurA = 910 OR joueurA = 65 OR joueurA = 95 THEN

			rsetobj(NoSPRspriteAmort,R_sprite_gfxbase,(int)strptr(spritesAB)+ (3200 * spriteA ) ) ' choix de la frame dans la planche 2048 = 80*(80*4)/8
			
			IF joueurA = 610 OR joueurA = 65 THEN positionX= ((xA+1)* 8)+3: ' positionY= ((yFA - 2) * 8)
			IF joueurA = 910 OR joueurA = 95 THEN positionX= ((xA-4)* 8)+3: ' positionY= ((yFA - 2) * 8)

            rlist[NoSPRspriteAmort].x= positionX<<16 ' affichage en xA
			rlist[NoSPRspriteAmort].y=120+16<<16
			
        END IF
    END IF


    '                           *************************************************
    '                           pour cacher les sprites morts derriere les arbres
'    IF GOTOU = 0 THEN

'		IF xB >= 39 THEN
'			IF joueurB = 610 OR joueurB = 65 THEN				
'				'rlist[NoSPRspriteB].y=700<<16
'			END IF
 '       END IF
'		IF xA >= 39 THEN
'			IF joueurA = 910 OR joueurA = 95 THEN
'				'rlist[NoSPRspriteA].y=700<<16
'			END IF
'        END IF	
'END IF

    '                       ****************************************
    '                       ********* affichage du serpent *********
    '                       ****************************************
    'serpent:
    'IF GOTOU = 11 THEN GOTOU = 0

     '                                   tete serpentA

    IF GOTOU = 0 AND serpentA = 1 THEN
		
		rlist[NoSPRserpentG].y=40+15<<16		
		
		numeroserpent = 1
		IF temps > refserpentA + 4 THEN numeroserpent = 2
		IF temps > refserpentA + 8 THEN numeroserpent = 3
		IF temps > refserpentA + 12 THEN numeroserpent = 2
		IF temps > refserpentA + 20 THEN numeroserpent = 1
		IF temps > refserpentA + 24 THEN numeroserpent = 0: serpentA = 0 


		rsetobj(NoSPRserpentG,R_sprite_gfxbase,(int)strptr(SPRserpent)+ (512 * numeroserpent ) ) ' choix de la frame dans la planche 512 = 32*(32*4)/8

		
    END IF




    '                                   selection tete serpentB
    'serpent2:
    'IF GOTOU = 10 THEN GOTOU = 0 
	
    IF GOTOU = 0 AND serpentB = 1 THEN

		rlist[NoSPRserpentD].y=40+15<<16
	
		numeroserpent = 1
		IF temps > refserpentB + 4 THEN numeroserpent = 2
		IF temps > refserpentB + 8 THEN numeroserpent = 3
		IF temps > refserpentB + 12 THEN numeroserpent = 2
		IF temps > refserpentB + 20 THEN numeroserpent = 1
		IF temps > refserpentB + 24 THEN numeroserpent = 0: serpentB = 0  

		
		rsetobj(NoSPRserpentD,R_sprite_gfxbase,(int)strptr(SPRserpent)+ (512 * numeroserpent ) )		
		

    END IF

    '                       ****************************************
    '                       ********* affichage des tetes **********
    '                       ****************************************
    'tete2:
       'IF GOTOU = 17 THEN GOTOU = 0


       IF GOTOU = 0 AND gnome = 0 THEN ' affichage des tetes volantes */
	   
			rlist[NoSPRtetes].x=-64<<16 ' pour cacher les tetes
			rlist[NoSPRtetes].y=700<<16
			rlist[NoSPRombre].x=-64<<16 ' pour cacher l'ombre
			rlist[NoSPRombre].y=700<<16
	   
           IF joueurA = 65 OR joueurA = 95 OR joueurB = 65 OR joueurB = 95 THEN

				
				'couleurtete = 1
				IF joueurA = 65 OR joueurA = 95 THEN rsetobj(NoSPRtetes,R_sprite_CLUT, 6 )
				IF joueurB = 65 OR joueurB = 95 THEN rsetobj(NoSPRtetes,R_sprite_CLUT, 7 )		   
		   
		   

			' choix du sprite tete (volantes)
             IF numerotete = 1 THEN rsetobj(NoSPRtetes,R_sprite_gfxbase,(int)strptr(SPRtetes)+ (128 * 0 ) ) ' choix de la frame dans la planche 128 = 16*(16*4)/8
             IF numerotete = 2 THEN rsetobj(NoSPRtetes,R_sprite_gfxbase,(int)strptr(SPRtetes)+ (128 * 1 ) )
             IF numerotete = 3 THEN rsetobj(NoSPRtetes,R_sprite_gfxbase,(int)strptr(SPRtetes)+ (128 * 2 ) )
             IF numerotete = 4 THEN rsetobj(NoSPRtetes,R_sprite_gfxbase,(int)strptr(SPRtetes)+ (128 * 3 ) )
             IF numerotete = 5 THEN rsetobj(NoSPRtetes,R_sprite_gfxbase,(int)strptr(SPRtetes)+ (128 * 4 ) )
             IF numerotete = 6 THEN rsetobj(NoSPRtetes,R_sprite_gfxbase,(int)strptr(SPRtetes)+ (128 * 5 ) )
			 
			 
              '  affichage des tetes */

                  xSPRt = (xSPRt + 1) * 8 '  laisser en x8 pour le football ,) */

                   positionX = xSPRt : positionY = ySPRt + 24

 					rlist[NoSPRtetes].x=positionX<<16
					rlist[NoSPRtetes].y=positionY+16<<16


                   ' ombre de la tete
                   positionX = xSPRt: positionY = 182
				   rlist[NoSPRombre].x=positionX<<16
				   rlist[NoSPRombre].y=positionY+16<<16

 
				   		   
            END IF


        END IF



       IF GOTOU = 0 AND gnome = 1 THEN ' football avec le gnome */


           IF GOTOU = 0  THEN
               IF joueurA = 610 OR joueurB = 610 OR joueurA = 910 OR joueurB = 910 THEN
			   		rlist[NoSPRtetes].x=-64<<16 ' pour cacher les tetes
					rlist[NoSPRtetes].y=700<<16
					rlist[NoSPRombre].x=-64<<16 ' pour cacher l'ombre
					rlist[NoSPRombre].y=700<<16
					GOTOU = 14
			   END IF
           END IF

           IF GOTOU = 0 AND football = 1 THEN GOTOU = 18

           IF GOTOU = 0 AND xGNOME < 39 AND (xGNOME * 8) > xSPRt - 16 THEN football = 1: reftempsB = temps

           IF GOTOU = 0 THEN GOTOU = 19

          ' gnometapetete  */
           IF GOTOU = 18 THEN GOTOU = 0

           IF GOTOU = 0 AND football = 1 THEN

               IF GOTOU = 0 AND temps > reftempsB + 81 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 80 THEN ySPRt = 153: xSPRt = xSPRt + 16: numerotete = 5: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 77 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 76 THEN ySPRt = 151: xSPRt = xSPRt + 16: numerotete = 6: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 71 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 70 THEN ySPRt = 153: xSPRt = xSPRt + 16: numerotete = 1: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 67 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 66 THEN ySPRt = 157: xSPRt = xSPRt + 16: numerotete = 2: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 61 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 60 THEN
                   'IF xGNOME < 38 AND xSPRt < 312 THEN
							'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tete), (strptr(sfx_tete_end)-strptr(sfx_tete)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
                   'END IF
                  ySPRt = 159: xSPRt = xSPRt + 16: numerotete = 3: GOTOU = 19
              END IF
               IF GOTOU = 0 AND temps > reftempsB + 57 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 56 THEN ySPRt = 157: xSPRt = xSPRt + 16: numerotete = 4: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 51 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 50 THEN ySPRt = 153: xSPRt = xSPRt + 16: numerotete = 5: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 45 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 44 THEN ySPRt = 151: xSPRt = xSPRt + 16: numerotete = 6: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 41 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 40 THEN ySPRt = 153: xSPRt = xSPRt + 16: numerotete = 1: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 37 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 36 THEN ySPRt = 157: xSPRt = xSPRt + 16: numerotete = 2: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 31 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 30 THEN
                   'IF xGNOME < 38 AND xSPRt < 312 THEN
							'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tete), (strptr(sfx_tete_end)-strptr(sfx_tete)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
                   'END IF
                  ySPRt = 159: xSPRt = xSPRt + 16: numerotete = 3: GOTOU = 19
              END IF
               IF GOTOU = 0 AND temps > reftempsB + 27 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 26 THEN ySPRt = 157: xSPRt = xSPRt + 16: numerotete = 4: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 21 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 20 THEN ySPRt = 153: xSPRt = xSPRt + 16: numerotete = 5: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 17 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 16 THEN ySPRt = 151: xSPRt = xSPRt + 16: numerotete = 6: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 11 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 10 THEN ySPRt = 153: xSPRt = xSPRt + 16: numerotete = 1: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 7 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 6 THEN ySPRt = 157: xSPRt = xSPRt + 16: numerotete = 2: GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 2 THEN GOTOU = 19
               IF GOTOU = 0 AND temps > reftempsB + 1 THEN
                   'IF xGNOME < 38 AND xSPRt < 312 THEN
							'IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_tete), (strptr(sfx_tete_end)-strptr(sfx_tete)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
                   'END IF
                  GOTOU = 19
              END IF

          END IF

         ' afficheteombre  */
           IF GOTOU = 19 THEN GOTOU = 0

           IF GOTOU = 0 THEN

			' choix du sprite tete (football)
             IF numerotete = 1 THEN rsetobj(NoSPRtetes,R_sprite_gfxbase,(int)strptr(SPRtetes)+ (128 * 0 ) ) ' choix de la frame dans la planche 128 = 16*(16*4)/8
             IF numerotete = 2 THEN rsetobj(NoSPRtetes,R_sprite_gfxbase,(int)strptr(SPRtetes)+ (128 * 1 ) )
             IF numerotete = 3 THEN rsetobj(NoSPRtetes,R_sprite_gfxbase,(int)strptr(SPRtetes)+ (128 * 2 ) )
             IF numerotete = 4 THEN rsetobj(NoSPRtetes,R_sprite_gfxbase,(int)strptr(SPRtetes)+ (128 * 3 ) )
             IF numerotete = 5 THEN rsetobj(NoSPRtetes,R_sprite_gfxbase,(int)strptr(SPRtetes)+ (128 * 4 ) )
             IF numerotete = 6 THEN rsetobj(NoSPRtetes,R_sprite_gfxbase,(int)strptr(SPRtetes)+ (128 * 5 ) )


          '  affichage du football */

                 positionX = xSPRt: positionY = ySPRt+24

				rlist[NoSPRtetes].x=positionX<<16
				rlist[NoSPRtetes].y=positionY+16<<16


                ' ombre de la tete */
                positionX = xSPRt: positionY = 182
				rlist[NoSPRombre].x=positionX<<16
				rlist[NoSPRombre].y=positionY+16<<16


                END IF

          GOTOU = 14

      END IF ' gnome*/



    '                       ****************************************
    '                       ********* affichage du gnome  **********
    '                       ****************************************
    'gnome2:
    IF GOTOU = 14 THEN GOTOU = 0

	
	IF gnome = 0 THEN rlist[NoSPRgnome].y=700<<16	'pour cacher le gnome
	
    IF GOTOU = 0 AND gnome = 1 THEN 
		
		
		' choix du sprite
		rsetobj(NoSPRgnome,R_sprite_gfxbase,(int)strptr(SPRgnome)+ 512*(numerognome-1) ) ' choix de la frame dans la planche 512 = 32*(32*4)/8

		
        xGNOME2 = ((xGNOME - 2) * 8)+3
		rlist[NoSPRgnome].x=xGNOME2<<16 ' affichage du gnome (sprite8)
		rlist[NoSPRgnome].y=168+16<<16	'gnome
		
		' cacher le gnome
		IF xGNOME > 40 THEN rlist[NoSPRgnome].y=700<<16
		
 

        IF xGNOME > 39 THEN

            IF joueurB = 65 OR joueurB = 95 THEN
                IF partie = 2 THEN bonusA = 1
                IF partie = 1 THEN
                    IF xB >= 39 THEN sortieA = 1: Aoccupe = 0
                END IF
            END IF
            IF joueurB = 610 OR joueurB = 910 THEN
                IF partie = 2 THEN bonusA = 1
                IF partie = 1 THEN
                    IF xB >= 39 THEN sortieA = 1: Aoccupe = 0
                END IF
            END IF

            IF joueurA = 65 OR joueurA = 95 THEN
                IF partie = 2 THEN bonusB = 1
                IF partie = 1 THEN
                    IF xA >= 39 THEN sortieB = 1: Boccupe = 0
                END IF
            END IF
            IF joueurA = 610 OR joueurA = 910 THEN
                IF partie = 2 THEN bonusB = 1
                IF partie = 1 THEN
                    IF xA >= 39 THEN sortieB = 1: Boccupe = 0
                END IF
            END IF
        END IF


        ' cadavre tir‚ par le gnome

        IF joueurA = 65 OR joueurA = 610 THEN
            IF xGNOME > xA + 6 THEN
                'IF gnometire = 1 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_gameover), (strptr(sfx_gameover_end)-strptr(sfx_gameover)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				gnometire = 0
                xA = xA + 1
            END IF
        END IF
        IF joueurA = 95 OR joueurA = 910 THEN
            IF xGNOME > xA + 6 THEN
				'IF gnometire = 1 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_gameover), (strptr(sfx_gameover_end)-strptr(sfx_gameover)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
                gnometire = 0
                xA = xA + 1
            END IF
        END IF

        IF joueurB = 65 OR joueurB = 610 THEN
            IF xGNOME > xB + 6 THEN
                'IF gnometire = 1 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_gameover), (strptr(sfx_gameover_end)-strptr(sfx_gameover)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				gnometire = 0
                xB = xB + 1
            END IF
        END IF
        IF joueurB = 95 OR joueurB = 910 THEN
            IF xGNOME > xB + 6 THEN
                'IF gnometire = 1 AND musiqueLOOP = 0 THEN SNDZEROPLAY(1, strptr(sfx_gameover), (strptr(sfx_gameover_end)-strptr(sfx_gameover)+3) and 0xfffffffc, 46168/7694, Zero_Audio_8bit_muLaw|0)
				gnometire = 0
                xB = xB + 1
            END IF
        END IF

    END IF


    '                        *************************************************************
    '                        ************ affichage du feu et des taches de sang**********
    '                        *************************************************************

     ' boulefeu
      if  GOTOU = 9 THEN GOTOU = 0


        if  GOTOU = 0 THEN 



			rlist[NoSPRfeusang].y=700<<16


		'                       ********* affichage du feu du sorcier ************ */

        if  jeu = 1 AND sorcier = 1 AND xAttB > xB + 4 THEN 



          positionX =  ( xAttB - 1 ) * 8: positionY =  ( yAttB +2 ) * 8 +16

          if  xAttB = 9 OR xAttB = 18 OR xAttB = 27 THEN 
				rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 4 ) ) ' choix de la frame dans la planche 128 = 16*(16*4)/8
				rlist[NoSPRfeusang].x=positionX<<16
				rlist[NoSPRfeusang].y=positionY<<16
          END IF

          if  xAttB = 12 OR xAttB = 21 THEN 
				rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 5 ) )
				rlist[NoSPRfeusang].x=positionX<<16
				rlist[NoSPRfeusang].y=positionY<<16
          END IF

          if  xAttB = 15 OR xAttB = 24 THEN 
				rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 6 ) )
				rlist[NoSPRfeusang].x=positionX<<16
				rlist[NoSPRfeusang].y=positionY<<16
          END IF


      END IF




      /*                     ***********giclees de sang de decapitation ************* */

            if  joueurA = 65 OR joueurA = 95 THEN 
                if  sangdecapA = 1 THEN 
					positionX = ((xA + 2) * 8) + 9: positionY =  (( yFA + 2) * 8 ) -2 
					rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 1 ) )					
               END IF
                if  sangdecapA = 2 THEN 
                   positionX = ((xA + 2) * 8) + 9: positionY =  (( yFA + 2) * 8 ) -2 
 					rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 2 ) )
               END IF
                if  sangdecapA = 3 THEN 
                   positionX = ((xA + 2) * 8) + 9: positionY =  (( yFA + 2) * 8 ) -2 
					rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 3 ) )
               END IF

                if  sangdecapA = 4 THEN 
                   positionX = ((xA + 2) * 8) + 8: positionY = ((yMA + 1) * 8) - 4
					rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 1 ) )
               END IF
                if  sangdecapA = 5 THEN 
                   positionX = ((xA + 2) * 8) + 8: positionY = ((yMA + 1) * 8) - 4
					rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 2 ) )
               END IF
                if  sangdecapA = 6 THEN 
                   positionX = ((xA + 2) * 8) + 8: positionY = ((yMA + 1) * 8) - 4
					rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 3 ) )
               END IF

           END IF


            if  joueurB = 65 OR joueurB = 95 THEN 
                if  sangdecapB = 1 THEN 
                   positionX = ((xB + 2) * 8) + 9: positionY = ((yFB + 2) * 8 ) -2
					rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 1 ) )
               END IF
                if  sangdecapB = 2 THEN 
                   positionX = ((xB + 2) * 8) + 9: positionY = ((yFB + 2) * 8 ) -2
					rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 2 ) )
               END IF
                if  sangdecapB = 3 THEN 
                   positionX = ((xB + 2) * 8) + 9: positionY = ((yFB + 2) * 8 ) -2
					rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 3 ) )
               END IF

                if  sangdecapB = 4 THEN 
                   positionX = ((xB + 2) * 8) + 8: positionY = ((yMB + 1) * 8) - 4
					rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 1 ) )
               END IF
                if  sangdecapB = 5 THEN 
                   positionX = ((xB + 2) * 8) + 8: positionY = ((yMB + 1) * 8) - 4
					rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 2 ) )
               END IF
                if  sangdecapB = 6 THEN 
                   positionX = ((xB + 2) * 8) + 8: positionY = ((yMB + 1) * 8) - 4
					rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang)+ (128 * 3 ) )
               END IF
           END IF

                if  sangdecapA != 0 OR sangdecapB != 0 THEN 
				rlist[NoSPRfeusang].x=positionX<<16
				rlist[NoSPRfeusang].y=positionY+16<<16
               END IF



     /*                      taches de sang au combat */


     if  sangA = 1 THEN 

			rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang) )

            if  joueurA = 6201 THEN 
                positionX = xA + 4: positionY = positionSANG + 2
            END IF

            if  joueurA = 610 THEN 
               positionX = xA + 4: positionY = positionSANG + 2
            END IF

            if  joueurA = 6191 THEN 
               positionX = xA + 4: positionY = positionSANG + 2
            END IF
			
            if  joueurA = 9201 THEN 
                positionX = xA + 3: positionY = positionSANG + 2
            END IF

            if  joueurA = 910 THEN 
               positionX = xA + 3: positionY = positionSANG + 2
            END IF

            if  joueurA = 9191 THEN 
               positionX = xA + 3: positionY = positionSANG + 2
            END IF
			
            positionX = (positionX * 8): positionY = (positionY * 8)

				rlist[NoSPRfeusang].x=positionX<<16
				rlist[NoSPRfeusang].y=positionY+16<<16

     END IF


     if  sangB = 1 THEN 

			rsetobj(NoSPRfeusang,R_sprite_gfxbase,(int)strptr(SPRfeusang) )

            if  joueurB = 6201 THEN 
               positionX = xB + 2: positionY = positionSANG + 2
            END IF

            if  joueurB = 610 THEN 
               positionX = xB + 2: positionY = positionSANG + 2
            END IF

            if  joueurB = 6191 THEN 
               positionX = xB + 2: positionY = positionSANG + 2
            END IF

			if  joueurB = 9201 THEN 
               positionX = xB + 3: positionY = positionSANG + 2
            END IF

            if joueurB = 910 THEN 
               positionX = xB + 3: positionY = positionSANG + 2
            END IF

            if  joueurB = 9191 THEN 
               positionX = xB + 3: positionY = positionSANG + 2
            END IF
			
            positionX = (positionX * 8) : positionY = (positionY * 8)

				rlist[NoSPRfeusang].x=positionX<<16
				rlist[NoSPRfeusang].y=positionY+16<<16

       END IF



     END IF '/* GOTOU */



    '                       ****************************************
    '                       ********* affichage des arbres**********
    '                       ****************************************
    'IF GOTOU = 0 THEN
    'END IF

    '                       ****************************************
    '                       ********* jeu gagne - jeu perdu ********
    '                       ****************************************


    IF GOTOU = 0 THEN

		basic_r_size=0 ' taille 
		basic_r_indx=1 ' couleur	
	
        IF jeu = 2 THEN 
			' message "THANKS.BIG.BOY"
			
			RLOCATE 99,96: RPRINT "Thanks big boy."	
		END IF

        IF jeu = 0 AND joueurA = 6660 THEN RLOCATE 86,96: RPRINT "Your end has come !"


    END IF



    '                        gestion du temps et retour



    IF arret = 1 THEN

        IF temps > 30 THEN


			IF musiqueLOOP = 0 THEN SNDZEROPLAY(1, 0, 0, 0, 0) ' pour aretter les sons
			
			' remise à zero des scores
			scoreA = 0
			scoreAactuel = 0
			niveauscoreA = 0
			scoreB = 0
			scoreBactuel = 0
			niveauscoreB = 0			

		IF jeu = 1 THEN	

				IF GOTOU = 0 AND demo = 1 THEN
					partie = 1: decorS = 2: IA = 0: sorcier = 0: marianna = 0: demo = 0 'solo
					GOTOU = 8
				END IF

				IF GOTOU = 0 AND partie = 1 THEN
					partie = 2: decorS = 3: IA = 0: sorcier = 0: marianna = 0: chronometre = 60 ' vs
					GOTOU = 8
				END IF

				IF GOTOU = 0 AND partie = 2 THEN
					partie = 1: decorS = 1: IA = 4: sorcier = 0: marianna = 0: demo = 1 ' demo
					GOTOU = 8
				END IF

			END IF
		END IF

        IF jeu = 2 OR jeu = 0 THEN		
			cls ' pour effacer les messages		
            partie = 1: decorS = 2: IA = 0: sorcier = 0: marianna = 0
            GOTOU = 8
        END IF


    END IF


' affichages facultatifs
basic_r_size=0 ' taille 
basic_r_indx=1 ' couleur

'RLOCATE 128,4: RPRINT "BETA 0.90"
'RLOCATE 100,0: RPRINT "   ":RPRINTINT choixCLING
'RLOCATE 160,0: RPRINT "   ":RPRINTINT loading



' *** DEBUG *****	
'IF GOTOU = 0 THEN
	'RLOCATE 8,208: RPRINT "      ": RPRINTINT spriteA 
	'RLOCATE 8,208: RPRINT "      ": RPRINTINT xB
'END IF	




' verifier la synchro du son mort et mortdecap et attente
' rectifier bug version atari affichage ia10
' rectifier bug tous reculeR sprite5 atari cpc c64






ZEROPAD()

	
LOOP

