mov bx, helloWorld
call print

jmp $ ; loop f  orever

helloWorld:
    db 'Hello World!', 0

%include 'src/print.asm'

times 510-($-$$) db 0x0 ; tells bios this is the end of boot sector
db 0x55, 0xaa