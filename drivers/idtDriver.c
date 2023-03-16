#define PIC_DATA 0x21
#define PIC_DATA2 0xa1
#define PIC_CTRL 0x20
#define PIC_CTRL2 0xa0

#define ICW1_INIT 0x10
#define ICW1_ICW4 0x01

#define ICW4_x86 0x01

extern void loadIdt();

struct idtGate {

    unsigned short offsetLow;
    unsigned short selector;
    unsigned char zero;
    unsigned char flags;
    unsigned short offsetHigh;

};

struct idtGate idt[256];
extern unsigned int isr1;
unsigned int isr1Base;

void initIdt() {

    isr1Base = &isr1;

    idt[1].offsetLow = (isr1Base & 0xffff);
    idt[1].offsetHigh = (isr1Base & 0xffff0000) >> 16;
    idt[1].selector = 0x08;
    idt[1].flags = 0x8e;
    idt[1].zero = 0;

    remapPIC();

    port_byte_out(PIC_DATA, 0xfd); // 0xfd?
    port_byte_out(PIC_DATA2, 0xff);

    loadIdt();

}

void remapPIC() {

    unsigned char a;
    unsigned char b;

    a = port_byte_in(PIC_DATA);
    b = port_byte_in(PIC_DATA2);

    port_byte_out(PIC_CTRL, ICW1_INIT | ICW1_ICW4);
    port_byte_out(PIC_CTRL2, ICW1_INIT | ICW1_ICW4);
    
    port_byte_out(PIC_DATA, 0);
    port_byte_out(PIC_DATA2, 8);

    port_byte_out(PIC_DATA, 4);
    port_byte_out(PIC_DATA2, 2);

    port_byte_out(PIC_DATA, ICW4_x86);
    port_byte_out(PIC_DATA2, ICW4_x86);

    port_byte_out(PIC_DATA, a);
    port_byte_out(PIC_DATA2, b);

}

void isr1Handler() {

    displayKey();
    
    port_byte_out(PIC_CTRL, 0x20);
    port_byte_out(PIC_CTRL2, 0x20);

}
