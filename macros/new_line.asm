.data
new_line: .asciz "\n"

# Prints a new line
# This uses a0, do not use between macros that return on a0
.macro NEW_LINE()
  la a0, new_line
  li a7, 4
  ecall
.end_macro