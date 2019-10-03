[BITS 64]

	global main
	
	section .text

print_hello:
	mov rax, 01
	mov rdi, 1
	mov rsi, formatStr
	mov rdx, formatSize
	syscall

	ret
	
main:
	push rbp
	mov rbp, rsp

	call print_hello

	mov rsp, rbp
	pop rbp

	mov rax, 60
	xor rdi, rdi
	syscall

	ret
	
	section .rodata
	
	formatStr db 'Hello World!',0x0A,0x00
	formatSize equ $ - formatStr