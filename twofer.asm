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
    lea rsi, [rel prologue]
    call strcopy

    ; Determine if the name argument is valid or null (invalid)
    pop rsi
    cmp rsi, 0
    jne tmp

    ; If it is not valid, replace it with "you"
    lea rsi, [rel you]
tmp:
    dec rax
    add rdi, rax
    call strcopy

    dec rax
    add rdi, rax
    lea rsi, [rel epilogue]
    call strcopy
    ret

strcopy:
    xor rax, rax
for_loop:
    mov dl, BYTE [rsi + rax]
    mov BYTE [rdi + rax], dl
    inc rax
    cmp dl, 0
    jne for_loop
    ret

