call clearScreen

mov bx, helloWorld
call print

call newLine

mov bx, buffer
call readLine

call newLine

mov bx, buffer
call print

jmp $

helloWorld:
    db 'Hello World!', 0x00

buffer:
    times 8 db 0x01
    db 0x00

%include 'src/print.asm'
%include 'src/clearScreen.asm'
%include 'src/readLine.asm'
%include 'src/newLine.asm'

times 510-($-$$) db 0x00
db 0x55, 0xaa