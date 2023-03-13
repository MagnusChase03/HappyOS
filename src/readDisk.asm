readDisk:
    pusha

    mov ah, 0x2
    mov dl, 0x0 ; Disk 0
    mov ch, 0x0 ; Cylinder 0
    mov dh, 0x0 ; Track 0
    mov cl, 0x2 ; Sector 2

    int 0x13

    popa
    ret
