call clearScreen

mov bx, helloWorld
call print

call newLine

run:
    mov bx, buffer
    call readLine

    call newLine

    mov bx, buffer
    call print

    call newLine

    mov bx, buffer
    call clearBuffer

    jmp run

helloWorld:
    db 'Hello World!', 0x00

buffer:
    times 16 db 0x0
    db 0x01

%include 'src/print.asm'
%include 'src/clearScreen.asm'
%include 'src/readLine.asm'
%include 'src/newLine.asm'
%include 'src/clearBuffer.asm'

times 510-($-$$) db 0x00
db 0x55, 0xaa