.macro PRINT_ADDR(%addr)
  mv a0, %addr
  li a7, 1
  ecall
.end_macro