#ifndef _LIB_H
#define _LIB_H

#include "stdint.h"

int printf(const char *format, ...);
int writeu(const char *buffer, int size);
int sleepu(uint64_t ticks);
int open_file(char *name);
void close_file(int fd);
int get_file_size(int fd);
int read_file(int fd, void *buffer, uint32_t size);
int fork(void);
void waitu(int pid);

#endif