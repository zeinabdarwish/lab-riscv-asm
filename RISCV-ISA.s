    .section .data
array:
    .word 1, 2, 3, 4, 5, 6
    .word 7, 8, 9, 10, 11, 12
    .word 13, 14, 15, 16, 17, 18
    .word 19, 20, 21, 22, 23, 24
    .word 25, 26, 27, 28, 29, 30
    .word 31, 32, 33, 34, 35, 36

.section .text
main:
    # Set up stack and base pointers
    addi sp, sp, -8
    sw ra, 0(sp)
    sw s0, 4(sp)

    # Set initial max sum and max column index
    li s0, -2147483648
    li s1, -1

    # Calculate the maximum column sum
calculate_max_column_sum:
    addi t0, x0, 0 # Column index
    addi t1, x0, 0 # Sum of the column elements

calculate_column_sum:
    addi t2, x0, 0 # Row index

calculate_row_sum:
    slli t3, t2, 5 # Multiply row index by 32 to get offset
    add t3, t3, t0 # Add column index to get element index
    slli t3, t3, 2 # Multiply element index by 4 to get byte offset
    add t3, t3, array # Get address of the element
    lw t4, 0(t3) # Load element value
    add t1, t1, t4 # Add element value to the sum of the column elements

    addi t2, t2, 1 # Increment row index
    blt t2, x0, calculate_row_sum # Repeat if row index < N

    # Check if the current column sum is greater than the max sum
    bgt t1, s0, update_max_sum

update_max_sum:
    mv s0, t1 # Update max sum
    mv s1, t0 # Update max column index

    # Increment column index
    addi t0, t0, 1

    # Repeat for all columns
    blt t0, x0, calculate_column_sum

    # Print the max column sum and index
    mv a0, s0
    li a7, 1
    ecall

    mv a0, s1
    li a7, 1
    ecall

    # Restore stack and base pointers
    lw ra, 0(sp)
    lw s0, 4(sp)
    addi sp, sp, 8

    # Exit the program
    li a7, 10
    ecall
