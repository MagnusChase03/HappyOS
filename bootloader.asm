[bits 16]
[org 0x7c00]

_start:
    mov bx, Message
    call print

    mov bp, 0x8000 ; Move Stack
    mov sp, bp

    call readKernel
    
    call protectedMode

Message: db "Hello World!", 0

%include "src/print.asm"
%include "src/readDisk.asm"
%include "src/readKernel.asm"
%include "src/protectedMode.asm"

times 510 - ($-$$) db 0
dw 0xaa55
