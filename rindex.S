[BITS 64]

	section .text

	extern strlen
	extern _GLOBAL_OFFSET_TABLE_
	
	global rindex:function

%macro	get_GOT	0
	call %%getgot
%%getgot:
	pop rbx
	add rbx, _GLOBAL_OFFSET_TABLE_+$$-%%getgot wrt ..gotpc
%endmacro
	
rindex:
	push rbp
	mov rbp, rsp

	push rsi
	call strlen wrt ..plt
	pop rsi
	mov rcx, rax
	dec rcx
	
	call search
	
	mov rsp, rbp
	pop rbp

	ret

search:
	cmp rcx, 0
	jl ret_null
	
	xor rax, rax
	mov al, byte [rdi + rcx]

	dec rcx
	
	cmp rax, rsi
	jnz search
	inc rcx
	add rdi, rcx
	mov rax, rdi
	ret	
	
ret_null:
	xor rax, rax
	ret