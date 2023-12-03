#include <stdio.h>
#include <limits.h>

int max_column_sum(int arr[][6], int n, int m) {
    int max_sum = INT_MIN;
    int max_col_index = -1;

    for (int col_index = 0; col_index < m; col_index++) {
        int column_sum = 0;

        for (int row_index = 0; row_index < n; row_index++) {
            column_sum += arr[row_index][col_index];
        }

        if (column_sum > max_sum) {
            max_sum = column_sum;
            max_col_index = col_index;
        }
    }

    return max_sum;
}

int main() {
    int arr[6][6] = {
        {1, 2, 3, 4, 5, 6},
        {7, 8, 9, 10, 11, 12},
        {13, 14, 15, 16, 17, 18},
        {19, 20, 21, 22, 23, 24},
        {25, 26, 27, 28, 29, 30},
        {31, 32, 33, 34, 35, 36}
    };

    int max_sum = max_column_sum(arr, 6, 6);

    printf("The maximum column sum is: %d\n", max_sum);

    return 0;
}
