%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap n: ", 0
    tb2 db "a[%d]: ", 0
    tb3 db "Mang vua nhap la: ", 0
    tb db "%d ",0
    fmt db "%d",0

section .bss
    n resd 1
    arr	resd 100
    
section .text
global CMAIN
CMAIN:
    ;xuat tb1
    push tb1
    call _printf
    add esp,4

    ;Nhap n
    push n
    push fmt
    call _scanf
    add esp,8
    
    mov ebx, 0
    mov ecx, 4

    ;khoi tao mang
    mov ebx, arr ;gan dia chi mang
    mov esi, 0;i = 0
LapNhap:
    ;xuat tb2
    push esi
    push tb2
    call _printf
    add esp,8
    
    ;nhap a[i]
    push ebx
    push fmt
    call _scanf
    add esp, 8
    
    ;tang dia chi mang
    add ebx, 4
    inc esi
    
    cmp esi, [n]
    jl LapNhap
    
    
    ;xuat tb3
    push tb3
    call _printf
    add esp,4

    mov ebx, arr ;gan dia chi mang
    mov esi, 0;i = 0
LapXuat:
    ;nhap a[i]
    push dword[ebx]
    push tb
    call _printf
    add esp, 8
    
    ;tang dia chi mang
    add ebx, 4
    inc esi
    
    cmp esi, [n]
    jl LapXuat
    
    
    
    call _getch
    xor eax, eax
    ret