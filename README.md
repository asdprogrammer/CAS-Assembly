# CAS-Assembly
Learn a new programming language (Assembly)

## Notes:
#### List of syscalls: https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master

#### Argument order: rdi, rsi, rdx, rcx, r8, r9
#### Put syscall number in rax
#### Put 0x200000 before the syscall number
##### For hexadecimal numbers, but 0x before the number or h after the number (0xff or ffh)

#### Macros:
```asmx86
%macro name arguments
  %1, %2, etc... for getting the arguments`
%%endmacro
```
