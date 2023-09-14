[bits 16]
[org 0x7c00]

mov bx, message
call printf

mov bx, 0x1234
call printx

jmp $

%include "./src/rm/io/printf.asm"
%include "./src/rm/io/printx.asm"

message: db "Init HappyOS...", 0

times 510 - ($ - $$) db 0
dw 0xaa55