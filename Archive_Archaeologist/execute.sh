#!/bin/bash
file="./src/archive.tar.gz"

gunzip -c "$file" | tar -xvf - -C ./src
gunzip -c "./src/level2.tar.gz" | tar -xvf - -C ./src
gunzip -c "./src/level3.tar.gz" | tar -xvf - -C ./src

cat ./src/treasure.txt
