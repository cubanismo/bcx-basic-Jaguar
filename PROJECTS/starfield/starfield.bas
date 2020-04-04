' starfield particle effect demonstration rb+, sh3-rg

DIM x%          :       x=96
DIM y%          :       y=76
DIM counter%    :       counter=0
DIM decay%      :       decay=10
DIM angular%    :       angular=0
DIM interval%   :       interval=5
DIM speed%      :       speed=7
DIM life%       :       life=160

DIM i%          :       i=0
    DIM particles%[17,6]
        particles[0,3]=x<<16                            ' x start
        particles[0,4]=y<<16                            ' y start
        particles[0,5]=16                               ' particle count
        FOR i=1 TO  16
            particles[i,0]=(RND*511)                    ' angle
            particles[i,1]=(RND*speed)+4                ' speed
            particles[i,2]=angular                      ' angular speed
            particles[i,3]=15                           ' initial colour
            particles[i,4]=decay                        ' colour decay (per frame)
            particles[i,5]=(RND*life)                   ' pixel life (in frames)
        NEXT    i

    DIM particles2%[17,6]
        particles2[0,3]=x<<16                           ' x start
        particles2[0,4]=y<<16                           ' y start
        particles2[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particles2[i,0]=(RND*511)                   ' angle
            particles2[i,1]=(RND*speed)+4               ' speed
            particles2[i,2]=angular                     ' angular speed
            particles2[i,3]=15                          ' initial colour
            particles2[i,4]=decay                       ' colour decay (per frame)
            particles2[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i

    DIM particles3%[17,6]
        particles3[0,3]=x<<16                           ' x start
        particles3[0,4]=y<<16                           ' y start
        particles3[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particles3[i,0]=(RND*511)                   ' angle
            particles3[i,1]=(RND*speed)+4               ' speed
            particles3[i,2]=angular                     ' angular speed
            particles3[i,3]=15                          ' initial colour
            particles3[i,4]=decay                       ' colour decay (per frame)
            particles3[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i       
    DIM particles4%[17,6]
        particles4[0,3]=x<<16                           ' x start
        particles4[0,4]=y<<16                           ' y start
        particles4[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particles4[i,0]=(RND*511)                   ' angle
            particles4[i,1]=(RND*speed)+4               ' speed
            particles4[i,2]=angular                     ' angular speed
            particles4[i,3]=15                          ' initial colour
            particles4[i,4]=decay                       ' colour decay (per frame)
            particles4[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i       
    DIM particles5%[17,6]
        particles5[0,3]=x<<16                           ' x start
        particles5[0,4]=y<<16                           ' y start
        particles5[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particles5[i,0]=(RND*511)                   ' angle
            particles5[i,1]=(RND*speed)+4               ' speed
            particles5[i,2]=angular                     ' angular speed
            particles5[i,3]=15                          ' initial colour
            particles5[i,4]=decay                       ' colour decay (per frame)
            particles5[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i       
    DIM particles6%[17,6]
        particles6[0,3]=x<<16                           ' x start
        particles6[0,4]=y<<16                           ' y start
        particles6[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particles6[i,0]=(RND*511)                   ' angle
            particles6[i,1]=(RND*speed)+4               ' speed
            particles6[i,2]=angular                     ' angular speed
            particles6[i,3]=15                          ' initial colour
            particles6[i,4]=decay                       ' colour decay (per frame)
            particles6[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i       
    DIM particles7%[17,6]
        particles7[0,3]=x<<16                           ' x start
        particles7[0,4]=y<<16                           ' y start
        particles7[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particles7[i,0]=(RND*511)                   ' angle
            particles7[i,1]=(RND*speed)+4               ' speed
            particles7[i,2]=angular                     ' angular speed
            particles7[i,3]=15                          ' initial colour
            particles7[i,4]=decay                       ' colour decay (per frame)
            particles7[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i       
        
    DIM particles8%[17,6]
        particles8[0,3]=x<<16                           ' x start
        particles8[0,4]=y<<16                           ' y start
        particles8[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particles8[i,0]=(RND*511)                   ' angle
            particles8[i,1]=(RND*speed)+4               ' speed
            particles8[i,2]=angular                     ' angular speed
            particles8[i,3]=15                          ' initial colour
            particles8[i,4]=decay                       ' colour decay (per frame)
            particles8[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i       
        
    DIM particles9%[17,6]
        particles9[0,3]=x<<16                           ' x start
        particles9[0,4]=y<<16                           ' y start
        particles9[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particles9[i,0]=(RND*511)                   ' angle
            particles9[i,1]=(RND*speed)+4               ' speed
            particles9[i,2]=angular                     ' angular speed
            particles9[i,3]=15                          ' initial colour
            particles9[i,4]=decay                       ' colour decay (per frame)
            particles9[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i       
        
    DIM particlesa%[17,6]
        particlesa[0,3]=x<<16                           ' x start
        particlesa[0,4]=y<<16                           ' y start
        particlesa[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particlesa[i,0]=(RND*511)                   ' angle
            particlesa[i,1]=(RND*speed)+4               ' speed
            particlesa[i,2]=angular                     ' angular speed
            particlesa[i,3]=15                          ' initial colour
            particlesa[i,4]=decay                       ' colour decay (per frame)
            particlesa[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i       
        
    DIM particlesb%[17,6]
        particlesb[0,3]=x<<16                           ' x start
        particlesb[0,4]=y<<16                           ' y start
        particlesb[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particlesb[i,0]=(RND*511)                   ' angle
            particlesb[i,1]=(RND*speed)+4               ' speed
            particlesb[i,2]=angular                     ' angular speed
            particlesb[i,3]=15                          ' initial colour
            particlesb[i,4]=decay                       ' colour decay (per frame)
            particlesb[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i       
        
    DIM particlesc%[17,6]
        particlesc[0,3]=x<<16                           ' x start
        particlesc[0,4]=y<<16                           ' y start
        particlesc[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particlesc[i,0]=(RND*511)                   ' angle
            particlesc[i,1]=(RND*speed)+4               ' speed
            particlesc[i,2]=angular                     ' angular speed
            particlesc[i,3]=15                          ' initial colour
            particlesc[i,4]=decay                       ' colour decay (per frame)
            particlesc[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i       
        
    DIM particlesd%[17,6]
        particlesd[0,3]=x<<16                           ' x start
        particlesd[0,4]=y<<16                           ' y start
        particlesd[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particlesd[i,0]=(RND*511)                   ' angle
            particlesd[i,1]=(RND*speed)+4               ' speed
            particlesd[i,2]=angular                     ' angular speed
            particlesd[i,3]=15                          ' initial colour
            particlesd[i,4]=decay                       ' colour decay (per frame)
            particlesd[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i       
        
    DIM particlese%[17,6]
        particlese[0,3]=x<<16                           ' x start
        particlese[0,4]=y<<16                           ' y start
        particlese[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particlese[i,0]=(RND*511)                   ' angle
            particlese[i,1]=(RND*speed)+4               ' speed
            particlese[i,2]=angular                     ' angular speed
            particlese[i,3]=15                          ' initial colour
            particlese[i,4]=decay                       ' colour decay (per frame)
            particlese[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i       
        
    DIM particlesf%[17,6]
        particlesf[0,3]=x<<16                           ' x start
        particlesf[0,4]=y<<16                           ' y start
        particlesf[0,5]=16                              ' particle count
        FOR i=1 TO  16
            particlesf[i,0]=(RND*511)                   ' angle
            particlesf[i,1]=(RND*speed)+4               ' speed
            particlesf[i,2]=angular                     ' angular speed
            particlesf[i,3]=15                          ' initial colour
            particlesf[i,4]=decay                       ' colour decay (per frame)
            particlesf[i,5]=(RND*life)                  ' pixel life (in frames)
        NEXT    i       
        
DPOKE   BG,0

DO

    counter=counter+1

    VSYNC
    IF counter=interval THEN
        RPARTI(strptr(particles))
    ENDIF
    
    IF counter=interval*2   THEN
        RPARTI(strptr(particles2))
    ENDIF
    IF counter=interval*3   THEN
        RPARTI(strptr(particles3))
    ENDIF
    IF counter=interval*4   THEN
        RPARTI(strptr(particles4))
    ENDIF
    IF counter=interval*5   THEN
        RPARTI(strptr(particles5))
    ENDIF
    IF counter=interval*6   THEN
        RPARTI(strptr(particles6))
    ENDIF
    IF counter=interval*7   THEN
        RPARTI(strptr(particles7))
    ENDIF
    IF counter=interval*8   THEN
        RPARTI(strptr(particles8))
    ENDIF
    IF counter=interval*9   THEN
        RPARTI(strptr(particles9))
    ENDIF
    IF counter=interval*10  THEN
        RPARTI(strptr(particlesa))
    ENDIF
    IF counter=interval*11  THEN
        RPARTI(strptr(particlesb))
    ENDIF
    IF counter=interval*12  THEN
        RPARTI(strptr(particlesc))
    ENDIF
    IF counter=interval*13  THEN
        RPARTI(strptr(particlesd))
    ENDIF
    IF counter=interval*14  THEN
        RPARTI(strptr(particlese))
    ENDIF
    
    IF counter=>interval*15 THEN
        RPARTI(strptr(particlesf))
        counter=0
    ENDIF
LOOP
