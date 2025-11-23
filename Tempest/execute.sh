#!/bin/bash
mkdir -p out
f=$(find ./src -name '*.csv'|head -1)
awk -F, '$2!=""{s[$1]+=$2;c[$1]++}END{for(k in s)print k","s[k]","s[k]/c[k]","c[k]}' $f|sort -t, -k2,2nr>out/result.csv
