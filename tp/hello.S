[BITS 64]

	global main
	extern printf

	section .text

main:
	push rbp
	mov rbp, rsp

	mov rdi, formatStr
	mov rax, 1
	call printf

	mov rsp, rbp
	pop rbp

	mov rax, 60
	xor rdi, rdi
	syscall

	ret

	section .rodata

	formatStr db 'Hello World!',0Ah,0