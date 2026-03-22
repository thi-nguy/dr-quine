; Dr Quine
%macro STR 0
    msg db "; Dr Quine%1$c%%macro STR 0%1$c    msg db %2$c%3$s%2$c, 0%1$c%%endmacro%1$c%%macro PRINT_TO_FILE 5%1$c    mov rdi, %%1%1$c    lea rsi, [rel %%2]%1$c    mov rdx, %%3%1$c    mov rcx, %%4%1$c    lea r8, [rel %%5]%1$c    xor rax, rax%1$c    call fprintf wrt ..plt%1$c%%endmacro%1$c%%macro RUN 0%1$csection .rodata%1$c    STR%1$c    file_name db %2$cGrace_kid.s%2$c, 0%1$c    mode db %2$cw%2$c, 0%1$csection .text%1$c    extern fopen, fclose, fprintf%1$c    global main%1$cmain:%1$c    push rbx%1$c    lea rdi, [rel file_name]%1$c    lea rsi, [rel mode]%1$c    call fopen wrt ..plt%1$c    mov rbx, rax%1$c    PRINT_TO_FILE rax, msg, 10, 34, msg%1$c    mov rdi, rbx%1$c    call fclose wrt ..plt%1$c%1$c    xor rax, rax%1$c    pop rbx%1$c    ret%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c%%endmacro%1$c%1$cRUN", 0
%endmacro
%macro PRINT_TO_FILE 5
    mov rdi, %1
    lea rsi, [rel %2]
    mov rdx, %3
    mov rcx, %4
    lea r8, [rel %5]
    xor rax, rax
    call fprintf wrt ..plt
%endmacro
%macro RUN 0
section .rodata
    STR
    file_name db "Grace_kid.s", 0
    mode db "w", 0
section .text
    extern fopen, fclose, fprintf
    global main
main:
    push rbx
    lea rdi, [rel file_name]
    lea rsi, [rel mode]
    call fopen wrt ..plt
    mov rbx, rax
    PRINT_TO_FILE rax, msg, 10, 34, msg
    mov rdi, rbx
    call fclose wrt ..plt

    xor rax, rax
    pop rbx
    ret
section .note.GNU-stack noalloc noexec nowrite progbits
%endmacro

RUN