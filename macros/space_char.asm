.data
space_char: .asciz " "

# Prints a new line
# This uses a0, do not use between macros that return on a0
.macro SPACE_CHAR()
  la a0, space_char
  li a7, 4
  ecall
.end_macro
