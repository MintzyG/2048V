.data
rand: .word 23, 45, 17, 82, 51, 99, 64, 15, 37, 76, 29, 62, 86, 5, 93, 13, 49, 79, 34, 67, 9, 90, 21, 54, 84, 30, 63, 89, 19, 52, 81, 36, 69, 25, 58, 87, 12, 44, 73, 39, 72, 16, 48, 77, 32, 65, 92, 24, 57, 85, 38, 71, 27, 60, 88, 11, 43, 74, 35, 68, 95, 28, 61, 83, 18, 50, 78, 33, 66, 94, 26, 59, 80, 14, 46, 75, 31, 70, 97, 20, 53, 82, 10, 42, 71, 40, 98, 96
 
# WARNING: for this to work you have to declare on main .data the following
# "rand_ptr: .word 0" and pass it to RANDOM as its second argument, otherwise it will not work
# rand_ptr stores the current index of rand, so you can use it multiple times without starting at 0
 
# Gets a random number using the current index plus the user input modulo 100
# Returns on s0
.macro RANDOM (%key, %rand_ptr)
  # loads t0 as the new index
  # loads t1 as rand size
  li t0 0
  li t1 100
  
  # adds key value to t0
  add t0, t0, %key

  #  Loads rand_ptr into s0 and loads current index into t3
  la s0, %rand_ptr
  lw t2, 0(s0)
  # adds current index value to t0
  add t0, t0, t2
  
  # if (t0 < 100) jump to menos_cem, else subtract 100 and continue 
  blt t0, t1, menos_cem 
  sub t0, t0, t1 	
 
  menos_cem:
    # replaces t1 with int size
    li t1 4
    # Saves new index value to rand_ptr
    sw t0, 0(s0)
	  
    # applies the int offset to t2 using the index 
    mul t2, t1, t0 
    # loads rand into s0 and walks the new index amount
    la s0, rand 
    add s0, s0, t2
    # gets and returns the rand value in s0		
    lw s0, 0(s0)				 
.end_macro
