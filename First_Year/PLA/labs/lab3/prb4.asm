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
x db 16 ;define byte
.code
start:
	
	mov eax, 0
	
	
	shr x, 1
	adc eax, 0 ;eax = eax + 0 + CF
	
	shr x, 1
	adc eax, 0 ;eax = eax + 0 + CF
	
	shr x, 1
	adc eax, 0 ;eax = eax + 0 + CF
	
	shr x, 1
	adc eax, 0 ;eax = eax + 0 + CF
	
	shr x, 1
	adc eax, 0 ;eax = eax + 0 + CF
	
	shr x, 1
	adc eax, 0 ;eax = eax + 0 + CF
	
	shr x, 1
	adc eax, 0 ;eax = eax + 0 + CF
	
	shr x, 1
	adc eax, 0 ;eax = eax + 0 + CF
	
	shr x, 1
	adc eax, 0 ;eax = eax + 0 + CF
	
	sub eax, 1
	
	;apel functie exit
	push 0
	call exit
end start
