org 100h

section .text

    ;Limpiando los registros
    xor AX, AX
    xor BX, BX

    mov AL, 5d ; Numero del cual necesitamos su factorial
    mov BL, 5d ; Valor del iterador y operando
    jmp factorial ; Salto a la etiqueta 'factorial'

factorial:
    cmp BL, 1d ; Comparando si el registro BL es igual a 1
    je exit ; Salto condicional, si BL es igual a 1. Salta a etiqueta 'exit'
    sub BL, 1d ; Restando 1 al iterador en el registro BL
    mul BL ; Multiplicando el valor en AL por el valor que tenga BL
    jmp factorial ; Salto a la etiqueta 'factorial'
exit:

    mov byte [20Bh], AL ; Moviendo el resultado a AL

    int 20h