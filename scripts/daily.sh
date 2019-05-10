#!/bin/bash

# my daily routine script
DOCUMENTS="/home/matus/museum/documents"

# if user enters 'day' show calendar and data
SHOWDATE=$1
if [ $1 == "day" ];
then
	# display the calendar
	cal
	# display the data and time in UTC
	date -u
fi

# Daily greeting 
echo "Hello There" $LOGNAME!

if [ "$PWD" == "$HOME" ];
then 
	echo "You are home"
else
	echo "you are in $PWD"
fi

# show us what we have to work on today
echo "Working document dir: $DOCUMENTS"
for doc in "$DOCUMENTS"/*.txt
do
	echo "$doc"
done


