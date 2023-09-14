printf:
    pusha
    mov ah, 0x0e

printf_loop:
    mov al, [bx]
    cmp al, 0x0
    je printf_end
    int 0x10
    add bx, 0x1
    jmp printf_loop

printf_end:
    call printf_new_line
    popa
    ret

printf_new_line:
    pusha
    mov ah, 0x0e
    mov al, 0x0A
    int 0x10
    mov ah, 0x0e
    mov al, 0x0D
    int 0x10
    popa
    ret