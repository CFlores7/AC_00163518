org 100h

section .text

	; Limpiando los registros que utilizaremos
	xor AX, AX
	xor BX, BX
	
	; Almacenando los valores del carnet
	; 00163518
	mov byte [200h], 0d 
	mov byte [201h], 0d
	mov byte [202h], 1d
	mov byte [203h], 6d
	mov byte [204h], 3d
	mov byte [205h], 5d
	mov byte [206h], 1d
	mov byte [207h], 8d
	jmp sumar ; Salto hacia la etiqueta sumar

	xor SI, SI ; Limpiando el registro SI
	mov SI, 0 ; Iniciando el registro SI en 0, sera indice de la suma

sumar:
	cmp SI, 8 ; comparar si el registro SI es igual a 8
	je exit ; Si la condicion se cumple, sale a la etiqueta exit

	add AL, [200h+SI] ; Sumando en AL, lo que tenga AL con lo que este en la direccion "base mas indice"
	add SI, 1 ; Luego de sumar, se aumenta uno al indice
	jmp sumar ; Salto hacia la etiqueta sumar

exit:
	mov BX, 8d ; Asignando valor al registro BX, 8 por los 8 numeros del carnet
	div BX ; Dividiendo la sumatoria de AL entre BX

	mov byte [20Ah], AL ; Moviendo el resultado a AL

	int 20h