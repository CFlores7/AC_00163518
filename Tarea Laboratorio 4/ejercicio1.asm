        org 100h

        section .text

; 'MAIN'
        ;Limpiando el registro
        xor CX, CX
        ;Almacenando el divisor
        mov CL, 2d

        ;Copiamos la lista de numero al registro BP
        mov BP, lista
        ;Llamada a la subrutina StoreArr (Guardar Array)
        call StoreArr

        ;Fin del programa
        int 20h

        section .data
; Arreglo con los 10 numeros al azar
lista db 5,8,22,6,3,9,15,12,20,11,0xA       


; FUNCIONES

StoreArr:      
        ; Limpiando el registro de Indice
        xor SI, SI

;Representando una funcion while
while:
        ; Limpiando registros
        xor AX, AX
        xor DX, DX

        ; Almacenamos el valor de la lista en AL
        mov AL, [BP+SI]
        ; Copiamos el valor de AL a DL
        mov DL, AL

        ; Verificando que no se haya llegado al final de la lista
        cmp AL, 0xA
        ; Si llego al final:
        je end ; Salto a la etiqueta "end"
        ; Si no, dividimos el valor en AL entre CL
        div CL
        ; Comparando si el residuo es igual a 0
        cmp AH, 0
        je llenar ; Si AH == 0, el valor pertenece al registro de PARES
        jne llenarimpar ; Si AH != 0, el valor pertenece al registro de IMPARES

; Llenando con los numeros pares
llenar: 
        ;Movemos el dato que viene en el registro DL, hacia el registro de pares (300h)
        mov [300h+SI], DL
        ; Incrementamos el indice en 1 (SI++)
        inc SI 
        ; Volvemos a la etiqueta "while" con SI incrementado en 1
        jmp while

llenarimpar: 
        ; Movemos el dato que viene en el registro DL, hacia el registro de impares (320h)
        mov [320h+SI], DL
        ; Incrementamos el indice en 1 (SI++)
        inc SI
        ; Volvemos a la etiqueta "while" con SI incrementado en 1
        jmp while

end:
        ; Retornamos al 'MAIN'
        ret