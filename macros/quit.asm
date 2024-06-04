.macro QUIT(%score)
  la s0, %score
  lw t0, 0(s0)
  
  mv a0, t0
  li a7, 1
  ecall
  
  li a7, 10
  ecall
.end_macro