.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
NUM1 DB 10 
NUM2 DB 5
REZ DB 0

.code
start:
	;initializam pe eax cu 0
	mov eax, 0
	
	;in al si bl punem niste valori oarecare
	mov ax, 2
	mov bx, 4
	
	;pastram vechea valoare a lui al pe stiva
	mov esi, eax
	
	mov ecx, 0
	mov cx, NUM1
	;ax*NUM1
	mul cx
		
	add REZ, bx
	add REZ, ax
	
	;luam de pe stiva vechea valoare a lui al
	pop eax
	mov cl, NUM1
	;al*NUM1
	mul cl
	
	add REZ, al
	
	;apel functie exit
	push 0
	call exit
end start
