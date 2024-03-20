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
    a dd -21
    b db 8
    c dw 4
    x dq 6
    ; (a + b / c - 1) / (b + 2) - x
segment code use32 class=code
    start:
        mov al, [b]; al = b = 8
        cbw; conversie cu semn de la al la ax 
        cwd; conversie cu semn de la ax la dx:ax
        idiv word[c]; ax = dx:ax / c = b / c = 2
        cwd; conversie cu semn de la ax la dx:ax
        add ax, word[a]
        add dx, word[a+2]; dx:ax = a + b / c = -19
        mov bx, 1; bx = 1
        mov cx, 0; conversie cu semn de la bx la cx:bx
        sub ax, bx
        sbb dx, cx; dx:ax = a + b / c - 1 = -20
        movsx bx, byte[b]; bx = b = 8
        add bx, 2; bx = b + 2 = 10
        idiv bx; ax = dx:ax / bx = (a + b / c - 1) / (b + 2) = -2
        cwde; conversie cu semn de la ax la eax 
        cdq; conversie cu semn de la eax la edx:eax
        mov ebx, dword[x]
        mov ecx, dword[x+4]; ecx:ebx = x = 66
        sub eax,ebx
        sbb edx,ecx; edx:eax = (a + b / c - 1) / (b + 2) - x = -8
        push    dword 0      
        call    [exit]       
