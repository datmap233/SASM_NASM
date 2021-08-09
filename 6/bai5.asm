%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap so thu nhat: ", 0
    tb2 db "Nhap so thu hai: ", 0
    tb3 db "So lon hon la: %d",0
    tb4 db "Hai so bang nhau", 0
    fmt db "%d"
section .bss
    a resd 1
    b resd 1
section .text
global CMAIN
CMAIN: 
    ;nhap a
    push tb1
    call _printf
    add esp, 4
    
    push a
    push fmt
    call _scanf
    add esp, 8
    
    ;nhap b
    push tb2
    call _printf
    add esp, 4
    
    push b
    push fmt
    call _scanf
    add esp, 8
    
    mov al, [a]
    mov dl, [b]
    
    cmp al, dl
    jl be
    cmp al, dl
    jg lon
    cmp al, dl
    je bang
    
be:
    push dword[b]
    push tb3
    call _printf
    add esp, 8
    jmp thoat
lon:
    push dword[a]
    push tb3
    call _printf
    add esp, 8
    jmp thoat
bang:
    push tb4
    call _printf
    add esp, 4
    jmp thoat
thoat:
    call _getch
    xor eax, eax
    ret