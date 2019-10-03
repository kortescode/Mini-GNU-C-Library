[BITS 64]

	section .text

	global memset:function

memset:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
	cmp rcx, rdx
	jnz cpy_char

	jmp end
	
cpy_char:
	mov [rdi + rcx], rsi
	inc rcx
	cmp rcx, rdx
	jnz cpy_char

	jmp end

end:
	mov rax, rdi

	mov rsp, rbp
	pop rbp

	ret
