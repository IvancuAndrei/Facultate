bits 32 ; assembling for the 32 bits architecture


global _dublare        


segment code use32 class=code
    _dublare:
        push ebp
        mov ebp, esp
        
        mov eax, [esp + 8]
        add eax, eax
        
        mov esp, ebp
        pop ebp
        ret 