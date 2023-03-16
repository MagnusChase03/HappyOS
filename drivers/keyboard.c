#define REG_KEYBOARD_DATA 0x60
#define REG_KEYBOARD_CTRL 0x64

char keys[58] = {'\0', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=', '\0', '\0', 'q', 'w', 'e', 'r', 't', 'y',
                    'u', 'i', 'o', 'p', '[', ']', '\n', '\0', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', '`', '\0',
                    '\\', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', '\0', '\0', '\0', ' '};

char getKeyPress() {

    int keypressed = port_byte_in(REG_KEYBOARD_DATA);

    if (keypressed <= 0x39) {

        return keys[keypressed];

    } else {

        return '\0';

    }

}

void displayKey() {

    char key = getKeyPress();
    if (key != '\0') {

        int offset = getCursor();
        printCharacter(key, offset);

    }

}
