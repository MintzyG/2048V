.macro MATRIX_FETCH (%matrix, %line, %column)
	mv t1, %line
	mv t2, %column
	li t3, 4
	
	mul t1, t1, t3
	mul t2, t2, t3
	
	la s0, %matrix
	add s0, s0, t1
	lw t0, 0(s0)
	add t0, t0, t2
	lw a0, 0(t0)
.end_macro
