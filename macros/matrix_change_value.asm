#A macro recebe a matriz, a posição e um valor como argumentos
#Ela vai até a posição da matriz informada e bota o valor novo nela

.macro MATRIX_CHANGE_VALUE (%matrix, %line, %column, %value)
	mv t1, %line	#posição de linha é guardado em t1
	mv t2, %column	#posição de coluna é guardado em t2
	li t3, 4	#t3 recebe o valor 4 para multiplicar os valores contidos em t1 e t2
	li t4, %value	#o valor novo é guardado em t4
	
	#Os valores em t1 e t2 são multiplicados por 4
	mul t1, t1, t3
	mul t2, t2, t3
	
	#O valor novo é guardado na posição da matriz informada
	la s0, %matrix
	add s0, s0, t1
	lw t0, 0(s0)
	add t0, t0, t2
	sw t4, 0(t0)
.end_macro


#Essa macro é a mesma que a de cima, com a única diferença sendo como recebe o valor novo
#A macro de cima recebe um valor literal. Quando ela é chamada, o valor deve ser passada dessa forma:
#	MATRIX_CHANGE_VALUE(matrix, t0, t1, 23)
#A macro de baixo, em vez de receber um número direto, ela recebe um registrador contendo um número. Sua chamada é feita dessa forma:
#	MATRIX_CHANGE_VALUE_ADDR(matrix, t0, t1, t2)

.macro MATRIX_CHANGE_VALUE_ADDR(%matrix, %line, %column, %value)
	mv t1, %line
	mv t2, %column
	li t3, 4
	mv t4, %value	#Transfere os conteúdos do registrador em %value para t4
	
	mul t1, t1, t3
	mul t2, t2, t3
	
	la s0, %matrix
	add s0, s0, t1
	lw t0, 0(s0)
	add t0, t0, t2
	sw t4, 0(t0)
.end_macro
