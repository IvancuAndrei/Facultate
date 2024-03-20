bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a db 3
    b db 7
    c db 6
    d dw 10
;d+[(a+b)*5-(c+c)*5]
segment code use32 class=code
    start:
        mov al,[a];al=a=3
        add al,[b];al=a+b=10
        mov ah,5;ah=5
        mul ah;ax=ah*al=(a+b)*5=50
        mov bx,ax;bx=ax=50
        mov al,[c];al=c=6
        add al,[c];al=c+c=12
        mov ah,5;ah=5
        mul ah;ax=ah*al=(c+c)*5=60
        sub bx,ax;bx=bx-ax=[(a+b)*5-(c+c)*5]=50-60=-10
        add bx,[d];ax=ax+d=d+[(a+b)*5-(c+c)*5]=0      
        