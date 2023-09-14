printx:
    pusha
    mov dx, bx
    mov cx, 0x0

printx_loop:
    cmp cx, 0x04
    je printx_end
    
    mov ax, dx
    and ax, 0x000f
    add ax, 0x30
    cmp ax, 0x39
    jle printx_save
    add ax, 0x09

printx_save:
    mov bx, hex_save + 0x05
    sub bx, cx
    mov [bx], al

    add cx, 0x01
    ror dx, 0x04
    jmp printx_loop

printx_end:
    mov bx, hex_save
    call printf
    popa
    ret

hex_save: db "0x0000", 0