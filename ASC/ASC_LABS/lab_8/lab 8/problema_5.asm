bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; Se dau doua siruri de octeti s1 si s2. Sa se construiasca sirul de octeti d, care contine pentru fiecare octet din s2 pozitia sa in s1, sau 0 in caz contrar.
    
    s1 db 7, 33, 55, 19, 46
    len equ $-s1
    s2 db 33, 21, 7, 13, 27, 19, 55, 1, 46
    l equ $-s2
    d times l db 0 

; d: 2,  0, 1, 0, 0, 4, 3, 0, 5
segment code use32 class=code
    start:
        mov ecx, l
        jecxz sfarsit
        mov esi, s2
        mov edi, d
        cld
        repeta:
            lodsb
            mov ebx, ecx
            mov ecx, len
            jecxz endloop
            repeta2:
                cmp al, [s1 + ecx - 1]
                je gasit
                cmp ecx, 1
                je terminat
                jmp continuare
                terminat:
                    mov al, 0
                    stosb
                    jmp endloop
                gasit:
                    mov eax, ecx
                    stosb
                    jmp endloop
                continuare:
            loop repeta2
            endloop:
            mov ecx, ebx
        loop repeta
        sfarsit:    
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
