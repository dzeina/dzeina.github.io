#!/bin/bash

max=0

for file in `ls *.c` 
do
   num=`cat $file | wc -l`
   if [ $num -gt $max ]; then
     max=$num
     filename=$file
   fi
done

echo "$filename has $max lines"
