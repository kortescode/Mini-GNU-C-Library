[BITS 64]

	global main
	extern printf
	
	section .text

my_strlen:
	inc rsi
	cmp byte [rdi + rsi - 1], 0
	jnz my_strlen
	dec rsi
	ret

main:
	push rbp
	mov rbp, rsp

	mov rdi, formatStr
	xor rsi, rsi
	call my_strlen

	mov rdi, msg
	mov rax, 1
	call printf

	mov rsp, rbp
	pop rbp

	mov rax, 60
	xor rdi, rdi
	syscall

	ret
	
	section .rodata
	
	formatStr db 'Hello World',0x0A,0x00
	msg db '%d',0x0A,0x00