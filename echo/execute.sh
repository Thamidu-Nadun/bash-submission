#!/bin/bash

F="./src/echoes/pattern.csv"

awk -F',' '
NR>1 {dur[NR-2] = $2}    # store first four durations in array
END {
    # 7-beat palindrome: A, B, C, D, C, B, A
    sum = dur[0] + dur[1] + dur[2] + dur[3] + dur[2] + dur[1] + dur[0]
    printf "%.3f\n", sum/1000   # convert to seconds with 3 decimal places
}
' $F
