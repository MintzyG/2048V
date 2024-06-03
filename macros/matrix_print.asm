.macro MATRIX_PRINT(%matrix)
	loop_variables:
		li a1, 0
		li a2, 0
		li a3, 4
	
	for_loop_1_step_1:
		bge a2, a3, continue
		li a1, 0
		j for_loop_2
		
	for_loop_1_step_2:
		addi a2, a2, 1
		NEW_LINE
		j for_loop_1_step_1
		
	for_loop_2:
		bge a1, a3, for_loop_1_step_2
		MATRIX_PRINT_VALUE(%matrix, a2, a1)
		addi a1, a1, 1
		SPACE_CHAR
		j for_loop_2
	
	continue:
	NEW_LINE()
.end_macro
