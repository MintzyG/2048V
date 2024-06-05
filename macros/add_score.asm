.macro ADD_SCORE(%score, %amount)
  la s11, %score #AS loads score pointer
  lw s10, 0(s11) #AS loads score value
  add s10, s10, %amount #AS adds the amount to score
  sw s10, 0(s11) #AS stores back the new score
.end_macro

.macro PRINT_SCORE(%score)
  la s11, %score #AS loads score pointer
  lw a0, 0(s11) #AS loads score value
  li a7, 1
  ecall
  NEW_LINE
.end_macro
