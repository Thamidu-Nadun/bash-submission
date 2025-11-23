#!/bin/bash
URL="https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"
RES=$(curl -s "$URL")

echo "$RES" > price
price=$(echo "$RES" | cut -d':' -f3 | cut -d'}' -f1)

echo "$price"
rm price