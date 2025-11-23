#!/bin/bash
set -e

install_xml2json(){
    if ! command -v xml2json &> /dev/null; then
        echo "xml2json could not be found, installing..."
        npm i -g xml2json-cli
        export PATH="$(npm bin -g):$PATH"
    fi
}

install_xml2json

mkdir -p ./out
XML_FILE="./src/data.xml"
JSON_FILE="./out/output.json"

xml2json $XML_FILE $JSON_FILE

echo "Converted $XML_FILE → $JSON_FILE"

