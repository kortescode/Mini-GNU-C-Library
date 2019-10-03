[BITS 64]

	global main
	extern printf
	
	section .text

my_setmem:
	mov [rdi + rcx], rdx
	inc rcx
	cmp rsi, rcx
	jnz my_setmem
	ret

main:
	push rbp
	mov rbp, rsp

	mov rdi, tab
	mov rsi, 5
	mov rdx, 'e'
	xor rcx, rcx
	call my_setmem

	mov rsi, rdi
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

	msg db '%s',0x0A,0x00
	
	section .bss
	
	tab resb 10
	