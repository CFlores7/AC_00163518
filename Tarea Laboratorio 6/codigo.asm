        org 100h

        ;Funcion MAIN
        section .text
        MOV CX, 5 ; Se establece tamanio de contrasenia con 5 caracteres
        CALL InputPass ; Funcion que lee lo mostrado desde teclado

        ; Funcion que lee interrupcion DOS desde teclado
        EsperarTecla:
                MOV AH, 07h ; Interrupcion para leer caracter desde teclado
                INT 21h ; Interrupcion DOS
                
                RET

        ; Funcion para escribir contrasenia
        InputPass:
                XOR SI,SI ; Limpiamos registro SI
        
        ; While para input desde teclado, hasta presionar 'EnterKey'
        while:
                CALL EsperarTecla ; Espacio para que el usuario presione una tecla

                ; Validacion de la tecla presionada
                CMP AL, 0x0D ; IF( tecla == 'EnterKey' )
                JE VerificarContra
                ; ELSE
                MOV [200h+SI], AL ; Se guarda ese caracter en un espacio de memoria
                INC SI ; SI++
                JMP while ; Vuelve a ejecutar while con SI=SI+1

        ; Funcion para validar contrasenia ingresada
        VerificarContra:
                XOR SI, SI ; Limpiamos el registro SI

                JMP for ; Salto a etiqueta for, para ejecutar un FOR STATEMENT

        ; For para recorrer cadena ingresada con contrasenia de .data
        for:
                MOV AL, [contra+SI] ; Guardamos el caracter correspondiente a la cadena de .data

                ; Comparamos el caracter almacenado con el correspondiente en memoria [200h+i] 
                CMP AL, [200h+SI] ; IF(AL != [200h+i])
                JNE ContraErronea ; Salto si difieren, a etiqueta ContraErronea
                ; ELSE 
                INC SI ; SI++
                LOOP for ; Vuelve a ejecutar for con SI=SI+1

                ; Si llega a esta linea, quiere decir que cada caracter era igual al de .data
                CALL ContraCorrecta ; Funcion para mostrar "Bienvenido"
                JMP Exit ; Terminar programa

        ; Funcion que muestra en consola el texto "BIENVENIDO"
        ContraCorrecta:
                MOV AH, 09h ; Interrupcion para mostrar cadena de caracteres
                MOV DX, correcto ; Cadena a mostrar
                INT 21h ; Interrupcion DOS

                RET

        ; Funcion que muestra en consola el texto "INCORRECTO"
        ContraErronea:
                MOV AH, 09h ; Interrupcion para mostrar cadena de caracteres
                MOV DX, erroneo ; Cadena a mostrar
                INT 21h ; Interrupcion DOS

                JMP Exit ; Termina el programa

        ; Funcion para terminar el programa
        Exit:
                INT 20h

        ;Informacion que se utilizara
        section .data

        contra DB "ceft7$" ; contrasenia por defecto
        correcto DB "BIENVENIDO$" ; texto a mostrar si la contrasenia coincide
        erroneo DB "INCORRECTO$" ; texto a mostrar si la contrasenia no coincide