[BITS 64]

	section .text

	extern strlen
	extern strncmp
	extern _GLOBAL_OFFSET_TABLE_
	
	global strstr:function

%macro	get_GOT	0
	call %%getgot
%%getgot:
	pop rbx
	add rbx, _GLOBAL_OFFSET_TABLE_+$$-%%getgot wrt ..gotpc
%endmacro
	
strstr:
	push rbp
	mov rbp, rsp

	push rdi
	push rsi
	mov rdi, rsi
	call strlen wrt ..plt
	pop rsi
	pop rdi
	mov r8, rax

	call search

	mov rsp, rbp
	pop rbp

	ret

search:
	cmp byte [rdi], 0
	jz ret_null

	push rdi
	push rsi
	push rcx
	push r8
	mov rdx, r8
	call strncmp wrt ..plt
	pop r8
	pop rcx
	pop rsi
	pop rdi

	inc rdi
	
	cmp rax, 0
	jnz search
	dec rdi
	mov rax, rdi
	ret

ret_null:
	xor rax, rax
	ret