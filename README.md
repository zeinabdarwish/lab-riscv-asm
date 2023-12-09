

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

Алгоритм перебирает каждый столбец матрицы, вычисляет сумму ее элементов и отслеживает столбец с максимальной суммой.

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

