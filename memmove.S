[BITS 64]

	section .text

	extern malloc
	extern free
	extern memcpy
	extern _GLOBAL_OFFSET_TABLE_
	
	global memmove:function

%macro	get_GOT	0
	call %%getgot
%%getgot:
	pop rbx
	add rbx, _GLOBAL_OFFSET_TABLE_+$$-%%getgot wrt ..gotpc
%endmacro
	
memmove:
	push rbp
	mov rbp, rsp

	push rdi
	push rdx
	push rsi
	mov rdi, rdx
	call malloc wrt ..plt
	pop rsi
	pop rdx
	mov rdi, rax
	call memcpy wrt ..plt
	mov rsi, rax
	pop rdi
	
	xor rcx, rcx
	cmp rcx, rdx
	jnz cpy_char

	jmp end
	
cpy_char:
	xor rax, rax
	mov al, byte [rsi + rcx]
	mov [rdi + rcx], al
	inc rcx
	cmp rcx, rdx
	jnz cpy_char

	jmp end

end:
	mov rax, rdi

	mov rdi, rsi
	call free wrt ..plt

	mov rsp, rbp
	pop rbp

	ret
