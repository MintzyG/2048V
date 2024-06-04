# fazer funçao que chama essas funçoes a partir de switch case

.macro MOVE_W(%matrix)
  # logica da vertical é diferente
.end_macro

# criar PROCCESS_LINE_A
.macro MOVE_A(%matrix)
  la s0, %matrix
  lw t0, 0(s0)
  PROCCESS_LINE_A(t0)
  la s0, %matrix
  lw t0, 4(s0)
  PROCCESS_LINE_A(t0)
  la s0, %matrix
  lw t0, 8(s0)
  PROCCESS_LINE_A(t0)
  la s0, %matrix
  lw t0, 12(s0)
  PROCCESS_LINE_A(t0)
.end_macro

.macro MOVE_S(%matrix)
  # logica da vertical é diferente
.end_macro

.macro MOVE_D(%matrix)
  la s0, %matrix
  lw t0, 0(s0)
  PROCCESS_LINE_D(t0)
  la s0, %matrix
  lw t0, 4(s0)
  PROCCESS_LINE_D(t0)
  la s0, %matrix
  lw t0, 8(s0)
  PROCCESS_LINE_D(t0)
  la s0, %matrix
  lw t0, 12(s0)
  PROCCESS_LINE_D(t0)
.end_macro
