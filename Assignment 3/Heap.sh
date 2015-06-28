#!/bin/bash

# MergeSort.sh
# Test Script - MergeSort.java
# Author: Keegan van der Laag (jkvander@uvic.ca)
#
# Usage:
# 	- Ensure that all test files are named a2_values*
#	  and in the same directory as the binary.
#	- Run ./MergeSort.sh
#	- Script searches for the output string "List is sorted."
#	- Script reports number of tests passed
#	- Script reports files which failed testing.
#
# Enjoy.


pass=0
fail=0

for i in $( ls a2_values* ); do
	result=$(java -Xss64M MergeSort $i 2> /dev/null | grep -c "List is sorted.")
	if [ "$result" = "1" ]; then
		((pass++))
	fi
	if [ "$result" = "0" ]; then
		echo Failed on $i
		((fail++))
	fi
done
echo Passed: $pass
echo Failed: $fail
