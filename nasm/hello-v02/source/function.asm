extern hello
extern buffer

section .text
    global print_hello, wait_for_key

    extern hello       ; Declare hello as external (from data.asm)
    extern buffer      ; Declare buffer as external (from main.asm)

; Function to print "Hello, World!"
print_hello:
    ; Write the string to stdout (file descriptor 1)
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor for stdout
    mov ecx, hello      ; pointer to the string
    mov edx, 14         ; length of the string (including the newline)
    int 0x80            ; make the syscall
    ret                 ; return from the function

; Function to wait for a key press
wait_for_key:
    ; Read 1 byte from stdin (file descriptor 0)
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor for stdin
    mov ecx, buffer     ; pointer to a buffer to store input
    mov edx, 1          ; read 1 byte
    int 0x80            ; make the syscall
    ret                 ; return from the function
