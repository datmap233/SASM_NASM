%include "io.inc"
extern _getch

section .data
    tb1 db "Nhap Ten: ",0
    tb2 db "Xin chao %s",0
    fmt db "%s",0
section .bss
    ten resb 30
    
section .text
global CMAIN
CMAIN:
    ;write your code here
    
    ; Xuat tb1
    push tb1
    call _printf
    add esp,4
    
    
    ;Nhap ten
    ;scanf("%s",&ten)
    push ten
    push fmt
    call _scanf
    add esp,8
    
    ; xuat tb2
    ;printf("Xin chao %s",ten);
    push ten
    push tb2
    call _printf
    add esp,8
    
    call _getch
    
    
    xor eax, eax
    ret