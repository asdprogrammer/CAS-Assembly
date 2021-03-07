section .data
  msg db "Insert something here: "
  msg_len equ $ - msg

section .bss
  input: resb 100     ; the varialbe where the user input will be stored

section .text
  global _start

_start:
  mov rdi, 1
  mov rsi, msg
  mov rdx, msg_len
  mov rax, 0x2000004
  syscall

  mov rdi, 0
  mov rsi, input
  mov rdx, 100
  mov rax, 0x2000003
  syscall

  mov rdi, 0
  mov rsi, input
  mov rdx, 100
  mov rax, 0x2000004
  syscall

  mov rax, 0x2000001
  xor rdi, rdi
  syscall
