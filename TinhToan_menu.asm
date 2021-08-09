; Nhap vao 2 so a,b. Tinh tong, hieu, tich, thuong a,b.
%include "io.inc"

extern _getch
section .data
    tb1 db "Nhap a: ",0
    tb2 db "Nhap b: ",0
    tb3 db "%d %c %d = %d",0
    menu db 10,"-------- MENU ----------",10,"1. Tong",10,"2. Hieu",10,"3. Tich",10,"4. Thuong",10,"5. Thoat",10,"-----------------------",10,"chon: ",0
    fmt db "%d",0
    tb4 db "Nhap sai chuc nang.",0
    
section .bss
    a resd 1
    b resd 1
    kq resd 1
    chon resd 1

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
Xuatmenu:   
    ;xuat menu
    push menu
    call _printf
    add esp,4
    

    ;Nhap chon
    push chon
    push fmt
    call _scanf
    add esp,8
    
    ; Kiem tra chon
    cmp dword[chon],1
    je Tong
    cmp dword[chon],2
    je Hieu
    cmp dword[chon],3
    je Tich
    cmp dword[chon],4
    je Thuong
    cmp dword[chon],5
    je Thoat
    ;xuat tb5
    push tb4
    call _printf
    add esp,4
 Tong:
 
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
    
    jmp Xuatmenu
 Hieu:
 Tich:
 Thuong:
 Thoat: 
    call _getch
    xor eax, eax
    ret