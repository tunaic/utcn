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
.code
start:
	;initializez pe eax si ebx cu valori oarecare
	mov eax, 3
	mov ebx, 8
	
	;edx:eax = eax * 7
	mov ecx, 7
	mov edx, 0
	mul ecx
	
	;esi = 7 * eax (old)
	mov esi, eax
	
	;edx:eax = 2 * ebx
	mov eax, 2
	mov edx, 0
	mul ebx
	
	;esi = 7 * eax - 2 * ebx
	sub esi, eax
	
	;eax = ebx / 8
	mov eax, ebx
	mov edx, 0
	mov ecx, 8
	div ecx
	
	;esi = 7 * eax - 2 * ebx - ebx / 8
	sub esi, eax
	
	mov eax, esi
	
	;apel functie exit
	push 0
	call exit
end start
