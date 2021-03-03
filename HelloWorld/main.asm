section .data
  msg db "Hello world"
  msg_len equ $ - msg

section .text
  global _start

_start:
  mov rdi, 1
  mov rsi, msg
  mov rdx, msg_len
  mov rax, 0x2000004
  syscall

  mov rax, 0x2000001
  xor rdi, rdi
  syscall
