#include <stdio.h>

#define N 6 // Number of rows
#define M 6 // Number of columns

void findMaxColumnSum(int array[N][M]) {
    int columnSums[M];
    int maxColumnSum = 0;
    int maxColumnIndex = 0;

    // Calculate column sumscs
    for (int i = 0; i < M; i++) {
        columnSums[i] = 0;
        for (int j = 0; j < N; j++) {
            columnSums[i] += array[j][i];
        }

        // Update max column sum and its index
        if (columnSums[i] > maxColumnSum) {
            maxColumnSum = columnSums[i];
            maxColumnIndex = i;
        }
    }

    printf("The maximum column sum is %d, found in column index %d.\n", maxColumnSum, maxColumnIndex);
   
}
  
int main() {
    int array[N][M] = {
        {10, 2, 3, 4, 5, 6},
        {7, 8, 9, 1, 1,  2},
        {1, 1, 1, 1, 7,  8},
        {9, 20, 2, 1, 3, 40},
        {5, 6, 2, 8, 2,  3},
        {1, 2, 3, 3, 3,  6}
    };
        findMaxColumnSum(array);
    return 0;
}

