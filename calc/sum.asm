DEFAULT ABS
section .data
	x db 2
	y db 6

section .bss	
	size resb 1
	res resb 2
	end_res:

section .text
global _start
_start:
	mov r8b, [x]
	add r8b, [y]

	add r8b, '0'	

	add [res+1], 10
	mov [size], end_res - res

	mov [res], r8b
	
	mov rax, 1
	mov rdi, 1
	mov rsi, res
	mov rdx, [size]
	syscall

	mov rax, 60
	mov rdi, 0
	syscall


