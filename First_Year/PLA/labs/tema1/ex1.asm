.386
.model flat, stdcall

; includem msvcrt.lib, și declaram ce funcții vrem sa importam
includelib msvcrt.lib
extern exit: proc

; declaram simbolul start ca public - de acolo incepe executia
public start

; sectiunile programului, date, respectiv cod
.data
    b dd 19
    z dd 20

.code
start:
    mov eax, 0              ; Initializeaza EAX cu 0
    mov ebx, 9              ; Incarca 9 in EBX (valoarea lui EBX)
    mov edx, 16             ; Incarca 16 in EDX (valoarea lui EDX)
    mov esi, 13             ; Incarca 13 in ESI (valoarea lui ESI)

    ; Impartim EBX la 5
    mov ecx, 5              ; Incarca 5 in ECX (divizorul)
    div ecx                 ; Impartim EAX (rezultatul) la ECX
    mov ebx, eax            ; Salvam rezultatul in EBX
    mov eax, 0              ; Resetam EAX

    ; Inmultim rezultatul cu b
    mov eax, ebx            ; Incarcam valoarea salvata anterior in EAX
    imul eax, b             ; Inmultim EAX cu b
    mov ebx, eax            ; Salvam rezultatul in EBX
    mov eax, 0              ; Resetam EAX

    ; Impartim rezultatul la 6
    mov ecx, 6              ; Incarca 6 in ECX (divizorul)
    div ecx                 ; Impartim EAX (rezultatul) la ECX
    mov ebx, eax            ; Salvam rezultatul in EBX
    mov eax, 0              ; Resetam EAX

    ; Inmultim EDX cu 15
    mov eax, edx            ; Salveaza EDX intr-un registru auxiliar
    mov edx, 0              ; Resetam EDX pentru a efectua corect inmultirea
    mov ecx, 15             ; Incarca 15 in ECX (multiplii)
    mul ecx                 ; Inmulteste EAX cu 15 (rezultatul in EAX)
    mov edx, eax            ; Salvam rezultatul in EDX
    mov eax, 0              ; Resetam EAX

    ; Calculam z - ESI
    mov eax, edx            ; Incarcam valoarea salvata anterior in EAX
    sub eax, esi            ; Scadem ESI din EAX
    mov ebx, eax            ; Salvam rezultatul in EBX
    mov eax, 0              ; Resetam EAX

    ; Impartim rezultatul anterior la z - ESI
    mov eax, edx            ; Incarcam valoarea salvata anterior in EAX
    div ebx                 ; Impartim EAX la valoarea din EBX
    mov edx, eax            ; Salvam rezultatul in EDX
    mov eax, 0              ; Resetam EAX

    ; Impartim rezultatul partial la rezultatul calculat anterior
    mov eax, ebx            ; Incarcam valoarea salvata anterior in EAX
    div ebx                 ; Impartim EAX la valoarea din EBX
    mov ebx, eax            ; Salvam rezultatul in EBX
    mov eax, 0              ; Resetam EAX

    ; Adunam rezultatele
    add eax, ebx            ; Aduna EAX cu EBX

    ; Iesire
    push 0
    call exit

end start
