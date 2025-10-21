#!/bin/bash
set -euo pipefail

A_VAL=$((SOCAT_PID / 3))
B_VAL=$(cat /proc/stat | head -1 | awk '{print $5}')
RES=$(( (A_VAL + B_VAL) % 2 ))


if [ $RES -eq 1 ]; then
    cat /var/www/html/index.html
else
    cat /var/www/html/error.html
fi