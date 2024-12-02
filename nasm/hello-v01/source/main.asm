section .data
    message db 'Hello, World!', 0Dh, 0Ah, 0  ; Null-terminated string
    msg_len equ $ - message                  ; Message length

section .text
    global _start                            ; Entry point for the program

    extern WriteConsoleA
    extern ExitProcess
    extern GetStdHandle

_start:
    ; Get the handle to stdout
    push -11                                 ; STD_OUTPUT_HANDLE
    call GetStdHandle
    mov ebx, eax                             ; Save stdout handle

    ; Print "Hello, World!"
    push 0                                   ; Reserved, must be NULL
    push msg_len                             ; Length of the message
    push message                             ; Address of the string
    push ebx                                 ; Stdout handle
    call WriteConsoleA

    ; Exit the program
    push 0                                   ; Exit code
    call ExitProcess
