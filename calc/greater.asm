DEFAULT ABS 
section .data
	x db 3
	y db 9

	new_line db 10

	msg_e db "The values are equal"
	msg_e_size equ $ - msg_e

	msg_g db "The greater value is: "
	msg_g_size equ $ - msg_g

section .bss
	res resb 1

section .text
global _start
_start:
	mov r9b, [y]

	compare:
	cmp [x], r9b
	jg .greater
	jl .less
	je .equal

	.greater:
		mov r8b, [x]
		add r8b, '0'
		mov [res], r8b
		jmp .end

	.less:
		mov r8b, [y]
		add r8b, '0'
		mov [res], r8b
		jmp .end

	.equal:
		mov rax, 1
		mov rdi, 1
		mov rsi, msg_e
		mov rdx, msg_e_size
		syscall

		jmp end

	.end:
		mov rax, 1
		mov rdi, 1
		mov rsi, msg_g
		mov rdx, msg_g_size
		syscall

		mov rax, 1
		mov rdi, 1
		mov rsi, res
		mov rdx, 1
		syscall
	
	end:
	mov rax, 1
	mov rdi, 1
	mov rsi, new_line
	mov rdx, 1
	syscall 

	mov rax, 60
	mov rdi, 0
	syscall 
		
