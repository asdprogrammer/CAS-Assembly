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


section .bss
  output resb 10


section .text
  global _start

_start:
  ; start with 1, 1
  mov rax, 1
  mov rdi, 1

  ; temporary store
  mov rsi, rax

  ; add them together
  add rax, rdi

  ; put the stored value into rdi
  mov rdi, rsi

  mov output, rdi
  print output, 10

  exit
