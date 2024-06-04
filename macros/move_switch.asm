.macro MOVE_SWITCH(%input)
  li t0, 'w'
  beq t0, %input, W
  li t0, 'a'
  beq t0, %input, A
  li t0, 's'
  beq t0, %input, S
  li t0, 'd'
  beq t0, %input, D
  W:
    TRANSLATE(matrix, temp)
    MOVE_LEFT(temp)
    TRANSLATE(temp, matrix)
    j end
  A:
    MOVE_LEFT(matrix)
    j end
  S:
    TRANSLATE(matrix, temp)
    MOVE_RIGHT(temp)
    TRANSLATE(temp, matrix)
    j end
  D:
    MOVE_RIGHT(matrix)
  end:
  la t1, counter
  lw t2, 0(t1)
  li t3, 16
  beq t2, t3, no_cell
  SET_NEW_CELL()
  no_cell:
.end_macro
