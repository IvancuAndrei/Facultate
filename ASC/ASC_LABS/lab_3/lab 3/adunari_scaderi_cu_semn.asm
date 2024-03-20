bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ;a - byte, b - word, c - double word, d - qword - Interpretare cu semn
    a db 10
    b dw -7
    c dd 4
    d dq -3
    ;(c + b + b)-(c + a + d) = (c + b + b) - (c + a) - d  
segment code use32 class=code
    start:
        mov ebx, [c]; ebx = c = 4
        mov ax, [b]; ax = b = -7
        cwde; conversie cu semn de la ax la eax
        add ebx, eax; ebx = ebx + eax = c + b = -3
        add ebx, eax; ebx = ebx + eax = c + b + b = -10
        ; eax, ebx folosite
        mov eax, 0; eax = 0
        mov al, [a]; al = a = 10
        cbw; conversie cu semn de la al la ax
        cwde; conversie cu semn de la ax la eax
        mov ecx, [c]; ecx = c = 4
        add ecx, eax; ecx = ecx + eax = c + a = 14
        sub ebx, ecx; ebx = ebx - ecx = (c + b + b) - (c + a) = -24
        ; eax, ebx, ecx folosite
        mov eax, ebx; eax = ebx = (c + b + b) - (c + a) = -24
        cdq; conversie cu semn de la eax la edx:eax
        mov ebx, dword[d]
        mov ecx, dword[d+4]; ecx:ebx = d = -3
        sub eax,ebx;
        sbb edx,ecx; edx:eax = edx:eax - ecx:ebx = (c + b + b) - (c + a) - d = -21
        push    dword 0     
        call    [exit]      
