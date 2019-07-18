#!/bin/bash

pastCount=0

while [ 1 ];
do
	resultCount=`curl -s "$1" | grep -h "Results 1 to" | grep -o -E '[0-9]+' | tail -1`
	if (( resultCount > pastCount ))
	then
		echo "Result count increased to $resultCount for thread $1"
	fi
	pastCount=$resultCount
	
done
