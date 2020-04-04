' simple raptor particle effect demonstration rb+, sh3-rg

DIM x%          :       x=64
DIM y%          :       y=32
DIM x2%         :       x2=0
DIM y2%         :       y2=0
DIM parts%      :       parts=16
DIM trigger%    :       trigger=0
DIM counter%    :       counter=0
DIM pad1%       :       pad1=0
DIM speed%              :   speed=3
DIM curve%              :   curve=10
DIM initial%            :   initial=15
DIM decay%              :   decay=4
DIM life%               :   life=64
DIM sinks%              :   sinks=10

DIM pie!        :       pie=3.1415926535897932384626433832795   'lolol
DIM rads!       :       rads=(pie/180)

DIM i%          :       i=0
DIM sinz![360]
DIM sins%[360]

FOR i=0 to 360
    sinz[i]=(sin(i*rads))*32            ' 64!!111
    sins[i]=(int)INT(sinz[i])
NEXT

DIM particles%[17,6]

particles[0,5]=parts

FOR i=1 TO 8
    particles[i,0]=(i)*64                   ' angle
    particles[i+8,0]=(i-1)*64+32            ' remaining angles
NEXT i

FOR i=1 TO 16
    particles[i,1]=speed                    ' speed
    particles[i,2]=curve                    ' angular speed
    particles[i,3]=initial                  ' initial colour
    particles[i,4]=decay                    ' colour decay (per frame)
    particles[i,5]=life                     ' pixel life (in frames)
NEXT i

DPOKE BG,34523

LOADCLUT(strptr(SHADOWS_clut),14,16)
LOADCLUT(strptr(SHADOWS2_clut),13,16)
LOADCLUT(strptr(LOGO_clut),12,16)
    
DO
    pad1=GETPAD(1)

    counter=counter+16

    IF pad1 BAND PAD_UP AND speed<10 THEN
        speed=speed+1
    ENDIF
    IF pad1 BAND PAD_DOWN AND speed>1 THEN
        speed=speed-1
    ENDIF
    
    IF pad1 BAND PAD_LEFT AND curve>-10 THEN
        curve=curve-1
    ENDIF   
    IF pad1 BAND PAD_RIGHT AND curve<10 THEN
        curve=curve+1
    ENDIF

    IF pad1 BAND PAD_1 AND initial<15 THEN
        initial=initial+1
    ENDIF
    IF pad1 BAND PAD_4 AND initial>1 THEN
        initial=initial-1
    ENDIF

    IF pad1 BAND PAD_3 AND life<240 THEN
        life=life+16
    ENDIF
    IF pad1 BAND PAD_6 AND life>32 THEN
        life=life-16
    ENDIF

    IF pad1 BAND PAD_2 AND sinks<60 THEN
        sinks=sinks+1
    ENDIF
    IF pad1 BAND PAD_5 AND sinks>1 THEN
        sinks=sinks-1
    ENDIF
    
    x2=counter[sins]
    y2=(counter/2)[sins]
    
FOR i=1 TO 16
    particles[i,1]=speed                    ' speed
    particles[i,2]=curve                    ' angular speed
    particles[i,3]=initial                  ' initial colour
    particles[i,4]=decay                    ' colour decay (per frame)
    particles[i,5]=life                     ' pixel life (in frames)
NEXT i

    particles[0,3]=(x+x2)<<16
    particles[0,4]=(y+y2)<<16
    RPARTI(strptr(particles))

    DELAY(sinks)
    
    IF counter=>360 THEN
        counter=0
    ENDIF
    
LOOP
