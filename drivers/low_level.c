unsigned char port_byte_in(unsigned short port) {

    unsigned char result;
    __asm__ ("inb %%dx, %%al": "=a" (result): "d" (port));
    return result;

}

void port_byte_out(unsigned short port, unsigned char data) {

    __asm__("outb %%al, %%dx" : : "a" (data), "d" (port));

}
