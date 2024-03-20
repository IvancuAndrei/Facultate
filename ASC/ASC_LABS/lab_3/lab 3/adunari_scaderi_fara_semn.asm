bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; a - byte, b - word, c - double word, d - qword - Interpretare fara semn
      a db 5
      b dw 20
      c dd 25
      d dq 8

; (c-a-d)+(c-b)-a 
segment code use32 class=code
    start:
        mov eax, [c]; eax = c = 25
        mov ebx, 0; ebx = 0
        mov bl, [a]; bl = a = 12 -> ebx = a = 5
        sub eax, ebx; eax = eax - ebx = c - a = 20
        mov edx, 0; (conversie fara semn de la eax la edx:eax) edx:eax = c - a = 20
        sub eax, dword[d]
        sbb edx, dword[d+4]; edx:eax = c - a - d = 12
        ;eax,edx,ebx folosite
        mov ebx, 0
        mov ebx, [c]; ebx = c = 25
        mov ecx, 0; ecx = 0
        mov cx, [b]; cx = b = 20
        sub ebx, ecx; ebx = ebx - ecx = c - b = 5
        mov ecx, 0; (conversie fara semn de la ebx la ecx:ebx) ecx:ebx = c - b = 5
        add eax, ebx
        adc edx, ecx; edx:eax = edx:eax + ebx:ecx = (c - a - d) + (c - b) = 17
        ;eax, ebx, ecx, edx folosite
        mov ebx, 0
        mov bl, [a]; bl = a = 12 -> ebx = a = 5
        mov ecx, 0; (conversie fara semn de la ebx la ecx:ebx) ecx:ebx = 5
        sub eax, ebx
        sbb edx, ecx; edx:eax = (c - a - d) + (c - b) - a = 12
        
        
        
        
        
        
        push    dword 0      
        call    [exit]       
