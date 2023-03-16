#define REG_KEYBOARD_DATA 0x60
#define REG_KEYBOARD_CTRL 0x64

char getKeyPress() {

    int keypressed = port_byte_in(REG_KEYBOARD_DATA);

    switch (keypressed) {

        case 0x10:
            return 'Q';
        case 0x11:
            return 'W';
        default:
            return '\0';

    }

}

void displayKey() {

    char key = getKeyPress();
    if (key != '\0') {

        int offset = getCursor();
        printCharacter(key, offset);
        setCursor(offset + 2);

    }

}
