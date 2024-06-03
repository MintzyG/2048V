.macro PRINT(%text)
  la a0, %text
  li a7, 4
  ecall
.end_macro