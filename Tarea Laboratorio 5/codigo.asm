org 100h

    section .text
    ; Limpiando los registros que se van a utilizar
    XOR AX, AX
    XOR SI, SI
    XOR BX, BX
    XOR CX, CX
    XOR DX, DX
    
    ; Funcion 'MAIN'
    CALL modotexto ; Llamada a la funcion para activar el modo texto con su tamaño respectivo
    CALL movercursor1 ; Llamada a la funcion mover cursor para poder escribir la cadena correspondiente
    CALL escribirnombre1 ; Llamada a la funcion para escribir la cadena de texto almacenada
    CALL movercursor2 ; Llamada a la funcion mover cursor con variacion en fila para poder escribir la cadena correspondiente
    CALL escribirnombre2 ; Llamada a la funcion para escribir la cadena de texto almacenada
    CALL movercursor3 ; Llamada a la funcion mover cursor con variacion en fila para poder escribir la cadena correspondiente
    CALL escribirapellido1 ; Llamada a la funcion para escribir la cadena de texto almacenada
    CALL movercursor4 ; Llamada a la funcion mover cursor con variacion en fila para poder escribir la cadena correspondiente
    CALL escribirapellido2 ; Llamada a la funcion para escribir la cadena de texto almacenada
    CALL esperartecla ; Llamada a la funcion que espera una accion desde teclado para poder terminar el programa
    CALL salir ; Llamada a la funcion para terminar el programa

    modotexto: 
        MOV AH, 0h ; Activa el modo texto
        MOV AL, 03h ; Dimensiones del modo grafico(25 filas, 80 columnas)
        INT 10h ; Llamada a la interrupcion BIOS
        RET ; Regresa a la funcion 'MAIN'

    movercursor1:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 10 ; numero de fila del cursor
        MOV DL, 20 ; numero de columna del cursor
        MOV BH, 0h ; numero de pagina
        INT 10h ; Llamada a la interrupcion BIOS
        RET ; Regresa a la funcion 'MAIN'

    escribirnombre1:
        MOV AH, 09h ; muestra la cadena de texto deseada, standard output
        MOV DX, nombre1 ; movemos la cadena de texto que deseamos imprimir
        INT 21h ; Llamada a la interrupcion DOS
        RET ; Regresa a la funcion 'MAIN'

    movercursor2:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 12 ; numero de fila del cursor
        MOV DL, 20 ; numero de columna del cursor
        MOV BH, 0h ; numero de pagina
        INT 10h ; Llamada a la interrupcion BIOS
        RET ; Regresa a la funcion 'MAIN'

    escribirnombre2:
        MOV AH, 09h ; muestra la cadena de texto deseada, standard output
        MOV DX, nombre2 ; movemos la cadena de texto que deseamos imprimir
        INT 21h ; Llamada a la interrupcion DOS
        RET ; Regresa a la funcion 'MAIN'

    movercursor3:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 14 ; numero de fila del cursor
        MOV DL, 20 ; numero de columna del cursor
        MOV BH, 0h ; numero de pagina
        INT 10h ; Llamada a la interrupcion BIOS
        RET ; Regresa a la funcion 'MAIN'
        
    escribirapellido1: ;utilizando interrupcion DOS
        MOV AH, 09h ; muestra la cadena de texto deseada, standard output
        MOV DX, apellido1 ; movemos la cadena de texto que deseamos imprimir
        INT 21h ; Llamada a la interrupcion DOS
        RET ; Regresa a la funcion 'MAIN'

    movercursor4:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 16 ; numero de fila del cursor
        MOV DL, 20 ; numero de columna del cursor
        MOV BH, 0h ; numero de pagina
        INT 10h ; Llamada a la interrupcion BIOS
        RET ; Regresa a la funcion 'MAIN'
        
    escribirapellido2: ;utilizando interrupcion DOS
        MOV AH, 09h ; muestra la cadena de texto deseada, standard output
        MOV DX, apellido2 ; movemos la cadena de texto que deseamos imprimir
        INT 21h ; Llamada a la interrupcion DOS
        RET ; Regresa a la funcion 'MAIN'

    esperartecla:
        MOV AH, 00h ; Espera una pulsacion desde el teclado para poder avanzar
        INT 16h ; Llamada a la interrupcion que controla el teclado
        RET ; Regresa a la funcion 'MAIN'

    salir:
        INT 20h ; finaliza el programa

;Informacion con cada nombre en una cadena independiente
section .data

nombre1 DB "Carlos$"
nombre2 DB "Enrique$"
apellido1 DB "Flores$"
apellido2 DB "Trujillo$"