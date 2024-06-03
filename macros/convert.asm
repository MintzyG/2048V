# Converts user input into a number for random number generation
# Returns on a0
.macro CONVERT_INPUT(%input)
  li t0, 'w'
  beq t0, %input, W
  li t0, 'a'
  beq t0, %input, A
  li t0, 's'
  beq t0, %input, S
  li t0, 'd'
  beq t0, %input, D
  W:
    li a0, 13
    j end
  A:
    li a0, 52
    j end
  S:
    li a0, 47
    j end
  D:
    li a0, 86
  end:
.end_macro