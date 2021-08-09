%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap a: ", 0
    tb2 db "Nhap b: ", 0
    tb3 db "%d %c %d = %d",0
    menu db 10,"-------- MENU ----------",10,"1. Tong",10,"2. Hieu",10,"3. Tich",10,"4. Thuong",10,"5. Tao lai bai toan", 10,"6. Thoat",10,"-----------------------",10,"Chon: ",0
    fmt db "%d"
section .bss
    a resd 1
    b resd 1
    kq resd 1
    chon resd 1
section .text
global CMAIN
CMAIN: 
nhap:
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
    
xuatmenu:
    ;xuat menu
    push menu
    call _printf
    add esp, 4
    
    ;nhap lua chon
    push chon
    push fmt
    call _scanf
    add esp, 8 
    
    cmp dword[chon],1
    je Tong
    cmp dword[chon],2
    je Hieu
    cmp dword[chon],3
    je Tich
    cmp dword[chon],4
    je Thuong
    cmp dword[chon],5
    je nhap
    cmp dword[chon],6
    je Thoat
    jmp Thoat
    
Tong:
    mov eax, [a]
    add eax, [b]
    mov [kq], eax
    
    ;xuat
    push dword[kq]
    push dword[b]
    push dword '+'
    push dword [a]
    push tb3
    call _printf
    add esp,20
    jmp xuatmenu
Hieu:
    mov eax, [a]
    sub eax, [b]
    mov [kq], eax
    
    ;xuat
    push dword[kq]
    push dword[b]
    push dword '-'
    push dword [a]
    push tb3
    call _printf
    add esp,20
    jmp xuatmenu
Tich:
    mov eax, [a]
    mov ecx, [b]
    mul ecx
    mov [kq], eax
    
    ;xuat
    push dword[kq]
    push dword[b]
    push dword '*'
    push dword [a]
    push tb3
    call _printf
    add esp,20
    jmp xuatmenu
Thuong:
    mov ax, [a]
    mov cl, [b]
    div cl
    mov [kq], al
    
    ;xuat
    push dword[kq]
    push dword[b]
    push dword '/'
    push dword [a]
    push tb3
    call _printf
    add esp,20
    jmp xuatmenu
Thoat:
    call _getch
    xor eax, eax
    ret