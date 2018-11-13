    list p=18f4550
    #include<p18f4550.inc>
    
 CONFIG FOSC = XT_XT
 CONFIG PWRT = ON
 CONFIG BOR = OFF
 CONFIG WDT = OFF
 CONFIG PBADEN = OFF
 CONFIG MCLRE = ON
 CONFIG LVP = ON
 
 cblock
    cuentaa
    cuentab
    cuentac
    cuentau
    cuentad
    unoootro
    endc
    
    org 0x0000
    goto configura
    
    org 0x0200
letras db 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67  
    
    org 0x0020
configura:
    clrf TRISB
    clrf TRISD
    movlw UPPER letras
    movwf TBLPTRU
    movlw HIGH letras
    movwf TBLPTRH
    movlw LOW letras
    movwf TBLPTRL
    movlw .2
    movwf cuentad
    movlw .3
    movwf cuentau
    bcf TRISC, 4
inicio:
    btfss PORTC, 0
    goto conta
    goto xorbit

conta:
    call mostrar
    call led
    call retardo
    movlw .1
    cpfseq unoootro
    goto abajar
    movlw .9
    cpfseq cuentad
    goto fols
    goto tru
    
fols:
    movlw .9
    cpfseq cuentau
    goto uf
    goto uv

uf:
    incf cuentau, f
    goto inicio
    
uv:
    movlw .0
    movwf cuentau
    incf cuentad, f
    goto inicio

tru:
    movlw .5
    cpfseq cuentau
    goto uf
    incf unoootro, f
    goto abajar
    
abajar:
    movlw .2
    cpfseq cuentad
    goto afols
    goto atru
    
afols:
    movlw .0
    cpfseq cuentau
    goto auf
    goto auv
    
auf:
    decf cuentau, f
    goto inicio

auv:
    movlw .9
    movwf cuentau
    decf cuentad, f
    goto inicio
    
atru:
    movlw .3
    cpfseq cuentau
    goto auf
    decf unoootro, f
    goto inicio
    
xorbit:
    btfss PORTC, 1
    goto z
    goto u
    
z:
    btfss PORTC, 2
    goto zero
    goto one
  
u:
    btfss PORTC, 2
    goto one
    goto zero
    
one:
    bsf LATC, 4
    goto inicio

zero:
    bcf LATC, 4
    goto inicio

led:
    bcf LATC, 4
    movlw .7
    cpfseq cuentad
    goto siete
    movlw .7
    cpfseq .7
    bsf LATC, 4
    return  
    
siete:
    movlw .7
    cpfseq cuentau
    return
    
mostrar:
    clrf TBLPTR
    movf cuentau, W
    addwf TBLPTRL
    TBLRD*
    movff TBLPTRL, LATD
    
    clrf TBLPTR
    movf cuentad, W
    addwf TBLPTRL
    TBLRD*
    movff TBLPTRL, LATB
    return
    
retardo:
    movlw .100
    movwf cuentaa
otro1:
    call bubble
    decfsz cuentaa, f
    goto otro1
    return
    
bubble:
    movlw .50
    movwf cuentab
    
otro2:
    call bubble2
    decfsz cuentab, f
    goto otro2
    return
    
bubble2:
    movlw .10
    movwf cuentac

otro3:
    nop
    decfsz cuentac, f
    goto otro3
    return
    
    end