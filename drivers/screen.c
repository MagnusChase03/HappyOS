#define VIDEO_MEM 0xb8000
#define MAX_ROWS 140
#define MAX_COLS 70
#define WHITE_ON_BLACK 0x0f

#define REG_SCREEN_CTRL 0x3d4
#define REG_SCREEN_DATA 0x3d5

void print(char* str) {

    for (int i = 0; str[i] != 0; i++) {

        int offset = getCursor();
        if (str[i] == '\n') {

            setCursor(offset + (MAX_COLS * 2));

        } else {

            printCharacter(str[i], offset);
            setCursor(offset + 2);

        }

    }

}

void clearScreen() {

    for (int i = 0; i < MAX_ROWS; i++) {

        for (int j = 0; j < MAX_COLS; j++) {

            printCharacter(' ', getOffset(j, i));

        }

    }
    setCursor(0);

}

void printCharacter(char character, int offset) {

    ((char*) VIDEO_MEM)[offset] = character;

}

int getOffset(int col, int row) {

    return 2 * (row * MAX_COLS + col);

}

int getCursor() {

    port_byte_out(REG_SCREEN_CTRL, 14);
    int offset = port_byte_in(REG_SCREEN_DATA) << 8;    
    port_byte_out(REG_SCREEN_CTRL, 15);
    offset += port_byte_in(REG_SCREEN_DATA);

    return offset * 2;

}

void setCursor(int offset) {

    offset /= 2;

    port_byte_out(REG_SCREEN_CTRL, 14);
    port_byte_out(REG_SCREEN_DATA, (unsigned char)(offset >> 8));
    port_byte_out(REG_SCREEN_CTRL, 15);
    port_byte_out(REG_SCREEN_DATA, (unsigned char)(offset));

}
