#!/bin/sh

COUNTER=0

while :
do
	sleep 10
	COUNTER=`expr $COUNTER + 1`
	echo "Program has been running for $COUNTER times..."

	./chat.sh

	if [ "$COUNTER" -gt 100 ]; then
                echo "You got the answer correct!"
                exit
        fi
done
