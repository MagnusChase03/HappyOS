clearScreen:
    pusha
    
    mov ah, 0x0
    mov al, 0x3
    int 0x10

    popa
    ret