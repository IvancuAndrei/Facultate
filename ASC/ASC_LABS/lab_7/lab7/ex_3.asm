bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    s1 dw 1234h, 67abh, 89cdh
    l1 equ ($-s1)/2
    s2 dw 2345h, 5678h, 4567h
    d times l1 dw 0
; Se dau doua siruri de cuvinte s1 si s2.
; Se cere sirul de cuvinte d obtinut in interpretarea cu semn, astfel:
; - d[i] = s1[i], daca s1[i] > s2[i]
; - d[i] = s2[i], altfel.
segment code use32 class=code
    start:
        ; copiem s1 in d
        mov ecx, l1
        jecxz final
        cld
        mov esi, s1
        mov edi, d
        rep movsw
        mov ecx, l1
        jecxz final
        cld
        mov esi, s2
        mov edi, d
        repeta:
            cmpsw ; cmp intre ds:esi, es:edi si se incrementeaza esi si edi
            jg mai_mare
            sub esi, 2
            sub edi, 2
            movsw
        mai_mare:    
        loop repeta
        final:
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
