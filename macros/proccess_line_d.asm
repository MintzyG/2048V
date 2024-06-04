# due to how I unraveled this macro into two we have a lot of leftover variables that are unused, DO NOT REMOVE THEM RN
# fazer as equivalentes para W A e S
.macro PROCCESS_LINE_D(%line)
# matrix related
  li a1, 4  # amount of lines and elements and int size
  li a2, 0  # current line

  # line related
  li a3, 12 # last position
  li a4, 0  # times iterated sum pointer
  li a5, 0  # times iterated position pointer
  
  mv s1, %line   # imports line into s1
  add s1, s1, a3 # moves to the end of the line
  
  move_line:
    lw t0, 0(s1)         # saves last position
    mv s2, s1            # creates a copy for sum pointer
    beqz t0, wait_move   # if empty move a number back
      j wait_sum         # else try to sum next number

  wait_sum:
    addi a4, a4, 1         # increments sum pointer counter 
    beq a4, a1, back       # no numbers found
    sub s2, s2, a1         # moves sum pointer back
    lw t1, 0(s2)           # saves last position
    beqz t1, wait_sum      # if 0 keep going
    beq t1, t0, sum        # if equals sum
    addi a5, a5, 1         # increment position_ptr counter
    sub s1, s1, a1         # move position_ptr back
    mv a4, a5              # set sum_ptr to position_ptr value
    j move_line            # keep iterating

  wait_move:
    addi a4, a4, 1         # increments sum pointer counter 
    beq a4, a1, back       # no numbers found
    sub s2, s2, a1         # moves sum pointer back
    lw t1, 0(s2)           # saves last position
    beqz t1, wait_move     # if 0 keep going
    j move                 # else move back number

  back:
    li a4, 0       # reset counter
    addi a2, a2, 1 # move line counter to next line
    j end          # finished this line

  move:
    sw t1, 0(s1)   # stores number at position pointer position
    sw zero, 0(s2) # zeroes out sum pointer position
    mv a4, a5      # sets sum_ptr counter to position_ptr counter value
    j move_line    # repeat from new indexes

  sum:
    add t1, t1, t1 # creates the sum result
    # call here the score function with t1
    #ADD_SCORE(%score, t1)
    sw t1, 0(s1)   # stores result at postion pointer
    sw zero, 0(s2) # replaces number with 0 at sum pointer
    #COUNT(count, -1)
    sub s1, s1, a1 # walks back 1 postion with position pointer
    addi a5, a5, 1 # increments position pointer counter
    mv a4, a5      # sets sum_ptr counter to position_ptr counter value
    j move_line    # repeat from new indexes

  end:
.end_macro
