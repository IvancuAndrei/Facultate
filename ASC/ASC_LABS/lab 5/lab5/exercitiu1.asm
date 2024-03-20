bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; a,b,c-byte; e-doubleword; x-qword
    a db 2
    b db 7
    c db 1
    e dd 10
    x dq 11

; a / 2 + b * b - a * b * c + e + x = 57
segment code use32 class=code
    start:
        movzx ax, byte[a]; conversie fara semn de la byte-ul a la ax
        mov bl, 2; bl = 2
        div bl; al = ax / bl = a / 2
        mov bl, al; bl = al = a / 2
        mov bh, 0; conversie fara semn de la bl la bx
        mov al, [b]; al = b
        mul byte[b]; ax = al * b = b * b 
        add bx, ax; bx = bx + ax = a / 2 + b * b 
        mov al, [a]; al = a
        mul byte[b]; ax = al * b = a * b
        movzx cx, byte[c]; conversie fara semn de la byte-ul c la cx
        mul cx; dx:ax = ax * cx = a * b * c
        push dx;
        push ax;
        pop eax; eax = a * b * c
        movzx ebx, bx; conversie fara semn de la bx la ebx
        sub ebx, eax; ebx = a / 2 + b * b - a * b * c
        add ebx, [e]; ebx = a / 2 + b * b - a * b * c + e
        mov ecx, 0; conversie fara semn de la ebx la ecx:ebx
        mov eax, dword[x]
        mov edx, dword[x+4]; edx:eax = x
        add ebx, eax
        adc ecx, edx; ecx:ebx = a / 2 + b * b - a * b * c + e + x = 57
        
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
