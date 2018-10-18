    list p=18f4550
    #include<p18f4550.inc>
    
  config FOSC = XT_XT
  config PWRT = ON
  config BOR = OFF
  config WDT = OFF
  config PBADEN = OFF
  config LVP = OFF
  config MCLRE = ON
  
    org 0x0000
    goto configura
    
    org 0x0020
configura:
    bcf TRISD, 0
    bcf TRISD, 1
    bsf TRISB, 0
    bsf TRISB, 1
    bsf TRISB, 2
inicio:
    btfss PORTB, 0
    goto etiqueta1
    goto etiqueta2
etiqueta1:
    btfss PORTB,1
    goto etiqueta3
    goto etiqueta4
etiqueta3:
    btfss PORTB, 2
    goto salida1
    goto salida1
etiqueta4:
    btfss PORTB, 2
    goto salida3
    goto salida2
etiqueta2:
    btfss PORTB, 1
    goto etiqueta5
    goto etiqueta6
etiqueta5:
    btfss PORTB, 2
    goto salida3
    goto salida2
etiqueta6:
    btfss PORTB, 2
    goto salida1
    goto salida1
salida1:
    bcf LATD, 0
    bsf LATD, 1
    goto inicio
salida2:
    bsf LATD, 0
    bcf LATD, 1
    goto inicio
salida3:
    bsf LATD, 0
    bsf LATD, 1
    goto inicio
    
    end