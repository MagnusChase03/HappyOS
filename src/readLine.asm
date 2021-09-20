; Assume bx is the buffer adress
[org 0x7c00]

readLine:
    pusha

readLineLoop:
    mov dx, [bx]

    mov ah, 0x00
    int 0x16

    cmp al, 0x0d
    je readLineEnd

    mov ah, 0x0e
    int 0x10

    mov [bx], al
    add bx, 0x01

    jmp readLineLoop

readLineEnd:
    popa
    ret