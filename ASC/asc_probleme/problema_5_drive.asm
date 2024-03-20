bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit, printf, fopen, fclose, fscanf               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
import printf msvcrt.dll                       ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions
import fopen msvcrt.dll
import fclose msvcrt.dll
import fscanf msvcrt.dll

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a db "a.txt", 0
    format_hexa db "%x", 0
    format_cifra db "- %d", 13, 10, 0
    mod_a db "r", 0
    descriptor dd 0
    cifra dd 0
    format_hexa_afisare db "%x ",0
    
; Se citesc cifre din baza 16 separate prin spatiu. Sa se afiseze fiecare cifra citita si numarul de biti 1 din reprezentarea binara a acestuia.
segment code use32 class=code
    start:
        
        ;fopen(nume_fisier, mod_acces)
        push dword mod_a
        push dword a
        call [fopen]
        add esp, 2 * 4
        cmp eax, 0
        je final
        mov [descriptor], eax
        
        citire:
            
            ;fscanf(descriptor, format, cifra)
            push dword cifra
            push dword format_hexa
            push dword [descriptor]
            call [fscanf]
            add esp, 4 * 3
            
            cmp eax, 1
            jne afara
            
            ;printf(format, cifra)
            push dword [cifra]
            push dword format_hexa_afisare
            call [printf]
            add esp, 4 * 2
            
            numar_biti:
                mov edx, 0
                mov eax, [cifra]
                mov ecx, 32
                repeta:
                    shr eax, 1
                    jnc next
                    add edx, 1
                    next:
                    loop repeta
            
            ;printf(format, edx)
            push edx
            push format_cifra
            call [printf]
            add esp, 4 * 2
            
            jmp citire
            
        afara:
            ;fclose(descriptor)
            push dword [descriptor]
            call [fclose]
            add esp, 4
     
        final:
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
