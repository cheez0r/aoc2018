#!/bin/bash

COUNTER=0
LOOP=0
INPUT=$1

while [ $LOOP -lt 100 ]; do
	for i in `cat $INPUT`; do
		OPER=`echo $i |cut -c 1`
		VAL=`echo $i|cut -c 2-`
		COUNTER=`expr $COUNTER $OPER $VAL`
		echo $COUNTER >> output
		if grep -q \ $COUNTER output
			then echo "Dupe Found"
		fi
		done
	expr $LOOP + 1
	done
exit 0

