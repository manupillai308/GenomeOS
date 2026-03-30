aarch64-none-linux-gnu-gcc -c start.s -o start.o
aarch64-none-linux-gnu-gcc -std=c99 -ffreestanding -mgeneral-regs-only -c main.c
aarch64-none-linux-gnu-ld -nostdlib -T link.lds -o test start.o main.o ../lib/lib.a
aarch64-none-linux-gnu-objcopy -O binary test test.bin
mcopy -o -i ../os.img@@32256  test.bin ::