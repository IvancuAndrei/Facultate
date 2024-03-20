bits 32 
global start        


extern exit, fopen, fclose, scanf, fprintf               
import exit msvcrt.dll
import fopen msvcrt.dll  
import fclose msvcrt.dll  
import scanf msvcrt.dll      
import fprintf msvcrt.dll  

segment data use32 class=data
    a db "a.txt", 0
    format_n db "%d", 0
    descriptor dd 0
    mod_a db "w", 0
    nr dd 0
    format_afisare db "%d ", 0
    format_hexa db "%x ", 0
    format_biti db "%d", 13, 10, 0
    
; Se citesc de la tastatura numere in baza 10 pana la citirea numarului 0. Sa se scrie in fisier fiecare numar citit in baza 10, 
; in baza 16 si numarul de biti 1 din reprezentarea binara a acestuia.
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
            
            ;scanf(format, nr)
            push dword nr
            push dword format_n
            call [scanf]
            add esp, 2 * 4
            cmp dword[nr], 0
            je afara
            
            ;fprintf(des, format_afisare, nr)
            push dword [nr]
            push dword format_afisare
            push dword [descriptor]
            call [fprintf]
            add esp, 3 * 4
            
            mov eax, [nr]
            ;fprintf(des, format_hexa, eax)
            push eax
            push dword format_hexa
            push dword [descriptor]
            call [fprintf]
            add esp, 4 * 3
            
            mov edx, 0
            mov eax, [nr]
            mov ecx, 32
            numar_biti:
                shr eax, 1
                jnc next
                add edx, 1
                next:
            loop numar_biti
            
            ;fprintf(des, format_biti, edx)
            push edx
            push dword format_biti
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
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
