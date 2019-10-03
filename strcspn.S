[BITS 64]

	section .text

	extern strncmp
	extern _GLOBAL_OFFSET_TABLE_
	
	global strcspn:function

%macro	get_GOT	0
	call %%getgot
%%getgot:
	pop rbx
	add rbx, _GLOBAL_OFFSET_TABLE_+$$-%%getgot wrt ..gotpc
%endmacro
	
strcspn:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
	mov r9, rsi
	call search
	
	mov rsp, rbp
	pop rbp

	ret

search:
	cmp byte [rdi], 0
	jz ret_len
	cmp byte [rsi], 0
	jz init

	push rdi
	push rsi
	push rcx
	mov rdx, 1
	call strncmp wrt ..plt
	pop rcx
	pop rsi
	pop rdi

	inc rsi
	
	cmp rax, 0
	jnz search
	jmp ret_len

init:
	mov rsi, r9
	inc rdi
	inc rcx
	jmp search

ret_len:
	mov rax, rcx
	ret