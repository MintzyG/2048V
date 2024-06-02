.macro MATRIX_CHANGE_VALUE (%matrix, %line, %column, %value)
	li t1, %line
	li t2, %column
	li t3, 4
	li t4, %value
	
	mul t1, t1, t3
	mul t2, t2, t3
	
	la s0, %matrix
	add s0, s0, t1
	lw t0, 0(s0)
	add t0, t0, t2
	sw t4, 0(t0)
.end_macro