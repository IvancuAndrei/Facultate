bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; A, B - word , C - doubleword  
    A dw 8a9fh
    B dw 0af9ah
    C dd 0
; Se dau cuvintele A si B. Se cere dublucuvantul C:
; bitii 0-5 ai lui C coincid cu bitii 3-8 ai lui A 
; bitii 6-8 ai lui C coincid cu bitii 2-4 ai lui B
; bitii 9-15 ai lui C reprezinta bitii 6-12 ai lui A
; bitii 16-31 ai lui C sunt 0
segment code use32 class=code
    start:
        mov ebx, 0; in registrul ebx vom calcula rezultatul 
        mov ax, [A]; izolam bitii 3-8 ai lui A
        and ax, 0000000111111000b
        mov cl, 3
        ror ax, cl; rotim 3 pozitii spre dreapta
        movzx eax, ax;
        or ebx, eax; punem bitii in rezultat
        mov ax, [B]; izolam bitii 2-4 ai lui B
        and ax, 0000000000011100b
        shl ax, 4; mutam 4 pozitii spre stanga
        movzx eax, ax
        or ebx, eax
        mov ax, [A]; izolam bitii 6-12 ai lui A
        and ax, 0001111111000000b
        shl ax, 3; mutam 3 pozitii spre stanga
        movzx eax, ax
        or ebx, eax
        mov [C], ebx
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
