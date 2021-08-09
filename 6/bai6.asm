%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap ky tu: ", 0
    tb2 db "Ky tu vua nhap la: %s la so", 0
    tb3 db "Ky tu vua nhap la: %s la chu thuong", 0
    tb4 db "Ky tu vua nhap la: %s la chu hoa", 0
    fmt db "%s", 0
section .bss
    kytu resb 0
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
    
    
kiemtraso:
    cmp dword[kytu], '0'
    jnl so
kiemtrathuong:
    cmp dword[kytu], 97
    jnl thuong
kiemtrahoa:
    cmp dword[kytu], 65
    jnl hoa
    jmp thoat
thuong:
    cmp dword[kytu], 122
    jng xuatthuong
    jmp kiemtrahoa
hoa:
    cmp dword[kytu], 90
    jng xuathoa
    jmp thoat
so:
    cmp dword[kytu], '9'
    jng xuatso
    jmp kiemtrathuong
xuatthuong:
    push kytu
    push tb3
    call _printf
    add esp, 8
    jmp thoat
xuathoa:
    push kytu
    push tb4
    call _printf
    add esp, 8
    jmp thoat
xuatso:
    push kytu
    push tb2
    call _printf
    add esp, 8
    jmp thoat
thoat:
    call _getch
    xor eax, eax
    ret