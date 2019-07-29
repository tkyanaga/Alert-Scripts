#!/bin/bash


SUBJECT="Alert on $1"
TOEMAIL=example@gmail.com
MESSAGE="Result count increased for thread $1 to "

#sets output email, if exists.. example email is default
if ! [[ -z "$2" ]]
then
    TOEMAIL="$2"
fi



pastCount=0

while [ 1 ];
do
	#resultCount is # of results on website $1
    resultCount=`curl -s "$1" | grep -h "Results 1 to" | grep -o -E '[0-9]+' | sed '3q;d' `
#    echo for testing purposes
#    echo $resultCount
	if (( resultCount > pastCount ))
	then
		
		echo $MESSAGE $resultCount | mail -s "$SUBJECT" "$TOEMAIL"
		echo $MESSAGE

	fi
	pastCount=$resultCount
	sleep 60
done
