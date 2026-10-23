section .data
	mensagem db "Hello, world!", 10
	tamanho equ $ - mensagem	

section .text
global _start
_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, mensagem
	mov rdx, tamanho
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
