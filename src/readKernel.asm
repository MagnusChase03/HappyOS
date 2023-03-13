readKernel:
    mov al, 20
    mov bx, KERNEL_OFFSET
    call readDisk

KERNEL_OFFSET equ 0x1000
