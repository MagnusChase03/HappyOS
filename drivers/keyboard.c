#define REG_KEYBOARD_DATA 0x60
#define REG_KEYBOARD_CTRL 0x64

char getKeyPress() {

    int keypressed = port_byte_in(REG_KEYBOARD_DATA);

    switch (keypressed) {

        case 0x10:
            return 'Q';
            break;
        default:
            return '\0';
            break;

    }

}
