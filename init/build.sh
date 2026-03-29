aarch64-none-linux-gnu-gcc -c start.s -o start.o
aarch64-none-linux-gnu-gcc -std=c99 -ffreestanding -mgeneral-regs-only -c main.c
aarch64-none-linux-gnu-ld -nostdlib -T link.lds -o init start.o main.o
aarch64-none-linux-gnu-objcopy -O binary init init.bin