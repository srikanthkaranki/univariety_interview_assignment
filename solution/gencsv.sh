#!/bin/bash 

start_index=$1
stop_index=$2

if [ -d $1 ] || [ -d $2 ];then
	echo "Script execution should be in the format of 'sh gencsv.sh <start index> <stop index>'";
else
	echo "Script execution started";
fi

if [ -f inputFile ];then
	rm -rf inputFile;
	echo "Removed old inputFile"
else
	echo "inputFile not found"
fi;

echo "Creating new inputFile"

for i in $(seq $start_index $stop_index);
do 
	echo "$i,$RANDOM" >> inputFile; 
done
echo "inputFile creation completed!!!"
