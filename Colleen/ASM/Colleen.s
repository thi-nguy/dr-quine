; dr
section .rodata
    msg db "; dr%1$csection .rodata%1$c    msg db %2$c%3$s%2$c, 0%1$csection .text%1$c    extern printf%1$c    global main%1$cmain:%1$c; quine%1$c    lea rdi, [rel msg]%1$c    mov rsi, 10%1$c    mov rdx, 34%1$c    lea rcx, [rel msg]%1$c    xor rax, rax%1$c    call printf wrt ..plt%1$c    xor rax, rax%1$c    ret%1$csection .note.GNU-stack noalloc noexec nowrite progbits", 0
section .text
    extern printf
    global main
main:
; quine
    lea rdi, [rel msg]
    mov rsi, 10
    mov rdx, 34
    lea rcx, [rel msg]
    xor rax, rax
    call printf wrt ..plt
    xor rax, rax
    ret
section .note.GNU-stack noalloc noexec nowrite progbits