%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap n: ", 0
    tb2 db "Tong la: %d", 0
    fmt db "%d",0

section .bss
    n resd 1
    kq resd 1
section .text
global CMAIN
CMAIN:
    ;xuat tb1
    push dword tb1
    call _printf
    add esp,4

    ;Nhap n
    push dword n
    push dword fmt
    call _scanf
    add esp,8
    
    mov eax, 0
    mov ecx, 1
Tong:
    add eax, ecx
    inc ecx
    cmp ecx, [n]
    jle Tong
    
    mov dword[kq], eax
    
    push dword[kq]
    push dword tb2
    call _printf
    add esp,8
    
    call _getch
    xor eax, eax
    ret