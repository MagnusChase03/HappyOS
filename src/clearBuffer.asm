; Assume bx is the adress of buffer
[org 0x7c00]

clearBuffer:
    pusha

clearBufferLoop:
    mov cl, [bx]

    cmp cl, 0x01
    je clearBufferEnd

    mov cl, 0x00
    mov [bx], cl
    add bx, 0x01

    jmp clearBufferLoop

clearBufferEnd:
    popa
    ret
