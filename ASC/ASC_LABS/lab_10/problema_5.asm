bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit, printf, fread, fopen, fclose               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions
import printf msvcrt.dll
import fread msvcrt.dll
import fclose msvcrt.dll
import fopen msvcrt.dll
; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a db "a.txt", 0
    mod_a db "r", 0
    des_a dd 0
    format_c db "%c", 0
    format_s db "%d", 0
    buffer db 0
; Se da un fisier text. Sa se citeasca continutul fisierului, sa se contorizeze numarul de caractere speciale si sa se afiseze aceasta valoare. Numele fisierului text este definit in segmentul de date
segment code use32 class=code
    start:
        ;fopen("a.txt", "r")
        push dword mod_a
        push dword a
        call [fopen]
        add esp, 2*4
        cmp eax, 0
        je final
        mov dword[des_a], eax
        mov ebx, 0
        repeta:
            ;fread(buffer, 1, 1, des_a)
            push ebx
            push dword [des_a]
            push dword 1
            push dword 1
            push dword buffer 
            call [fread]
            add esp, 4*4
            pop ebx
            cmp eax, 0
            je final_1
            mov al, [buffer]
            cmp al, '0'
            jb adunare
            cmp al, '9'
            jbe repeta
            cmp al, 'A'
            jb adunare
            cmp al, 'Z'
            jbe repeta
            cmp al, 'a'
            jb adunare
            cmp al, 'z'
            ja adunare
            jbe repeta
            adunare:
                inc ebx
                jmp repeta
        final_1:
            ;printf(format_s, ebx)
            push ebx
            push dword format_s
            call [printf]
            add esp, 2*4
            ;fclose(des_a)
            push dword [des_a]
            call [fclose]
            add esp, 4
        final:
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
