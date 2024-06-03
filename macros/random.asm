.data
rand: .word 23, 45, 17, 82, 51, 99, 64, 15, 37, 76, 29, 62, 86, 5, 93, 13, 49, 79, 34, 67, 9, 90, 21, 54, 84, 30, 63, 89, 19, 52, 81, 36, 69, 25, 58, 87, 12, 44, 73, 39, 72, 16, 48, 77, 32, 65, 92, 24, 57, 85, 38, 71, 27, 60, 88, 11, 43, 74, 35, 68, 95, 28, 61, 83, 18, 50, 78, 33, 66, 94, 26, 59, 80, 14, 46, 75, 31, 70, 97, 20, 53, 82, 10, 42, 71, 40, 98, 96
 
.macro RANDOM (%value, %key, %i)
li t0 0
li t1 4
li t2 100
li t3 -100
 addi t0, %key, %i
 blt t0, t2, nsubcem 			# if t0 < 100 jmp for    nao deixa o indice do vetor rand ser >= 100
 addi t0, t3				# t0 -100
 
 nsubcem:
 la s0, rand 				# Carrega o endereço de rand
 li a7 0
 #mul a7, t0, t1 			# a7 = indice*4
 lw %value, a7(s0)			# Carrega o numero na posicao do indice
	 
.end_macro
