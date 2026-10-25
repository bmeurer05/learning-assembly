DEFAULT ABS 
section .bss
	entry resb 2
	
section .data
	msg 		db "Type a letter: "
	msg_size	equ $ - msg

	msg_end 	db "The letter o typed is: "
	msg_end_size	equ $ - msg_end

	msg_upper	db "uppercase"
	msg_upper_size 	equ $ - msg_upper

	msg_lower	db "lowecase"
	msg_lower_size 	equ $ - msg_lower

	not_letter	db "The entry was not a letter"
	not_letter_size equ $ - not_letter

	new_line 	db 10

section .text
global _start
_start: 
	mov rax, 1
	mov rdi, 1
	mov rsi, msg
	mov rdx, msg_size
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, entry
	mov rdx, 2
	syscall

	upper_or_lower:
	cmp byte [entry], 96
	jg .lower
	jl .upper

	.lower:
		cmp byte [entry], 123
		jg .not_letter

		mov rax, 1
		mov rdi, 1
		mov rsi, msg_end
		mov rdx, msg_end_size
		syscall

		mov rax, 1 
		mov rdi, 1 
		mov rsi, msg_lower
		mov rdx, msg_lower_size
		syscall

		mov rax, 1
		mov rsi, new_line
		mov rdx, 1
		syscall 

		jmp .end

	.upper:
		cmp byte [entry], 90
		jg .not_letter
		cmp byte [entry], 65
		jl .not_letter
		
		mov rax, 1
		mov rdi, 1
		mov rsi, msg_end
		mov rdx, msg_end_size
		syscall

		mov rax, 1
		mov rsi, msg_upper
		mov rdx, msg_upper_size
		syscall

		mov rax, 1
		mov rsi, new_line
		mov rdx, 1
		syscall
		
		jmp .end

	.not_letter:	
		mov rax, 1
		mov rdi, 1 
		mov rsi, not_letter
		mov rdx, not_letter_size
		syscall

		mov rax, 1
		mov rsi, new_line
		mov rdx, 1
		syscall 

	.end:

	mov rax, 60
	mov rsi, 0
	syscall 
