; Nhap vao 2 so a,b. Tinh tong, hieu, tich, thuong a,b.
%include "io.inc"

extern _getch
section .data
    tb1 db "Nhap a: ",0
    tb2 db "Nhap b: ",0
    tb3 db "%d %c %d = %d",0
    fmt db "%d",0
    
section .bss
    a resd 1
    b resd 1
    kq resd 1

section .text
global CMAIN
CMAIN:
    ;write your code here
    ;xuat tb1
    push tb1
    call _printf
    add esp,4
    
    ;Nhap a
    ; a --> dia chi bien a, dword[a]: gia tri (4 byte) cua bien a 
    push a
    push fmt
    call _scanf
    add esp,8
    
     ;xuat tb2
    push tb2
    call _printf
    add esp,4
    
     ;Nhap b
    push b
    push fmt
    call _scanf
    add esp,8
    
    ; Tinh tong
    mov eax,[a]; eax = a
    add eax,[b]; eax = eax + b
    ; gan kq = eax
    mov [kq],eax
    ;xuat kq
    
    push dword[kq]
    push dword[b]
    push dword '+'
    push dword [a]
    push tb3
    call _printf
    add esp,20
    
    call _getch
    xor eax, eax
    ret