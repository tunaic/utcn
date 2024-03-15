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

    ; Salvam rezultatul in EBX
    mov ebx, eax

    ; Inmultim rezultatul cu b
    imul ebx, b             ; Inmulteste EAX (rezultatul) cu b

    ; Impartim rezultatul la 6
    mov ecx, 6              ; Incarca 6 in ECX (divizorul)
    div ecx                 ; Impartim EAX (rezultatul) la ECX

    ; Salvam rezultatul partial in EAX
    mov eax, ebx

    ; Inmultim EDX cu 15
    mov ebx, edx            ; Salveaza EDX intr-un registru auxiliar
    mov edx, 0              ; Resetam EDX pentru a efectua corect inmultirea
    mov ecx, 15             ; Incarca 15 in ECX (multiplii)
    mul ecx                 ; Inmulteste EAX cu 15 (rezultatul in EAX)

    ; Calculam z - ESI
    sub ebx, esi            ; Scade ESI din valoarea salvata anterior in EBX

    ; Impartim rezultatul anterior la z - ESI
    div ebx                 ; Impartim EAX la valoarea din EBX

    ; Impartim rezultatul partial la rezultatul calculat anterior
    div ebx                 ; Impartim EAX la valoarea din EBX

    ; Adunam rezultatele
    add eax, ebx            ; Aduna EAX cu EBX

    ; Iesire
    push 0
    call exit

end start
