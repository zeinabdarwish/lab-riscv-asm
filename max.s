.data
N: .word 6
M: .word 6
matrix:
    .word 10, 2, 3, 4, 5, 6
    .word 7, 8, 9, 1, 1, 2
    .word 1, 1, 1, 1, 7, 8
    .word 9,20, 2, 1, 3, 400
    .word 5, 6, 2, 8, 2, 3
    .word 1, 2, 3, 3, 3, 6
result:
    .word 0  # To store the column index 
    .word 0  # To store the maximum sum
message:
    .asciiz "Result: "
    
.text
main:
    la a2, N
    la a4, matrix
    la a5, result
    call process
    call print_message
    call print_int
    call print_space
    call  print_int1
    call exit
     
     
exit:
    addi a0, zero, 10
    ecall

  
process:
    la a4, matrix   
    li t1, 24        
    lw t2, 0(a2)     # M
    addi t4, x0, 0 
  
column_loop:
    addi t6, x0, 0   
    addi t3, x0, 0  # Reset row index

row_loop:
    lw t0, 0(a4)    # Load value from array
    add t6, t6, t0   # Count sum
    add a4, a4, t1  # Increment array pointer (assuming each element is 4 bytes)
    addi t3, t3, 1   # Increment row index
    blt t3, t2, row_loop  # Continue looping if row index < N
   
    # Update max sum and column index if necessary
   
    bge t5, t6,next_column
    add t5,t6,zero
    add s11,t4,zero
    
next_column:
    addi a4, a4, -140 # 
    addi t4, t4, 1    # Move to the next column
    blt t4, t2, column_loop  # Continue looping if column index < M

    sw t5,0(a5)  # Store the column index with the maximum sum
    sw s11, 4(a5)  # Store the maximum sum
    ret

print_int:
    addi, a0, zero, 1 # print int ecall
    lw a1, 0(a5)
    ecall
    ret

print_message:
    addi a0, zero, 4 # print string ecall
    la a1, message
    ecall
    ret

print_space:
   addi a0, x0, 11   
   addi a1, x0, 45   # ASCII code for (-)
   li a7, 11    
   ecall
   ret
   
print_int1:
    addi, a0, zero, 1 # print int ecall
    lw a1, 4(a5)
    ecall
    ret

