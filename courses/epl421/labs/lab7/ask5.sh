#!/bin/bash

function file_count() {
   NUMBER_OF_FILES=$(ls -l | wc -l)
   if [ $NUMBER_OF_FILES -le 20 ]; then
	echo "Small number"
   elif [ $NUMBER_OF_FILES -le 30 ]; then
	echo "Medium number"
   else
	echo "High number"
   fi
}

file_count
