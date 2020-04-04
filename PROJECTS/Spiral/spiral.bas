REM SPIRAL
REM

'RUPDALL(1)

dim X as float, Y as float, Y2 as int
dim i as int
dim particles[512][6] as int

    particles[0][3]=160<<16 'centre x
    particles[0][4]=100<<16 'centre y
    particles[0][5]=64 'particle count
    for i=1 to 64
        particles[i][0]=i*8 'angle
        particles[i][1]=i       'speed
        particles[i][2]=0       'angular speed
        particles[i][3]=15      'initial colour
        particles[i][4]=100       'colour decay (per frame)
        particles[i][5]=150      'pixel life (in frames)
    next i
    
do
    
    RPARTI(strptr(particles))
    delay(150)
loop
