.data
lost: .asciz "You lost!\n"
cont: .asciz "You continue!\n"
firs: .asciz "first!\n"
las: .asciz "last!\n"
mid: .asciz "mid!\n"
vert: .asciz "VERT!\n"

.macro POSSIBLE_CHECK(%matrix)
  vars:
    li a1, 0
    li a2, 0
    li a3, 4
    li a4, 3
   
  horizontal:
    for_loop_1_step_1:
      bge a1, a3, vertical
      li a2, 0
      j for_loop_2

      for_loop_2:
	bge a2, a3, for_loop_1_step_2
	
	beqz a2, end_loop_2
	beq a2, a4, end_loop_2
	
	  #PRINT(mid)
	  MATRIX_FETCH(matrix, a1, a2)
	  mv s1, s0
	  addi t0, a2, 1
	  MATRIX_FETCH(matrix, a1, t0)
	  beq s0, s1, possible
	  addi t0, a2, -1
	  MATRIX_FETCH(matrix, a1, t0)
	  beq s0, s1, possible
	  j end_loop_2
	
	end_loop_2:
	  addi a2, a2, 1
	  j for_loop_2
				
    for_loop_1_step_2:
      addi a1, a1, 1
      j for_loop_1_step_1
  
   vertical:
    #PRINT(vert)
    li a1, 0
    li a2, 0
    for_loop_1_step_1v:
      bge a1, a3, finish
      li a2, 0
      j for_loop_2v

      for_loop_2v:
	bge a2, a3, for_loop_1_step_2v
	
	beqz a2, end_loop_2v
	beq a2, a4, end_loop_2v
	
	  #PRINT(mid)
	  MATRIX_FETCH(matrix, a2, a1)
	  mv s1, s0
	  addi t0, a2, 1
	  MATRIX_FETCH(matrix, t0, a1)
	  beq s0, s1, possible
	  addi t0, a2, -1
	  MATRIX_FETCH(matrix, t0, a1)
	  beq s0, s1, possible
	  j end_loop_2v
	
	end_loop_2v:
	  addi a2, a2, 1
	  j for_loop_2v
				
    for_loop_1_step_2v:
      addi a1, a1, 1
      j for_loop_1_step_1v
  
  
  possible:
    li a1, 1
    PRINT(cont)
    j end
  finish:
    PRINT(lost)
    li a7, 10
    ecall
  end:
.end_macro