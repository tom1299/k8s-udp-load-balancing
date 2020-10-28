#!/bin/sh

printf "READY\n";

while read line; do
  echo "Processing Event: $line" >&2;
  kill -3 $(cat "/etc/nginx/supervisord.pid")
done < /dev/stdin
