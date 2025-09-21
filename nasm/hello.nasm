;# [ zrfisaac ]

;# [ about ]
;# - author : Isaac Caires Santana
;# - email : zrfisaac@gmail.com
;# . - site : zrfisaac.github.io
;# - version : zrfisaac.nasm.hello : 0.0.1

;# [ assembly ]
section .data
	msg db "Hello, World!", 0x0A	; The string with a newline

section .text
	global _start

_start:
	mov rax, 1						; syscall: sys_write
	mov rdi, 1						; file descriptor: stdout
	mov rsi, msg					; pointer to message
	mov rdx, 14						; message length
	syscall							; invoke the system call

	mov rax, 60						; syscall: sys_exit
	xor rdi, rdi					; status: 0
	syscall							; invoke exit
