#!/bin/bash
set -euo pipefail

A_VAL=$((SOCAT_PID / 3))
B_VAL=$(cat /proc/stat | head -1 | awk '{print $5}')
RES=$(( (A_VAL + B_VAL) % 2 ))

echo -e "HTTP/1.1 200 OK\r"
echo -e "Content-Type: text/html\r"
echo -e "Connection: close\r"
echo -e "\r"

if [ $RES -eq 1 ]; then
    cat /var/www/html/index.html
else
    cat /var/www/html/error.html
fi