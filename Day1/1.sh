#!/bin/bash

COUNTER=0
LOOP=0
INPUT=$1
OUTPUT=output.$$

while [ $LOOP -lt 100 ]; do
	for i in `cat $INPUT`; do
		OPER=`echo $i |cut -c 1`
		VAL=`echo $i|cut -c 2-`
		COUNTER=`expr $COUNTER $OPER $VAL`
		if grep -q \ $COUNTER $OUTPUT
			then echo "Dupe Found"; exit 1
		fi
		echo $COUNTER >> $OUTPUT
		done
	expr $LOOP + 1
	done
exit 0

