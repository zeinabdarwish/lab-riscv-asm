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
        {1, 2, 3, 4, 5, 6},
        {7, 8, 9, 10, 11, 12},
        {13, 14, 15, 16, 17, 18},
        {19, 20, 21, 22, 23, 24},
        {25, 26, 27, 28, 29, 30},
        {31, 32, 33, 34, 35, 36}
    };
        findMaxColumnSum(array);
    return 0;
}

