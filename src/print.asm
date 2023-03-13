print:
    pusha

printLoop:
    mov ah, 0x0e
    mov al, [bx] ; move in character at pointer
    cmp al, 0x0 ; zero terminalted exit
    je printEnd
    int 0x10
    add bx, 0x1 ; get next character
    jmp printLoop
    
printEnd:
    popa
    ret
