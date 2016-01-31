#!/bin/bash

#compile kernel
nasm -f elf32 kernel.asm -o kasm.o
gcc -m32 -c kernel.c -o kc.o
ld -m elf_i386 -T link.ld -o kernel kasm.o kc.o

#run qemu simulator for kernel because forget grub
qemu-system-i386 -kernel kernel
