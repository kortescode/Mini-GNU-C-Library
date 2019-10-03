[BITS 64]

	section .text

	global memcpy:function

memcpy:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
	cmp rcx, rdx
	jnz cpy_char

	jmp end
	
cpy_char:
	mov al, byte [rsi + rcx]
	mov [rdi + rcx], al
	inc rcx
	cmp rcx, rdx
	jnz cpy_char

	jmp end

end:
	mov rax, rdi

	mov rsp, rbp
	pop rbp

	ret
