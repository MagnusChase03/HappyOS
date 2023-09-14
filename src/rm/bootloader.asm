[bits 16] ; 16 bit real mode
[org 0x7c00] ; Data offset in bootsector

mov bx, bootloader_start_msg
call printf

mov bx, 0x1234
call printx

jmp $

%include "./src/rm/io/printf.asm"
%include "./src/rm/io/printx.asm"

bootloader_start_msg: db "Init HappyOS...", 0

; Allocated 512 bytes for boot sector ending in magic numbers 0x55 0xAA
times 510 - ($ - $$) db 0 
dw 0xaa55 