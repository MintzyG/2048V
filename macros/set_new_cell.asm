.macro SET_NEW_CELL()
  mv s0, zero                # sets s0 as 0 to get current random number
  start:
    RANDOM(s0, rand_ptr)     # gets current random number
    mv t3, s0                # saves random number in t3

    li t1, 16                # saves the modulo amount for matrix position
    rem t3, t3, t1           # calculates the position 0 indexed
    addi t3, t3, 1           # adds 1 to the position
    li t2 0                  # creates a counter with 0
    loop:
      li t0 4                # creates an offset with 4
      sub t3, t3, t0         # subtracts 4 from position
      addi t2, t2, 1         # counter += 1 for every subtraction > 0
      li t0, 1               # loads 1 for if to check if <= 0
      blt t3, t0, get_pos    # -> gets that position current value else
      j loop                 # keeps subtracting and counting
    
    get_pos:                        # gets here once t3 <= 0
      li t0 1                       # loads 1 to subtract
      sub s1, t2, t0                # subtracts 1 from the counter to find line | (i)
      addi s2, t3, 3                # adds 3 to t3 to find the element          | (j) 
      MATRIX_FETCH(matrix, s1, s2)  # gets  number at position matrix[i][j]
      bnez s0 start                 # if its not zero restart and find another position
      addi s0, s0, 1                # adds 1 to s0 to further randomize
      RANDOM(s0, rand_ptr)          # gets a new random number
      li t1 10                      # loads 10 for modulo operation
      rem t4, s0, t1                # calculates the remainder of the random number with 10
      addi t4, t4, 1                # adds 1 to result for range 1-10 instead of 0-9
      li t1, 1                      # loads 1 to for if
      beq t4, t1 quatro             # if t4 == 1 goes to label quatro:
        MATRIX_CHANGE_VALUE (matrix, s1, s2, 2) # set matrix[i][j] to 2
        j end                       # ends macro
      quatro:
        MATRIX_CHANGE_VALUE (matrix, s1, s2, 4) # set matrix[i][j] to 4
      end:
      li s9, 1           # loads 1 to sum to count
      COUNT(counter, s9) # count += 1
.end_macro
