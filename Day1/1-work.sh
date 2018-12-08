#!/bin/bash

INPUT=$1
OUTPUT=output.$$
FREQ=0
END_FREQ=0
REPEAT_FREQ=0
KNOWN_FREQS={}
LOOP=0

function contains() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            echo "y"
            return 0
        fi
    }
    echo "n"
    return 1
}

while true; do
	echo "Iteration: $LOOP "
	echo "Iteration: $LOOP " >> $OUTPUT
	echo ""
	echo ""
	for input in `cat $INPUT`; do
		OPER=`echo $input |cut -c 1`
		VALUE=`echo $input|cut -c 2-`
		FREQ=`expr $FREQ $OPER $VALUE`
		if [ $(contains "${KNOWN_FREQS[@]}" "$FREQ") == "y" ]; then
			echo "Dupe Found: $FREQ"
		else
			KNOWN_FREQS+=$FREQ
			echo $FREQ
			echo $FREQ >> $OUTPUT
		fi
		done
	LOOP=`expr $LOOP + 1`
	done

exit 0
