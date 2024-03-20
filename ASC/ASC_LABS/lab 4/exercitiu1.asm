bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; a, b, c, d - byte, e, f, g, h - word
    d db 7
    e dw 5
    f dw 4
; f * (e - 2) / [3 * (d - 5)] = 2
segment code use32 class=code
    start:
        mov al, [d]; al = d = 7
        sub al, 5; al = d - 5 = 2
        mov bl, 3; bl = 3
        mul bl; ax = al * bl = 3 * (d - 5) = 6
        mov bx, ax;
        mov ax, [f]; ax = f = 4
        mov cx, [e]; cx = e = 5
        sub cx, 2; cx = e - 2
        mul cx; dx:ax = ax * cx = f * (e - 2) = 12
        div bx; ax = dx:ax / bx = f * (e - 2) / [3 * (d - 5)] = 2     
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
