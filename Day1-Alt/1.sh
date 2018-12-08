#!/bin/bash

INPUT=$1
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
	for input in `cat $INPUT`; do
		OPER=`echo $input |cut -c 1`
		VALUE=`echo $input|cut -c 2-`
		FREQ=`expr $FREQ $OPER $VALUE`
#		echo $FREQ
		if [ $(contains "${KNOWN_FREQS[@]}" "$FREQ") == "y" ]; then
			echo "Dupe Found: $FREQ"
		else
			KNOWN_FREQS+=$FREQ
			echo $FREQ
		fi
		done
	done

exit 0
