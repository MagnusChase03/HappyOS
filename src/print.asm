; Assume bx has string adress
[org 0x7c00]

print:
    pusha

printLoop:
    mov ah, 0x0e
    mov al, [bx]

    cmp al, 0x0
    je printEnd

    int 0x10

    add bx, 0x1
    jmp printLoop

printEnd:
    popa
    ret