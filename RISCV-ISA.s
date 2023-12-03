maxColumnSum:
 li a0, -10^9 # maxSum = -10^9
 li a1, -1    # maxColumn = -1

 # iterate through each column of the array
 for(i = 0; i < N; i++):
    li a2, 0    # tempSum = 0

    # iterate through each row of the current column
    for(j = 0; j < M; j++):
      # calculate the sum of the elements in the current column
      lw a3, [x10 + 4*i] # a3 = arr[i][j]
      add a2, a2, a3     # tempSum += a3

    # compare tempSum with maxSum
    blt a2, a0, end     # if(tempSum < maxSum) goto end

    # if tempSum is greater than maxSum, update maxSum with tempSum and maxColumn with the index of the current column
    mv a0, a2            # maxSum = tempSum
    mv a1, a4            # maxColumn = i

 end:
 # return maxColumn
 mv a0, a1
 ret
