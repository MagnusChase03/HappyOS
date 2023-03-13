readKernel:
    mov al, 15
    mov bx, KERNEL_OFFSET
    call readDisk

KERNEL_OFFSET equ 0x1000
