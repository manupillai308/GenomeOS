#ifndef _UART_H
#define _UART_H

#include "memory.h"

#define IO_BASE_ADDR P2V(0xFE201000)

#define UART0_DR IO_BASE_ADDR + 0x0
#define UART0_FR IO_BASE_ADDR + 0x18
#define UART0_CR IO_BASE_ADDR + 0x30
#define UART0_LCRH IO_BASE_ADDR + 0x2c
#define UART0_FBRD IO_BASE_ADDR + 0x28
#define UART0_IBRD IO_BASE_ADDR + 0x24
#define UART0_IMSC IO_BASE_ADDR + 0x38
#define UART0_MIS IO_BASE_ADDR + 0x40
#define UART0_ICR IO_BASE_ADDR + 0x44

unsigned char read_char(void);
void write_char(unsigned char c);
void write_string(const char *string);
void init_uart(void);
void uart_handler(void);

#endif

// So a peripheral described in this document as being at legacy address 0x7Enn_nnnn is available in the 35-bit address
// space at 0x4_7Enn_nnnn, and visible to the ARM at 0x0_FEnn_nnnn if Low Peripheral mode is enabled.