.macro ADD_SCORE(%score, %amount)
  la s0, %score
  lw t0, 0(s0)
  add t0, t0, %amount
  sw t0, 0(s0)
.end_macro