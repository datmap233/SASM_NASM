%include "io.inc"
extern _getch
section .data
    tb db "Hello world",0
section .text
global CMAIN
CMAIN:
    ;write your code here
    
    ;printf("Hello world");
    push tb
    call _printf
    add esp,4 ;xoa stack
    
    ; dung man hinh
    call _getch
    xor eax, eax
    ret