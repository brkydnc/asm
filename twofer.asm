section .data
prologue: db "One for ", 0
you: db "you", 0
epilogue: db ", one for me.", 0

section .text
global _two_fer

_two_fer:
    ; Save the name argument to the stack
    push rdi

    ; Copy the prologue into the buffer
    mov rdi, rsi    
    mov rsi, [rel prologue]
    call strcopy

    ; Determine if the name argument is null or valid
    pop rsi
    cmp rsi, 0
    jne tmp
    mov rsi, [rel you]
tmp:
    call strcopy

    mov rsi, [rel epilogue]
    call strcopy
    ret

strcopy:
    xor rdx, rdx
    mov al, BYTE [rdi + rdx]
    mov BYTE [rsi + rdx], al
    inc rdx
    cmp rax, 0
    jne strcopy
    ret

