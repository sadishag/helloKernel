bits 32
section	.text
					;multibood spec
	align 4
	dd 0x1BADB002	
	dd 0x00				;flags set to 0
	dd - (0x1BADB002 + 0x00) 	;checksum 

global start
extern kernel_main 			;written in c file

start:
	cli 				;blocks interrupts 
	mov esp, stack_space 		;set the stack pointer
	call kernel_main		
	hlt				;halt CPU

section .bss
resb 8192				;8KB allocated for stack
stack_space:
