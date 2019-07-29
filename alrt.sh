#!/bin/bash


SUBJECT="Alert on $1"
TOEMAIL=tkyanaga@gmail.com
MESSAGE="Result count increased for thread $1"


pastCount=0

while [ 1 ];
do
	#resultCount is # of results on website $1

	resultCount=`curl -s "$1" | grep -h "Results 1 to" | grep -o -E '[0-9]+' | tail -1`
	if (( resultCount > pastCount ))
	then
		
		echo $MESSAGE | mail -s "$SUBJECT" "$TOEMAIL"
		echo $MESSAGE

	fi
	pastCount=$resultCount
	
done
