.include "./macros.asm"

.data
vector_1: .word 1, 2
vector_2: .word 3, 4
matrix: vector_1, vector_2

.text
main:
	MATRIX_PRINT_VALUE(matrix, 1, 1)
	MATRIX_CHANGE_VALUE(matrix, 1, 1, 69)
	MATRIX_PRINT_VALUE(matrix, 1, 1)
end:
	li a7, 10
	ecall
