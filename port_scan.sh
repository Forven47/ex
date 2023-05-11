#!/bin/bash

host=192.168.123.1
for port in  {1..1000};
do
  timeout .1 bash -c "echo >/dev/tcp/$host/$port"2>/dev/null && echo "port $port is open"
done
echo "Done"