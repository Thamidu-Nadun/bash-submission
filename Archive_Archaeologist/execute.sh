#!/usr/bin/env bash
set -e

DIR="./out"
ARCHIVE="./src/archive.tar.gz"

# Create output directory if it doesn't exist
mkdir -p "$DIR"

# Extract first archive (keep original archive)
gunzip -c "$ARCHIVE" | tar -xC "$DIR"

# Loop until a .txt file appears
while true; do

    # Look for a .txt file
    TXT_FILE=$(find "$DIR" -maxdepth 1 -name "*.txt" | head -n 1)
    if [[ -n "$TXT_FILE" ]]; then
        break
    fi

    # Find next nested archive (ignore original archive.tar.gz)
    NEXT=$(find "$DIR" -maxdepth 1 -name "*.tar.gz" ! -name "archive.tar.gz" | head -n 1)

    if [[ -z "$NEXT" ]]; then
        echo "Error: no .txt file found."
        exit 1
    fi

    # Extract nested archive
    gunzip -c "$NEXT" | tar -xC "$DIR"

    # Remove nested archive
    rm "$NEXT"

done

# Print the .txt file
cat "$TXT_FILE"
