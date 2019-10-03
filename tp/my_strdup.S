[BITS 64]

	global my_strdup:function
	extern malloc
	extern _GLOBAL_OFFSET_TABLE_
	
	section .text

%macro	get_GOT	0
	call %%getgot
%%getgot:
	pop rbx
	add rbx, _GLOBAL_OFFSET_TABLE_+$$-%%getgot wrt ..gotpc
%endmacro
	
my_strlen:
	inc rsi
	cmp byte [rdi + rsi - 1], 0
	jnz my_strlen
	dec rsi
	ret

my_strcpy:
	mov rdx, [rdi + rcx]
	mov [rax + rcx], rdx
	inc rcx
	cmp rcx, rsi
	jnz my_strcpy
	ret
	
my_strdup:
	push rbp
	mov rbp, rsp

	xor rsi, rsi
	call my_strlen

	push rdi
	push rsi
	mov rdi, rsi
	call malloc wrt ..plt
	pop rsi
	pop rdi
	
	xor rcx, rcx
	call my_strcpy

	mov rsp, rbp
	pop rbp

	ret