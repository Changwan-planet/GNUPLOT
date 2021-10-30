#!/bin/bash

cat /dev/null > trace.txt


awk '{if($1~/<scan>/) print}' *.DZX | grep -o '[0-9]*' | awk '{if($1>/0/) print}' >> trace.txt


sort -n trace.txt | cat

sort -n trace.txt | 
sed -n '1s/^/min=/p; $s/^/max=/p'
