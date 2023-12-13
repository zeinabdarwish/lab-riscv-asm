.data
N: .word 6
M: .word 6
matrix: 
  .word 1, 2, 3, 4, 5, 6
  .word 7, 8, 9, 10, 11, 12
  .word 13, 14, 15, 16, 17, 18
  .word 19, 20, 21, 22, 23, 24
  .word 25, 26, 27, 28, 29, 30
  .word 31, 32, 33, 34, 35, 36
result: .word 0
        .word 0
        .word 0
        .word 0

.text
main:
  la a2, N        # Load address of N
  la a3, M        # Load address of M
  la a4, matrix   # Load address of matrix
  la a5, result   # Load address of result
  call process    # Call the process function
  la a2, M        # Load address of M (for printing)
  la a3, result   # Load address of result (for printing)
  call print      # Call the print function
  ecall           # Exit the program

process:
  lw t1, 0(a2)    # N
  lw t2, 0(a3)    # M

  addi t4, x0, 0  # row pointer

init:
  addi t5, x0, 0  # result to save
  addi t3, x0, 0  # row element number

cycle:
  lw t6, 0(a4)    # load value from array
  addi a4, a4, 4  # increment array pointer

  add t5, t5, t6  # count sum
  addi t3, t3, 1
  blt t3, t1, cycle

  sw t5, 0(a5)    # save result to resulting array
  addi a5, a5, 4
  addi t4, t4, 1
  blt t4, t2, init
  ret

print:
  lw t1, 0(a2)    # N

  addi t2, x0, 0
print_cycle:
  addi a0, x0, 1  # print_int ecall
  lw a1, 0(a3)
  ecall

  addi a0, x0, 11 # print_char ecall
  addi a1, x0, 32
  ecall

  addi t2, t2, 1
  addi a3, a3, 4
  blt t2, t1, print_cycle
  ret
