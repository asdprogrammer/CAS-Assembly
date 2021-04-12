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

section .data
  block db "O"
  block_len equ $-block
  space db " "
  space_len equ $-space
  new_line db 10
  new_line_len equ $-new_line

section .text
  global _start

_start:
  mov r8, 0 ; x position of block, starting at 0
  mov r9, 0 ; y position of block (going down), starting at 0

  draw:
    ; 80x24 grid !!


    s1:   ; setup 1
      ; skip drawing if is 0
      cmp r9, 0
      je s2
      ; y position
      mov rax, r9
      mov r10, 80   ; multiply by width of terminal screen
      mul r10
      mov r10, rax ; counter
    
    l1:
      print space, space_len
      dec r10
      jnz l1

    s2:   ; setup 2
      ; x position
      cmp r8, 0
      je b
      mov r10, r8 ; loop counter

    l2:
      print space, space_len
      dec r10
      jnz l2

    b:
      ; print the block
      print block, block_len

  update: ; update the position of the block
    inc r8
    cmp r8, 10
    je finish
    ;print new_line, new_line_len
    jmp clear_screen

  clear_screen:
    mov r10, 24
    l3:
      print new_line, new_line_len
      dec r10
      jnz l3
    jmp draw

  finish:
    exit
