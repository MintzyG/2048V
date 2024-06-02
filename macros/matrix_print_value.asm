.macro MATRIX_PRINT_VALUE (%matrix, %line, %column)
	MATRIX_FETCH(%matrix, %line, %column)
	li a7, 1
	ecall
.end_macro
