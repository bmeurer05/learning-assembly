# Assembly Playground

A personal repository for learning and practicing **x86-64 Assembly** using NASM on Linux.

## About

This repository contains exercises, experiments, and small programs developed throughout my journey of learning Assembly language.

The main goal is to understand how computers work at a lower level, including registers, memory management, instructions, and system calls.

## Technologies

- **Architecture:** x86-64
- **Assembler:** NASM
- **Operating System:** Linux
- **Linker:** GNU ld

## Building and Running

Assemble the source code:

```bash
nasm -f elf64 program.asm -o program.o
```

Link the object file:

```bash
ld program.o -o program
```

Run the executable:

```bash
./program
```

## Topics

- Registers and basic instructions
- Arithmetic operations
- Comparisons and conditional jumps
- Loops
- Memory and data sections
- Linux system calls

## License

This project is licensed under the MIT License.

---

*Learning one instruction at a time.*
