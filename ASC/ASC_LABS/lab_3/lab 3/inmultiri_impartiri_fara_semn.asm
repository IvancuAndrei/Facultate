bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; a-doubleword; b-byte; c-word; x-qword
    a dd 14
    b db 6
    c dw 2
    x dq 1

; (a + b / c - 1) / (b + 2) - x
segment code use32 class=code
    start:
        mov al, [b]; al = b = 6
        mov ah, 0; conversie fara semn de la al la ax
        mov dx, 0; conversie fara semn de la ax la dx:ax
        div word[c]; ax = dx:ax / c = b / c = 3
        add ax, word[a]
        add dx, word[a+2]; dx:ax = a + b / c = 17
        mov bx, 1; bx = 1
        mov cx, 0; conversie fara semn de la bx la cx:bx
        add ax, bx
        adc dx, cx; dx:ax = a + b / c - 1
        mov bl, [b]; bl = b = 6
        mov bh, 0; conversie fara semn de la bl la bx
        add bx, 2; bx = b + 2 = 8
        div bx; ax = dx:ax / bx = (a + b / c - 1) / (b + 2) = 2
        mov dx, 0;
        push dx
        push ax
        pop eax; eax = dx:ax = (a + b / c - 1) / (b + 2) = 2
        mov edx, 0; conversie fara semn de la eax la edx:eax
        mov ebx, dword[x]
        mov ecx, dword[x+4]; ecx:ebx = x-qword
        sub eax, ebx
        sbb edx, ecx; edx:eax = edx:eax - ecx:ebx = (a + b / c - 1) / (b + 2) - x = 1
        push    dword 0      
        call    [exit]       
