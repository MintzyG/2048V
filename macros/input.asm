# Gets user input of character type
.macro GET_INPUT_CHAR()
  li a7, 12
  ecall
.end_macro