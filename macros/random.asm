.data
rand: .word 23, 45, 17, 82, 51, 99, 64, 15, 37, 76, 29, 62, 86, 5, 93, 13, 49, 79, 34, 67, 9, 90, 21, 54, 84, 30, 63, 89, 19, 52, 81, 36, 69, 25, 58, 87, 12, 44, 73, 39, 72, 16, 48, 77, 32, 65, 92, 24, 57, 85, 38, 71, 27, 60, 88, 11, 43, 74, 35, 68, 95, 28, 61, 83, 18, 50, 78, 33, 66, 94, 26, 59, 80, 14, 46, 75, 31, 70, 97, 20, 53, 82, 10, 42, 71, 40, 98, 96
 
# WARNING: for this to work you have to declare on main .data the following
# "rand_ptr: .word 0" and pass it to RANDOM as its second argument, otherwise it will not work
# rand_ptr stores the current index of rand, so you can use it multiple times without starting at 0
 
# Gets a random number using the current index plus the user input modulo 100
# Returns on a0 (if you use a0 after this macro without saving the value first you lose it)
.macro RANDOM (%key, %rand_ptr)

  #  Loads rand_ptr into s0 and loads first item of s0 into t5
  la s0, %rand_ptr
  lw t4, 0(s0)
  
  # starts variables t0 for sum
  # starts variable t1 as fixed size of rand and offset multiplier
  li t0 0
  li t1 100
  li t2, 4
  
  # adds current index of rand and key value
  add t0, t0, %key
  add t0, t0, t4
  blt t0, t1, menos_cem 
  sub t0, t0, t1 # if t0 >= 100 than subtract 100 from t0	
 
  menos_cem:
  # Saves new value to rand_ptr
  sw t0, 0(s0)
  
  # loads rand
  la s1, rand 	
  
  # applies the int offset to t3 using the index
  mul t3, t2, t0 
  # moves inside rand the apropriate amount
  add s1, s1, t3
  # gets and returns the rand value in a0		
  # value is saved in a1 to be able to print without losing it
  # we can change back to a0 later
  lw a0, 0(s1)			
	 
.end_macro
