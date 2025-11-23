#!/usr/bin/env bash
#!/usr/bin/env bash
set -e

DIR="./src"
ARCHIVE="$DIR/archive.tar.gz"

gunzip -c "$ARCHIVE" | tar -xC "$DIR"

while true; do

    # Stop at treasure.txt
    if [[ -f "$DIR/treasure.txt" ]]; then
        break
    fi

    NEXT=$(find "$DIR" -maxdepth 1 -name "*.tar.gz" ! -name "archive.tar.gz" | head -n 1)

    if [[ -z "$NEXT" ]]; then
        echo "Error: treasure not found."
        exit 1
    fi

    gunzip -c "$NEXT" | tar -xC "$DIR"

    rm "$NEXT"
done

cat "$DIR/treasure.txt"

