bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
       a db 8
       b db 6
       c db 7
;(a+a)-(b+b)-c
segment code use32 class=code
    start:
         mov al,[a];al=a=8
         add al,[a];al=a+a=16
         mov ah,[b];ah=b=6
         add ah,[b];ah=b+b=12
         sub al,ah;al=al-ah=(a+a)-(b+b)=4
         sub al,[c];al=al-c=(a+a)-(b+b)-c=-3
