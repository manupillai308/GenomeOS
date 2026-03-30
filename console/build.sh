aarch64-none-linux-gnu-gcc -c start.s -o start.o
aarch64-none-linux-gnu-gcc -std=c99 -ffreestanding -mgeneral-regs-only -c main.c
aarch64-none-linux-gnu-ld -nostdlib -T link.lds -o console start.o main.o ../lib/lib.a
aarch64-none-linux-gnu-objcopy -O binary console console.bin
mcopy -o -i ../os.img@@32256  console.bin ::