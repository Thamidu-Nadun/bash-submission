#!/bin/bash
set -e

install_xml2json(){
    if ! command -v xml2json &> /dev/null; then
        echo "xml2json could not be found, installing..."
        npm i -g xml2json-cli
    else
        echo "xml2json is already installed."
    fi
}

if ! command -v xml2json &> /dev/null; then
    echo "xml2json is not installed. Attempting to install..."
    install_xml2json
    exit 1
fi

mkdir -p ./out
XML_FILE="./src/data.xml"
JSON_FILE="./out/output.json"

xml2json $XML_FILE $JSON_FILE
echo "Converted $XML_FILE → $JSON_FILE"
