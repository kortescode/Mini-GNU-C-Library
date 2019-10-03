[BITS 64]

	global main
	extern printf
	extern malloc
	
	section .text

my_strlen:
	inc rcx
	cmp byte [rax + rcx - 1], 0
	jnz my_strlen
	dec rcx
	ret
	
sum_params_len:
	xor rcx, rcx
	mov rax, [rsi + rdx * 8]
	call my_strlen
	add r8, rcx
	inc rdx
	cmp rdx, rdi
	jnz sum_params_len
	ret
	
minus_first_param_len:	
	xor rcx, rcx
	mov rax, [rsi]
	call my_strlen
	sub r8, rcx
	ret

my_concat:
	mov r11, [r8 + rcx]
	mov [rax + r9], r11
	inc rcx
	inc r9
	cmp byte [r8 + rcx - 1], 0
	jnz my_concat
	ret
	
my_strcat:
	xor rcx, rcx
	mov r8, [rsi + rdx * 8]
	call my_concat
	mov r11, '+'
	mov [rax + r9], r11
	inc r9
	inc rdx
	cmp rdx, rdi
	jnz my_strcat
	jmp ret
	
main:
	push rbp
	mov rbp, rsp

	xor rdx, rdx
	xor r8, r8
	call sum_params_len
	call minus_first_param_len

	push rdi
	mov r10, rsi
	add rdi, r8
	call malloc
	mov rsi, r10
	pop rdi

	xor rdx, 1
	xor r9, r9
	cmp rdx, rdi
	jnz my_strcat

	jmp ret


ret:
	mov rdi, formatStr
	mov rsi, rax
	mov rax, 0
	call printf

	mov rsp, rbp
	pop rbp

	ret

	section .rodata

	formatStr db '%s',0Ah,0