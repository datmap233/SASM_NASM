%include "io.inc"
extern _getch
section .data
tb1 db "Nhap chuoi: ", 0
tb2 db "Chuoi vua nhap la: %s", 0
fmt db "%s", 0
section .bss
chuoi resb 30
section .text
global CMAIN
CMAIN:
    push tb1
    call _printf
    add esp, 4
    
    push chuoi
    push fmt
    call _scanf
    add esp, 8
    
    push chuoi
    push tb2
    call _printf
    add esp, 8
    
    call _getch
    xor eax, eax
    ret