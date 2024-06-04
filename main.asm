.include "./macros/macros.asm"

.data
vector_1: .word 0, 1, 2, 3
vector_2: .word 4, 5, 6, 7
vector_3: .word 8, 9, 10, 11
vector_4: .word 12, 13, 14, 15
matrix: vector_1, vector_2, vector_3, vector_4

.text

main:
	li a1, 0
	li a2, 0
	li a3, 4

for_loop_1_step_1:
	bge a2, a3, end
	li a1, 0
	j for_loop_2
	
for_loop_1_step_2:
	addi a2, a2, 1
	j for_loop_1_step_1
	
for_loop_2:
	bge a1, a3, for_loop_1_step_2
	MATRIX_PRINT_VALUE(matrix, a2, a1)
	addi a1, a1, 1
	la a0, new_line
	li a7, 4
	ecall
	
	j for_loop_2
	
end:
	li a7, 10
	ecall
