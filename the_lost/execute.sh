#!/bin/bash
#!/bin/bash
set -e

install_jq() {
    echo "jq not found. Installing jq..."
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y jq
    elif command -v yum &> /dev/null; then
        sudo yum install -y jq
    else
        echo "Unsupported package manager. Please install jq manually."
        exit 1
    fi
}

install_xq() {
    echo "xq not found. Installing yq (provides xq)..."
    if command -v pip3 &> /dev/null; then
        pip3 install --user yq
    elif command -v pip &> /dev/null; then
        pip install --user yq
    else
        echo "pip not found. Please install Python3 and pip first."
        exit 1
    fi
    export PATH="$HOME/.local/bin:$PATH"
}

if ! command -v jq &> /dev/null; then
    install_jq
fi

if ! command -v xq &> /dev/null; then
    install_xq
fi

mkdir -p ./out
XML_FILE="./src/data.xml"
JSON_FILE="./out/output.json"

xq . "$XML_FILE" > "$JSON_FILE"
echo "Converted $XML_FILE → $JSON_FILE"

