# GenomeOS

GenomeOS is a small operating system built from scratch for learning how a
kernel works.

The current version targets AArch64 on the Raspberry Pi 4. It includes virtual
memory, processes, system calls, interrupts, a filesystem, and a small
userspace. The code is intentionally compact so the path from boot assembly to
a userspace program can be followed without a large framework.

The long-term goal is to port GenomeOS to RISC-V and boot it on the custom
[RISC-V FPGA SoC](../cpu) being developed alongside this project.

> GenomeOS is a learning project, not a production operating system.

## Features

### Kernel

- [x] AArch64 boot code and EL2 to EL1 transition
- [x] Higher-half kernel mapping
- [x] Exception vector table and trap handling
- [x] Physical page allocator
- [x] Kernel and user virtual memory
- [x] Per-process address spaces
- [x] Timer-driven round-robin scheduler
- [x] Process sleep and wake-up
- [x] `fork`, `exec`, `wait`, and `exit`
- [x] System-call interface

### Filesystem and Userspace

- [x] Embedded FAT filesystem image
- [x] Read-only file access
- [x] Per-process file descriptors
- [x] Init process
- [x] Interactive shell
- [x] `ls` and test programs
- [x] Small userspace library and syscall wrappers

### Devices and Interrupts

- [x] PL011 UART output
- [x] Interrupt-driven UART input
- [x] Buffered console input
- [x] ARM interrupt-controller setup
- [x] System timer interrupts

## Development Environment

The project uses the `aarch64-none-linux-gnu` cross-toolchain. The included
Dockerfile provides the expected Ubuntu environment, cross-toolchain, and FAT
filesystem utilities.

Before building the image, place the Arm GNU Toolchain archive named in the
Dockerfile at the repository root. The build also expects an `os.img` FAT disk
image. These large external files are not stored in the repository.

```sh
# Build the development image
docker build -t genomeos-aarch64 .

# Open a build shell with the repository mounted at /work
docker run --rm -it -v "$PWD:/work" -w /work genomeos-aarch64 bash
```

## Building

Build the userspace library first, followed by the programs that are installed
into `os.img`:

```sh
cd lib && bash build.sh
cd ../init && bash build.sh
cd ../console && bash build.sh
cd ../ls && bash build.sh
cd ../test && bash build.sh
cd ..
```

Then build the kernel:

```sh
bash build.sh
```

The build produces `kernel8.img`. The filesystem image is embedded into the
kernel by `fsimg.s`.

## Repository Layout

```text
boot.s             AArch64 entry point and exception-level transition
mmu.s              Initial translation tables and MMU setup
handler.s/.c       Exception entry and interrupt handling
memory.c           Page allocation and virtual memory
process.c          Processes, scheduling, and context switching
syscall.c          Kernel system-call implementations
file.c             FAT filesystem and file descriptors
uart.c             PL011 UART driver
keyboard.c         Buffered console input
lib/               Userspace library and syscall wrappers
init/              First userspace process
console/           Interactive shell
ls/                Directory-listing program
test/              Small userspace test program
```

## System Overview

```text
Boot at EL2
    |
    v
Kernel at EL1
    |-- virtual memory and page allocator
    |-- exception and interrupt handling
    |-- scheduler and process management
    |-- system calls
    |-- FAT filesystem
    `-- UART and timer drivers
            |
            v
Userspace at EL0
    |-- init
    `-- shell -> ls / test / other programs
```

## Pending Work

- [ ] Make the build and filesystem-image flow reproducible
- [ ] Add automated kernel and userspace tests
- [ ] Improve filesystem and process robustness
- [ ] Separate architecture-specific code from the kernel core
- [ ] Port the architecture layer and userspace ABI to RISC-V
- [ ] Add drivers for the custom RISC-V SoC
- [ ] Boot GenomeOS on the FPGA SoC
