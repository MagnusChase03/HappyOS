call clearScreen

mov bx, helloWorld
call print

mov bx, buffer
call readLine

jmp $

helloWorld:
    db 'Hello World!', 0

buffer:
    times 8 db 0x1
    db 0x0

%include 'src/print.asm'
%include 'src/clearScreen.asm'
%include 'src/readLine.asm'

times 510-($-$$) db 0x0
db 0x55, 0xaa