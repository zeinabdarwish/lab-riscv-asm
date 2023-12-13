.data
N:
.word 6
M:
.word 6
matrix:
.word 1, 2, 3, 4, 5, 6
.word 7, 8, 9, 10, 11, 12
.word 13, 14, 15, 16, 17, 18
.word 19, 20, 21, 22, 23, 24
.word 25, 26, 27, 28, 29, 30
.word 31, 32, 33, 34, 35, 36
result:
.word 0  # To store the column index with the maximum sum
.word 0  # To store the maximum sum

.text

main:
    la a2, N
    la a3, M
    la a4, matrix
    la a5, result
    call process
    la a2, result
    call print
    ecall

process:
    lw t1, 0(a2)  # N
    lw t2, 0(a3)  # M

    addi t4, x0, 0  # Column pointer
    addi t5, x0, 0  # Max sum
    addi t3, x0, 0  # Column index

init:
    lw t6, 0(a4)  # Load value from array
    addi a4, a4, 4  # Increment array pointer
    add t5, t5, t6  # Count sum
    addi t3, t3, 1
    blt t3, t2, init

    # Update max sum and column index if necessary
    lw t6, 4(a5)  # Load current max sum
    bge t5, t6, next_column

    # Update max sum and column index
    sw t5, 4(a5)
    sw t4, 0(a5)

next_column:
    addi t4, t4, 1  # Move to the next column
    blt t4, t2, init

    ret

print:
    # Print the result
    addi a0, x0, 1  # print_int ecall
    lw a1, 0(a2)
    ecall

    addi a0, x0, 11  # print_char ecall
    addi a1, x0, 32  # Space character
    ecall

    addi a0, x0, 1  # print_int ecall
    lw a1, 4(a2)
    ecall

    addi a0, x0, 10  # print_char ecall
    ecall

    ret
