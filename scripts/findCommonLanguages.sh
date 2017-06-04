#!/bin/bash

#This script receives as an input parameter the programming languages and creates a file with all the tasks that its implemented with!

fileName=Common_Languages_for_$1.txt

while read p; do
	for B in `ls Task/$p`
	do
		if [ $1 = $B ];
		then
		echo $p >> $fileName
		fi
	done
done < Results_Number_of_Common_Implementations_9.txt
