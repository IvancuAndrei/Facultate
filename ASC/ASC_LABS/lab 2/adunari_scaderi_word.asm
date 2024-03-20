bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a dw 10
    b dw 4
    c dw 7
    d dw 6
;(a+c)-(b+b+d) 
segment code use32 class=code
    start:
    mov ax,[a];ax=a=10
    add ax,[c];ax=a+c=17
    mov bx,[b];bx=b=4
    add bx,[b];bx=b+b=8
    add bx,[d];bx=b+b+d=14
    sub ax,bx;ax=ax-bx=(a+c)-(b+b+d)=3
    
        
