#!/bin/bash

#Reset (or empty) the file 
cat /dev/null > trace.txt


#abstract the numerical data if each field  has '<scan>'. 
awk '{if($1~/<scan>/) print}' *.DZX | grep -o '[0-9]*' | awk '{if($1>/0/) print}' >> trace.txt

#arrange files as an ascending order
sort -n trace.txt | cat

#print max and min
sort -n trace.txt | 
sed -n '1s/^/min=/p; $s/^/max=/p'
 
#number of the lines or GPR file 
l=$(wc -l trace.txt )
echo line: $l
