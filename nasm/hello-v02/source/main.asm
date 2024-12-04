section .bss
    buffer resb 1       ; Reserve 1 byte for user input

section .text
    global _start

    extern print_hello, wait_for_key   ; Declare external functions

_start:
    ; Call the print_hello function to print "Hello, World!"
    call print_hello

    ; Call the wait_for_key function to wait for a key press
    call wait_for_key

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit status 0
    int 0x80            ; make the syscall
