%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap ky tu in thuong: ", 0
    tb2 db "Ky tu in hoa la: %s", 0
    fmt dw "%s", 0
section .bss
    kytu resb 0
    kq resb 0
section .text
global CMAIN
CMAIN:
    push tb1
    call _printf
    add esp, 4
    
    push kytu
    push fmt
    call _scanf
    add esp, 8
    
    mov eax, [kytu]
    sub eax,32
    mov [kq],eax
    
    
    push kq
    push tb2
    call _printf
    add esp, 8
    
    call _getch
    xor eax, eax
    ret