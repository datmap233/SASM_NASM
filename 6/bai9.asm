%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap chuoi ky tu: ", 0
    tb2 db "Chuoi nguoc la: ", 0
section .bss
    str1 resb 30
    str2 resb 30
section .text
global CMAIN
CMAIN:
    
    push tb1
    call _printf
    add esp, 4
    
    GET_STRING str1, 30
    
    mov ebx, str1
    mov esi, 0
    
GET_STRLEN:
    inc ebx
    inc esi
    cmp byte[ebx], 0
    jne GET_STRLEN
    
    mov ebx, str1
    mov edx, str2
    
REVERSE:
    mov eax, [ebx + esi - 2]
    mov [edx],eax
    
    dec esi
    inc edx
    
    cmp esi, 0
    jne REVERSE
    
    
    
    push tb2
    call _printf
    add esp, 4
    
    mov edx, str2
    
    push edx
    call _printf
    add esp, 4
    
    call _getch
    xor eax, eax
    ret