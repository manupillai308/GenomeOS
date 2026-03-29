aarch64-none-linux-gnu-gcc -c syscall.s -o syscall.o
aarch64-none-linux-gnu-gcc -std=c99 -ffreestanding -mgeneral-regs-only -c print.c
aarch64-none-linux-gnu-ar rcs lib.a print.o syscall.o