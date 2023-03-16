[extern idt]
[extern isr1Handler]

global isr1
global loadIdt

idtDesc:
    dw 2048
    dd idt

isr1:
    pushad

    call isr1Handler

    popad
    iretd

loadIdt:
    lidt [idtDesc]
    sti
    ret
