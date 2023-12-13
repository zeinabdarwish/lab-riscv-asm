

# Matrix Column Sum Algorithm
## Overview

This project involves finding the column in a matrix with the maximum sum of elements. The algorithm is implemented in both RISC-V assembly language and C programming language.


## Вариант задания

Вариант задания | Передача параметров
--------------- | -------------
Найти столбец в массиве с максимальной суммой элементов.| (N = 6, M = 6)


## Files

- **max.c**: C implementation of the algorithm.
- **max.s**: RISC-V assembly language implementation of the algorithm.
- **max.dump**: Dump file generated from the compiled executable.

## Алгоритм

- 1.Initialize a variable maxColumnSum to 0 to keep track of the maximum column sum.
- 2.Initialize a variable maxColumnIndex to 0 to keep track of the index of the column with the maximum sum.
- 3.For each column in the array:
   - a. Initialize a variable currentColumnSum to 0 to calculate the sum of elements in the current column.
   - b. For each element in the current column, add its value to currentColumnSum.
   - c. If currentColumnSum is greater than maxColumnSum, update maxColumnSum and maxColumnIndex.
- 4.The column with the maximum sum is stored in maxColumnIndex.

## Реализация C

Реализация C представлена в файле max.c. Он включает в себя основную функцию, которая инициализирует выборочную матрицу и вызывает функцию для поиска столбца с максимальной суммой.

### Сборник

Компиляция кода C с помощью компилятора RISC-V:
```bash
    riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 max.c -o max.elf
```

Файл дампа скомпилированного исполняемого файла:
```bash    
     riscv64-unknown-elf-objdump -D max.elf > max.dump
```

# Полученные результаты
После запуска программ печатается столбец с максимальной суммой.

