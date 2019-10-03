[BITS 64]

	section .text

	global strchr:function
	
strchr:
	push rbp
	mov rbp, rsp
	
	call search
	
	mov rsp, rbp
	pop rbp

	ret

search:
	xor rax, rax
	mov al, byte [rdi]

	cmp al, 0
	jz ret_null

	inc rdi
	
	cmp rax, rsi
	jnz search
	dec rdi
	mov rax, rdi
	ret
	
ret_null:
	xor rax, rax
	ret