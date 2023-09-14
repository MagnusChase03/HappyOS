# Real Mode

*The initial mode that BIOS starts our bootloader in.*

## Table of Contents

- [Files](#files)
- [How It Works](#how-it-works)

## Files
```
bootloader.asm
io/
    printf.asm
    printx.asm
```

**bootloader.asm**

Responsible for loading and executing the kernel, and is responsible for starting 32bit protected mode.

**io/printf.asm**

*Prints a string followed by a new line.*

Args:
-   `bx`: A pointer to the string to print

**io/printx.asm**

*Prints a string representation of a hex value.*

Args:
-   `bx`: The hex value to print

## How it works

- BIOS loads boot sector with our bootloader
- Bootloader loads in kernel
- Bootloader starts 32bit protected mode
- Bootloader jumps to kernel