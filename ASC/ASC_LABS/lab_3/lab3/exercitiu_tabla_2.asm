bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a db 10 
    c db 5
    b dw 20
; a+b/c
segment code use32 class=code
    start:
        mov ax,[b];ax=b=20
        div byte[c];al=ax/c=20/5=4
        mov bl,[a];bl=a=10
        add bl,al;bl=bl+al=a+b/c=14
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
