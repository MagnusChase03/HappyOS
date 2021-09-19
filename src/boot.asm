call clearScreen

mov bx, helloWorld
call print

jmp $

helloWorld:
    db 'Hello World!', 0

%include 'src/print.asm'
%include 'src/clearScreen.asm'

times 510-($-$$) db 0x0
db 0x55, 0xaa