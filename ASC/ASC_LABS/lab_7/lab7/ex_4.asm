bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    s dd 11234456h, 22345567h, 33456678h ;| 56 | 44 | 23 | 11 |
    l equ ($-s)/4
    d times l dw 0
; Se da un sir de dublucuvinte s.
; Se cere sirul d ale carui elemente sunt cuvinte obtinute in interpretarea cu semn, astfel:
; - octetul inferior din d[i] este suma octetilor inferiori ai cuvintelor din fiecare dublucuvant al sirului s
; - octetul superior din d[i] este suma octetilor superiori ai cuvintelor din fiecare dublucuvant al sirului s
segment code use32 class=code
    start:
        mov ecx, l
        jecxz sfarsit
        mov esi, s
        mov edi, d
        cld
        repeta:
            lodsd ; EAX = 11234456h esi = esi + 4
            mov dx, ax
            shr eax, 16
            add al, dl 
            add ah, dh
            stosw
            
        loop repeta
        sfarsit:
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
