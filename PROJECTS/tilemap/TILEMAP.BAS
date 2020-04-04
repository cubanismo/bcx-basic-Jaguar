' TILEMAP DEMO
'
' CLS

dim PX as int, PY as int
PX=0
PY=0

dim PAD as int
do
    PAD=GETPAD(1)
    IF PAD band PAD_UP THEN PY=PY-4
    IF PAD band PAD_DOWN THEN PY=PY+4
    IF PAD band PAD_LEFT THEN PX=PX-4
    IF PAD band PAD_RIGHT THEN PX=PX+4
    IF PX<0 THEN PX=0
    IF PX>96 THEN PX=96
    IF PY<0 THEN PY=0
    IF PY>20904 THEN PY=20904
    RSETMAP(PX<<16,PY<<16)
    RUPDALL(0)
loop

