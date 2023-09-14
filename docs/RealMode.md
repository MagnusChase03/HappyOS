# Real Mode

## Files
- bootloader.asm
- io
    - printf.asm
    - printx.asm

**bootloader.asm**

*Used to bootstap the kernel*

**io/printf.asm**

*Prints a string to the screen followed by a new line*

Args:

- bx: Pointer to string

**io/print.asm**

Prints the string of a hex value

Args:
- bx: Hex value