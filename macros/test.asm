.data
	array: .word 2, 4, 2, 2
.text

main:
	la t0, array
	li t1, 0
	li t2, 8
	li t6, 0
	
	
	addi t0, t0, 12
	addi t1, t0, -4
	
while:
	blt t2, t6, end
	lw t3, 0(t0)
	lw t4, 0(t1)
	
	beq t4, t6, move_sum_pointer
	beq t3, t6, move_to_empty
	beq t3, t4, equal_destination
	
	
	addi t0, t0, -4
	bne t0, t1, while
	addi t1, t1, -4
	addi t2, t2, -4
	j while
	
move_sum_pointer:
	addi t1, t1, -4
	addi t2, t2, -4
	j while
	
move_to_empty:
	lw t5, 0(t1)
	sw t5, 0(t0)
	sw t6, 0(t1)
	
	addi t1, t1, -4
	addi t2, t2, -4
	j while
	
equal_destination:
	add t5, t3, t4
	sw t5, 0(t0)
	sw t6, 0(t1)
	
	addi t0, t0, -4
	addi t1, t1, -4
	addi t2, t2, -4
	j while
	
end:
	
	
	
	