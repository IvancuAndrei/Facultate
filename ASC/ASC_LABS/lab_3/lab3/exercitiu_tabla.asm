bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a dw 15
    b db 3
    c db 4

; a-b*c
segment code use32 class=code
    start:
        mov al,[b];al=b=3
        mov bx,[a];bx=a=15
        mul byte[c];ax=al*c=3*4=12
        sub bx,ax;bx=bx-ax=a-b*c
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
