.macro COUNT(%count, %value)
  la s11, %count
  lw s10, 0(s11)
  addi s10, s10, %value
  sw s10, 0(s11)
.end_macro
