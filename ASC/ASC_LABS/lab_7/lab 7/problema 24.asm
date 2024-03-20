bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    A db 2, 1, -3, 0
    l_A equ $-A
    B db 4, 5, 7, 6, 2, 1
    l equ $-A
    l_B equ $-B
    R times l db 0
; R: 1, 2, 6, 7, 5, 4, 0, -3, 1, 2
segment code use32 class=code
    start:
        mov ecx, l_B
        mov esi, l_B-1
        mov ebx, 0
        jecxz iter_A
        RepetaB:
            mov al, [B+esi]
            mov [R+ebx], al
            inc ebx
            dec esi
        loop RepetaB
        iter_A:
            mov ecx, l_A
            mov esi, l_A-1
            jecxz endFor
            RepetaA:
                mov al, [A+esi]
                mov [R+ebx], al
                inc ebx
                dec esi 
            loop RepetaA 
        endFor:
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
