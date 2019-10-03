[BITS 64]

	section .text

	extern strncmp
	extern _GLOBAL_OFFSET_TABLE_
	
	global strpbrk:function

%macro	get_GOT	0
	call %%getgot
%%getgot:
	pop rbx
	add rbx, _GLOBAL_OFFSET_TABLE_+$$-%%getgot wrt ..gotpc
%endmacro
	
strpbrk:
	push rbp
	mov rbp, rsp

	mov r9, rdi
	call search
	
	mov rsp, rbp
	pop rbp

	ret

search:
	cmp byte [rsi], 0
	jz ret_null
	cmp byte [rdi], 0
	jz init

	push rdi
	push rsi
	mov rdx, 1
	call strncmp wrt ..plt
	pop rsi
	pop rdi

	inc rdi
	
	cmp rax, 0
	jnz search
	dec rdi
	mov rax, rdi
	ret

init:
	mov rdi, r9
	inc rsi
	jmp search

ret_null:
	xor rax, rax
	ret