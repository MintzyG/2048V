.data
randn: .asciz "Rand number: "
line: .asciz "line: "
col: .asciz "col: "
quatr: .asciz "nao sou quatro: "
sou: .asciz "sou quatro: "

.macro SET_NEW_CELL()
  mv s0, zero
  start:
    RANDOM(s0, rand_ptr)
    mv t3 s0

    li t1 16 # modulo number
    rem t3, t3, t1 
    addi t3, t3, 1
    #PRINT_ALL(randn, t3)
    li t2 0 # counter
    loop:
      li t0 4
      sub t3, t3, t0
      addi t2, t2, 1 
      li t0, 1
      blt t3, t0, get_pos
      j loop
    
    get_pos:
      li t0 1
      sub t2, t2, t0
      addi t3, t3, 3
      #PRINT_ALL(line, t2)
      #PRINT_ALL(col, t3)
      mv s1, t2
      mv s2, t3
      MATRIX_FETCH (matrix, t2, t3)
      bnez s0 start
      mv t0, s0 # valor em xy
      mv s0, zero
      RANDOM(s0, rand_ptr)
      mv t2, s1
      mv t3, s2
      li t1 10
      rem t4, s0, t1
      addi t4, t4, 1
      li t1, 1
      beq t4, t1 quatro
        #PRINT_ALL(quatr, t4)
        MATRIX_CHANGE_VALUE (matrix, t2, t3, 2)
        j end
      quatro:
      	#PRINT_ALL(sou, t4)
        MATRIX_CHANGE_VALUE (matrix, t2, t3, 4)
      end:
      li s9, 1
      COUNT(counter, s9)
      #MATRIX_PRINT_VALUE (matrix, t2, t3)
.end_macro
