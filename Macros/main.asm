%macro print 2
  mov rax, 0x2000004
  mov rdi, 1
  mov rsi, %1
  mov rdx, %2
  syscall
%endmacro

%macro input 2
  mov rax, 0x2000003
  mov rdi, 0
  mov rsi, %1
  mov rdx, %2
  syscall
%endmacro

%macro exit 0
  mov rax, 0x2000001
  xor rdi, rdi
  syscall
%endmacro


section .data
  msg db "Insert something here: "
  msg_len equ $ - msg

section .bss
  user_input: resb 100     ; the varialbe where the user input will be stored

section .text
  global _start

_start:
  print msg, msg_len

  input user_input, 100

  print user_input, 100

  exit
