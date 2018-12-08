#!/bin/bash

TWOS=0
THREES=0

for i in `cat 2.input`; do
	if [[ $i =~ '\(.\).*\1' ]]; 
		then TWOS=`expr $TWOS + 1`
	fi
	if [[ $i =~ '\(.\).*\1.*\1' ]];
		then THREES=`expr $THREES + 1`
	fi
	echo $TWOS $THREES
done

expr $TWOS \* $THREES

exit 0
