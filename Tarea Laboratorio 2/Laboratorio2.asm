	org 100h

	section .text

	;Asignando a las memorias las iniciales correspondientes
	;Mi nombre es Carlos Enrique Flores Trujillo
	mov	byte[200h], "C"
	mov	byte[201h], "E"
	mov	byte[202h], "F"
	mov	byte[203h], "T"

	;DIRECCIONAMIENTO DIRECTO.
	;Enviando la informacion en [200h] hacia AX
	mov	AX, [200h]

	;DIRECCIONAMIENTO INDIRECTO POR REGISTRO.
	;Espacio de memoria almacenado en BX = 201h
	mov	BX, 201h

	;Enviando informacion de 201h hacia CX
	mov	CX, [BX]

	;DIRECCIONAMIENTO INDIRECTO BASE MAS INDICE.
	;Se asigna el indice en SI
	mov	SI, 1h

	;Base = 201h e Indice = 1h, para que la suma acceda a 202h
	;Enviando informacion de [201h+1h] = [202h] hacia DX
	mov	DX, [BX+SI]

	;DIRECCIONAMIENTO RELATIVO POR REGISTRO.
	;Se tiene en BX la direccion de memoria para 201h, y se quiere acceder a la direccion 203h
	;Enviando informacion de [201h+2h] = [203h] hacia DI
	mov	DI, [BX+2h]

	int 20h