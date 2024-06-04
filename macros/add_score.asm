.macro ADD_SCORE(%score, %amount)
  la s11, %score
  lw s10, 0(s11)
  add s10, s10, %amount
  sw s10, 0(s11)
.end_macro
