bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit, printf, fscanf, fopen, fclose               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
import fscanf msvcrt.dll                         ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions
import printf msvcrt.dll
import fopen msvcrt.dll
import fclose msvcrt.dll

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a db "a.txt", 0
    descriptor dd 0
    mod_a db "r", 0
    caracter dd 0
    format_c db "%c", 0

; our code starts here
segment code use32 class=code
    start:
        
        ;fopen(nume_fisier, mod_a)
        push dword mod_a
        push dword a
        call [fopen]
        add esp, 2 * 4
        cmp eax, 0
        je final
        mov [descriptor], eax
        
        citire:
            
            ;fscanf(descriptor, format, caracter)
            push dword caracter
            push dword format_c
            push dword [descriptor]
            call [fscanf]
            add esp, 4 * 3
            
            cmp eax, 1
            jne afara
            
            cmp dword[caracter], " "
            je afisare
            sub dword[caracter], 3
            
            afisare:
                ;printf(format, caracter)
                push dword [caracter]
                push dword format_c
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
