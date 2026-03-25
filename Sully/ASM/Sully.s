%define CURRENT_I 5

%ifdef GENERATED
    %define I (CURRENT_I - 1)
%else
    %define I CURRENT_I
%endif

%macro FIRST_HALF 0
%endmacro

%macro SECOND_HALF 0
%endmacro

%macro FILE_NAME 2
    lea rdi, [rel %1]
    push rdi
    lea rsi, [rel format_fname]
    mov rdx, %2
    xor eax, eax
    call sprintf
    pop rdi
    mov rax, rdi

%macro FILE_EXEC 2
    lea rdi, [rel %1]
    push rdi
    lea rsi, [rel format_fexec]
    mov rdx, %2
    xor eax, eax
    call sprintf
    pop rdi
    mov rax, rdi

%macro FILE_OBJ 2
    lea rdi, [rel %1]
    push rdi
    lea rsi, [rel format_fobj]
    mov rdx, %2
    xor eax, eax
    call sprintf
    pop rdi
    mov rax, rdi

%macro PRINT_FIRST_HALF 

%

section .text
    extern fopen, fclose, fprintf, fputc, perror
    global main

main:
    mov rax, I
    cmp rax, 0
    jge .continue
    xor rax, rax
    ret

.continue:
    ; FILE_NAME
    FILE_NAME(fname, I)
    
    ; fopen(fname, "w")
    mov rdi, rax
    lea rsi, [rel mode]
    call fopen
    test rax, rax
    jz .err_fopen
    mov r12, rax

    ;fprintf FIRST_HALF
    mov rdi, r12
    lea rsi, [rel FIRST_HALF]
    mov rdx, 10
    xor eax, eax
    call fprintf
    test eax, eax
    js .err_printf

    ;fputc
    mov rdi, I
    add rdi, '0'
    mov rsi, r12
    call fputc
    cmp eax, -1
    je .err_fputc

    ;fprintf SECOND_HALF
    mov rdi, r12
    lea rsi, [rel SECOND_HALF]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel FIRST_HALF]
    lea r9, [rel SECOND_HALF]
    xor eax, eax
    call fprintf
    test eax, eax
    js .err_printf

    ;fclose
    mov rdi, r12
    call fclose
    test eax, eax
    js .err_fclose

    ;strcpy nasm
    lea rdi, [rel cmd]
    lea rsi, [rel str_nasm]
    call strcpy

    ;strcat File name
    FILE_NAME fname, I
    mov rsi, rax
    lea rdi, [rel cmd]
    call strcat

    ;strcat -o
    lea rdi, [rel cmd]
    lea rsi, [rel str_obj]
    call strcat 

    ;strcat Object file
    FILE_OBJ fname, I
    mov rsi, rax
    lea rdi, [rel cmd]
    call strcat

    lea rdi, [rel cmd]
    lea rsi, [rel str_and]
    call strcat

    FILE_OBJ fname, I
    mov rsi, rax
    lea rdi, [rel cmd]
    call strcat

    lea rdi, [rel cmd]
    lea rsi, [rel str_obj]
    call strcat 

    FILE_EXEC fname, I
    mov rsi, rax
    lea rdi, [rel cmd]
    call strcat

    lea rdi, [rel cmd]
    call strcat
    call system

.err_fopen:
    lea rdi, [rel err_fopen]
    call perror
    jmp .done

.err_fprintf:
    lea rdi, [rel err_fprintf]
    call perror
    jmp .done

.err_fputc:
    lea rdi, [rel err_fputc]
    call perror
    jmp .done

.err_fclose:
    lea rdi, [rel err_fclose]
    call perror
    jmp .done

.done:
    xor rdi, rdi
    ret

section .rodata
    FIRST_HALF
    SECOND_HALF
    mode db "w", 0

section .data
    format_fname db "Sully_%d.s", 0
    format_fexec db "Sully_%d", 0
    format_fobj db "Sully_%d.o", 0

    err_fopen db "fopen", 0
    err_fprintf db "fprintf", 0
    err_fputc db "fputc", 0
    err_fclose db "fclose", 0

    str_nasm db "nasm -f elf64", 0
    str_obj db " -o ", 0
    str_and db " && gcc ", 0


section .bss
    cmd resb 256
    fname resb 50
    exec_file resb 50
