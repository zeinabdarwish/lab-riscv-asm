#include <stdio.h>

int maxColumnSum(int arr[N][M]) {
 int maxSum = -10^9;
 int maxColumn = -1;
 int tempSum = 0;

 for(int i = 0; i < N; i++) {
    tempSum = 0;

    for(int j = 0; j < M; j++) {
      tempSum += arr[i][j];
    }

    if(tempSum > maxSum) {
      maxSum = tempSum;
      maxColumn = i;
    }
 }

 return maxColumn;
}
