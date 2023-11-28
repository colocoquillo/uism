#!/bin/bash

#KEY="empty"
#PORT=0

[ -z "$KEY" ] && echo "Key is Empty" && exit
[ -z "$PORT" ] && echo "Port is Empty" && exit

IP_ADDR=$(ip addr show | grep -o "inet [0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" | grep -o "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" | grep -v 127.0.0.1)

echo Using key=$KEY and listen in [$IP_ADDR]:$PORT

echo "[net]" > ~/.uam/uam.ini
echo "listens=[$IP_ADDR]:$PORT" >> ~/.uam/uam.ini

cat ~/.uam/uam.ini

/opt/uam/uam --pk $KEY
