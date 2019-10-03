[BITS 64]

	section .text

	global strcmp:function

strcmp:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
	call cmp_string

	mov rsp, rbp
	pop rbp

	ret

cmp_string:
	mov al, byte [rdi + rcx]
	mov dl, byte [rsi + rcx]
	inc rcx
	jmp check_end

check_end:
	cmp al, 0
	jz check_end_bis
	cmp al, dl
	jz cmp_string
	jmp swap_char

check_end_bis:
	cmp dl, 0
	jz ret_null
	cmp al, dl
	jz cmp_string
	jmp swap_char

swap_char:
	xor rcx, rcx
	cmp al, dl
	ja cmp_char_lt
	jmp cmp_char_gt

cmp_char_gt:
	inc rcx
	inc al
	cmp al, dl
	jnz cmp_char_gt
	mov rax, -1
	imul rcx
	ret

cmp_char_lt:
	inc rcx
	inc dl
	cmp al, dl
	jnz cmp_char_lt
	mov rax, rcx
	ret

ret_null:
	xor rax, rax
	ret