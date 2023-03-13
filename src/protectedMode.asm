protectedMode:
    cli
    lgdt [gdt_descriptor]

    mov eax, cr0
    or eax, 0x1
    mov cr0, eax

    jmp CODE_SEG:_startProtectedMode

gdt_start:
    dd 0x0
    dd 0x0

gdt_code:
    dw 0xffff ; limit
    dw 0x0 ; base
    db 0x0 ; base
    db 0b10011010 ; flags
    db 0b11001111 ; flags, limit
    db 0x0 ; base

gdt_data:
    dw 0xffff ; limit
    dw 0x0 ; base
    db 0x0 ; base
    db 0b10010010 ; flags
    db 0b11001111 ; flags, limit
    db 0x0 ; base

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start

[bits 32]

_startProtectedMode:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    
    mov ebp, 0x90000
    mov esp, ebp

    call KERNEL_OFFSET

    jmp $
