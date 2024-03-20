bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit, fopen, fclose, scanf, fprintf               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll
import fopen msvcrt.dll
import fclose msvcrt.dll
import scanf msvcrt.dll
import fprintf msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a db "a.txt", 0
    nr dd 0
    format_numar db "%d", 0
    format_cuvant db "%s", 0
    descriptor dd 0
    mod_a db "w", 0
    format_cuvant_afisare db "%s ", 0
    sir times 100 db 0

; Sa se citeasca de la tastatura pana un numar n, apoi sa se citeasca mai multe cuvinte pana cand se citeste cuvantul "#". 
; Sa se citeasca toate cuvintele citite care au cel putin n vocale.
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
        
        ;scanf(format, nr)
        push dword nr
        push dword format_numar
        call [scanf]
        add esp, 2 * 4
        
        citire:
            
            ;scanf(format, sir)
            push dword sir
            push dword format_cuvant
            call [scanf]
            add esp, 4 * 2
            
            cmp byte[sir], "#"
            je afara
            
            mov esi, sir
            mov ebx, 0
            cld
            
            repeta:
                
                lodsb 
                cmp al, 0
                je afara_repeta
                cmp al, "a"
                je adunare
                cmp al, "e"
                je adunare
                cmp al, "i"
                je adunare
                cmp al, "o"
                je adunare
                cmp al, "u"
                je adunare
                cmp al, "U"
                je adunare
                cmp al, "A"
                je adunare
                cmp al, "E"
                je adunare
                cmp al, "I"
                je adunare
                cmp al, 'O'
                je adunare
                jmp repeta
                
                adunare:
                    add ebx, 1
                    jmp repeta
                    
            afara_repeta:
            
                cmp ebx, [nr]
                jae afisare
                jmp citire
            
            afisare:
                
                ;fprintf(descriptor, format_cuvant, sir)
                push dword sir
                push dword format_cuvant_afisare
                push dword [descriptor]
                call [fprintf]
                add esp, 4 * 3
                
                jmp citire
        afara:
        
            ;fclose(descriptor)
             push dword [descriptor]
             call [fclose]
             add esp, 4
        
        final:
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
