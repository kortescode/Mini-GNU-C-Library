[BITS 64]

	global main
	extern printf
	
	section .text

init:
	mov [rdi + rsi], rdx
	inc rsi
	cmp rsi, 4096
	jnz init
	ret

loop:
	mov rdi, tab
	xor rsi, rsi
	xor rdx, rdx
	call init
	
	mov rax, 0
	mov rdi, 0
	mov rsi, tab
	mov rdx, 4096
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, tab
	mov rdx, 4096
	syscall

	jmp loop
	
main:
	push rbp
	mov rbp, rsp

	call loop

	mov rsp, rbp
	pop rbp

	mov rax, 60
	xor rdi, rdi
	syscall

	ret

	section .bss
	
	tab resb 4096