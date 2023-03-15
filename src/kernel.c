void main() {
    
    //char* videoMem = (char*) 0xb8000;
    //*videoMem = 'X';

    clearScreen();
    print("Welcome to\nHappyOS");

    while (1 == 1) {
        
        char keypressed = getKeyPress();
        printCharacter(keypressed, 0);

    }


}
