#include "uart.h"
#include "print.h"
#include "debug.h"
#include "lib.h"
#include "handler.h"
#include "memory.h"
#include "file.h"
#include "process.h"
#include "stddef.h"
#include "syscall.h"

void KMain(void)
{
    init_uart();
    printk("Hello, raspeberry pi\r\n");
    printk("We are at EL %u\r\n", (uint64_t)get_el());
    
    init_memory();
    init_fs();
    init_system_call();
    init_timer();
    init_interrupt_controller();
    enable_irq();
    init_process();
}