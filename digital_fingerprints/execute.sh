#!/bin/bash
ROOT_PATH="./src"
OUTPUT_PATH="./out/checksums.txt"
mkdir -p ./out

for file in $(find $ROOT_PATH -type f); do
    checksum=$(md5sum "$file" | awk '{ print $1 }')
    # echo "$checksum $file" >> $OUTPUT_PATH
done
