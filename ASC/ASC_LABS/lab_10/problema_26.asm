bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit, printf, scanf               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions
import scanf  msvcrt.dll
import printf  msvcrt.dll
; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a dd 0
    b dd 0
    format db '%d','%d', 0
    k equ 10
    format_s db '%x', 0
; Se citesc de la tastatura doua numere a si b. Sa se calculeze valoarea expresiei (a-b)*k, k fiind o constanta definita in segmentul de date. Afisati valoarea expresiei (in baza 16). 
segment code use32 class=code
    start:
        ;scanf(format, a, b)
        push dword b
        push dword a
        push dword format
        call [scanf]
        add esp, 3 * 4
        mov ax, word[a]
        sub ax, word[b]
        mov bx, k
        imul bx
        push dx
        push ax
        pop eax
        ;printf(format_s, eax)
        push eax
        push dword format_s
        call[printf]
        add esp, 2 * 4
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
