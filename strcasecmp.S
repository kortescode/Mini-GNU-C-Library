[BITS 64]

	section .text

	extern strcmp
	extern _GLOBAL_OFFSET_TABLE_
	
	global strcasecmp:function

%macro	get_GOT	0
	call %%getgot
%%getgot:
	pop rbx
	add rbx, _GLOBAL_OFFSET_TABLE_+$$-%%getgot wrt ..gotpc
%endmacro
	
strcasecmp:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
	call uncase
	push rdi
	mov rdi, rsi
	xor rcx, rcx
	call uncase
	mov rsi, rdi
	pop rdi
	
	call strcmp wrt ..plt

	mov rsp, rbp
	pop rbp

	ret

uncase:
	inc rcx
	mov al, byte [rdi + rcx - 1]
	cmp al, 0
	jnz uncase_char
	ret

uncase_char:
	cmp al, 'A'
	jl uncase
	cmp al, 'Z'
	jg uncase
	add al, 32
	mov [rdi + rcx - 1], al
	jmp uncase