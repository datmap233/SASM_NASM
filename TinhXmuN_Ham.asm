;Tinh a^n
%include "io.inc"
extern _printf
extern _scanf
extern _getch


section .data
    tb1 db "Nhap a: ",0
    tb2 db "Nhap n: ",0
    fmt db "%d",0
    tb3 db "%d ^ %d = %d"

section .bss
    a resd 1
    n resd 1
    kq resd 1
    
section .text
global CMAIN
CMAIN:
    ;write your code here
    ;xuat tb1
    push dword tb1
    call _printf
    add esp,4
    
    
    ;Nhap a
    push dword a
    push dword fmt
    call _scanf
    add esp,8
    
     ;xuat tb2
    push dword tb2
    call _printf
    add esp,4
    
    
    ;Nhap n
    push dword n
    push dword fmt
    call _scanf
    add esp,8
    
    ;truyen tham so
    push dword [n]
    push dword [a]
    ;Goi ham
    call _TinhMu
    add esp,8
    
    ;Luu kq tra ve
    mov dword [kq], eax
 
    ; Xuat tb2
    push dword [kq]
    push dword [n]
    push dword [a]
    push dword tb3
    call _printf
    add esp,16
    
        
    
    
    call _getch
    xor eax, eax
    ret
;============================================
;Dau thu tuc
global _TinhMu
_TinhMu:
    ;backup ebp
    push ebp
    mov ebp, esp; su dung stack lam vung nho co so
    ;Khai bao kich thuoc stack
    sub esp,64
    ;Backup thanh ghi neu can
    ;Lay tham so thu nhat
    mov ebx,dword [ebp + 8]; lay a
    mov ecx,dword [ebp + 12]; lay n
    
;Than thu tuc
    
    ;Khoi tao vong lap
    mov eax,1 ; T =1 
_TinhMu.Lap:
    ;eax = eax * a
    mul ebx
    Loop _TinhMu.Lap
    
    
;Cuoi thu tuc
    ;Restore thanh ghi neu co
    ;Xoa stack
    add esp,64
    ;Khoi phuc ebp
    pop ebp
    ;Tra ve
    ret
    
    
    

