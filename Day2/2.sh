#!/bin/bash

INPUT=$1
OUTPUT=output.$$
TWOS=0
THREES=0

for i in `cat $INPUT`; do
	if [[ $i =~ '\(.\).*\1' ]]; 
		then TWOS=`expr $TWOS + 1`
	fi
	if [[ $i =~ '\(.\).*\1.*\1' ]];
		then THREES=`expr $THREES + 1`
	fi
	echo $TWOS $THREES tee -a $OUTPUT
done

expr $TWOS \* $THREES

exit 0
