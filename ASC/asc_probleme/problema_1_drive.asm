bits 32 

global start      


extern exit, fscanf, printf, fopen, fclose              
import exit msvcrt.dll
import fscanf msvcrt.dll
import printf msvcrt.dll
import fopen msvcrt.dll
import fclose msvcrt.dll    
                         
segment data use32 class=data
    a db "a.txt", 0
    mesaj db "Propozitia", 0
    mesaj_2 db "Nr cuvinte: ", 0
    mesaj_3 db ", Primul cuvant ", 0
    mesaj_4 db " are", 0
    mesaj_5 db " litere", 10, 13, 0
    format_s db "%s", 0
    format_n db " %d", 0
    mod_a db "r", 0
    des_a dd 0
    caracter db ":", 0
    cuvant times 100 db 0
    nr dd 0
    cuvant_r times 100 db 0
    
; Se da un fisier care contine mai multe propozitii separate de caracterul ".". Sa se numere cate cuvinte are fiecare propozitie. 
; Doar pentru primul cuvant se va numara cate litere are acesta si se va scrie inversat pe ecran.
segment code use32 class=code
    start:
        ;fopen(a.txt, mod_a)
        push dword mod_a
        push dword a
        call [fopen]
        add esp, 2 * 4
        mov [des_a], eax
        cmp eax, 0
        je final
        mov ebx, 0
        
        
        repeta:
        
        mov edx, 0
        add ebx, 1
        mov dword[nr], 0
        mov byte[cuvant_r], 0
        
        ;printf(mesaj)
        push dword mesaj
        call [printf]
        add esp, 4
        
        ;printf(format_n, ebx)
        push ebx
        push dword format_n
        call [printf]
        add esp, 2 * 4
        
        ;printf(caracter)
        push dword caracter
        call [printf]
        add esp, 4
        
        
        citire_cuvinte:
            
            ;fscanf(des_a, format_s, cuvant)
            push dword cuvant
            push dword format_s
            push dword [des_a]
            add esp, 4 * 3
        
            cmp eax, 0
            jmp final
        
            ;printf(format_s, cuvant)
            push dword cuvant
            push dword format_s
            call [printf]
            add esp, 2 * 4
            
            add edx, 1
            mov esi, cuvant
            jmp comparatie_1
            
        citire_cuvinte_2:
            
            ;fscanf(des_a, format_s, cuvant)
            push dword cuvant
            push dword format_s
            push dword [des_a]
            add esp, 4 * 3
        
            cmp eax, 0
            jmp final
        
            ;printf(format_s, cuvant)
            push dword cuvant
            push dword format_s
            call [printf]
            add esp, 2 * 4
            
            add edx, 1
            mov esi, cuvant
            jmp comparatie_2
        
        comparatie_1:
            
            lodsb 
            
            cmp eax, "."
            je propozitie_1
            
            cmp eax, 0
            je continuare
            
            add dword[nr], 1
            jmp comparatie_1
            
            continuare:
                
                mov esi, cuvant
                add esi, [nr]
                mov edi, cuvant_r
                mov ecx, [nr]
                cld
                
                repp:
                    std
                    lodsb
                    cld
                    stosb
                loop repp 

                jmp citire_cuvinte_2
                
        comparatie_2:
            
            lodsb 
            cmp eax, "."
            je propozitie_2
            cmp eax, 0
            je citire_cuvinte_2
            jmp comparatie_2
        
        propozitie_1:
                
                mov esi, cuvant
                add esi, [nr]
                mov edi, cuvant_r
                mov ecx, [nr]
                sub ecx, 1
                cld
                
                repp1:
                    std
                    lodsb
                    cld
                    stosb
                loop repp1 
        
        propozitie_2:
        
                ;printf(mesaj_2)
                push dword mesaj_2
                call [printf]
                add esp, 4
        
                ;printf(format_n, edx)
                push edx 
                push dword format_n
                call [printf]
                add esp, 4 * 2
        
                ;printf(mesaj_3)
                push dword mesaj_3
                call [printf]
                add esp, 4
                
                ;printf(format_s, cuvant_r)
                push dword format_s
                push dword cuvant_r
                call [printf]
                add esp, 4 * 2
                
                ;printf(mesaj_4)
                push dword mesaj_4
                call [printf]
                add esp, 4
                
                ;printf(format_n, nr)
                push dword format_n
                push dword [nr]
                call [printf]
                add esp, 4 * 2
                
                ;printf(mesaj_5)
                push dword mesaj_5
                call [printf]
                add esp, 4
                
                jmp repeta
       
        
        final:
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
        