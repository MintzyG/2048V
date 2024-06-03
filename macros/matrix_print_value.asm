.macro MATRIX_PRINT_VALUE (%matrix, %line, %column)
	MATRIX_FETCH(%matrix, %line, %column)
	mv a0, s0
	li a7, 1
	ecall
.end_macro
