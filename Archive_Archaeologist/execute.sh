#!/bin/bash
file="./src/archive.tar.gz"
gunzip -c "$file" | tar -xvf -
gunzip -c "level2.tar.gz" | tar -xvf -
rm level2.tar.gz
gunzip -c "level3.tar.gz" | tar -xvf -
rm level3.tar.gz
cat treasure.txt
rm treasure.txt