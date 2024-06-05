.macro MATRIX_CHANGE_VALUE (%matrix, %line, %column, %value)
	mv t1, %line
	mv t2, %column
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

.macro MATRIX_CHANGE_VALUE_ADDR(%matrix, %line, %column, %value)
	mv t1, %line
	mv t2, %column
	li t3, 4
	mv t4, %value
	
	mul t1, t1, t3
	mul t2, t2, t3
	
	la s0, %matrix
	add s0, s0, t1
	lw t0, 0(s0)
	add t0, t0, t2
	sw t4, 0(t0)
.end_macro
