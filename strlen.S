[BITS 64]

	section .text

	global strlen:function

strlen:
	push rbp
	mov rbp, rsp

	xor rsi, rsi
	call count
	
	mov rsp, rbp
	pop rbp

	ret

count:
	inc rsi
	cmp byte [rdi + rsi - 1], 0
	jnz count
	dec rsi
	mov rax, rsi
	ret