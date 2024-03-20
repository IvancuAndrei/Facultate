bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
   b db 15
   c db 10
   e dw 25
   g dw 35
; (e+g-2*b)/c 
segment code use32 class=code
    start:
        mov bx,[e];bx=e=25
        add bx,[g];bx=e+g=60
        mov al,2;al=2
        mul byte[b];ax=al*b=30
        sub bx,ax;bx=bx-ax=e+g-2*b=30
        mov ax,bx;ax=bx=30
        div byte[c];al=ax/c=(e+g-2*b)/c=3
