printx:
    pusha
    mov dx, bx ; Save hex to dx need bx for indexing memory
    mov cx, 0x0 ; Coutnter

printx_loop:
    cmp cx, 0x04 ; Exit when we set 4 hex values
    je printx_end
    
    mov ax, dx ; Load the hex value
    and ax, 0x000f ; Mask to get last hex
    add ax, 0x30 ; Add 0x30 to get number
    cmp ax, 0x39 ; If < 9 save to string
    jle printx_save
    add ax, 0x09 ; Add to start getting alpha character

printx_save:
    mov bx, hex_save + 0x05 ; Save ascii from the end
    sub bx, cx
    mov [bx], al

    add cx, 0x01 ; Add counter
    ror dx, 0x04 ; Rotate to next hex
    jmp printx_loop

printx_end:
    mov bx, hex_save ; Print hex string
    call printf
    popa
    ret

hex_save: db "0x0000", 0