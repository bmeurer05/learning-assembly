DEFAULT ABS
section .bss
	char_count resb 2

section .text
global _start
_start:
	count:
	mov r8b, 0
	add r8b, '0'

	mov r9b, 9
	add r9b, '0'

	mov byte [char_count+1], 10 

	.loop:
	
	mov [char_count], r8b

	mov rax, 1	
	mov rdi, 1
	mov rsi, char_count
	mov rdx, 2
	syscall

	inc r8b
	cmp r8b, r9b
	jle .loop

	mov rax, 60
	mov rdi, 0
	syscall
