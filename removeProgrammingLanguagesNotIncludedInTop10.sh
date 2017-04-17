#!/bin/bash

#Dumping direcotries with languages that are not included in top 10
removeResults="$(rm -rf Results.txt)"
eval=$removeResults

for A in `ls Task`
do

        for B in `ls Task/$A`
        do
                if [ $B != "C" ] && [ $B != "C++" ] && [ $B != "COBOL" ] && [ $B != "Java" ] && [ $B != "JavaScript" ] && [ $B != "Lisp" ] && [ $B != "Pascal" ] && [ $B != "Perl" ] && [ $B != "Assembly" ] && [ $B != "Visual-Basic-.NET" ];
                then
                        removeDir="$(rm -rf Task/$A/$B)"
                        eval=$removeDir
                        echo "Removing directory $B from Task/$A"
                fi
        done
done

echo "Done with removing direcotries..."
#This script is responsible to identify the number of different languages implementations for a certain task.

for D in `ls Task`
do
        findNumberOfImplementations="$(ls -l "Task/"$D | wc -l)"
        eval=$findNUmberOfImplementations
        if [ $findNumberOfImplementations -eq $1 ];
	then
	echo "Directory $D -> $findNumberOfImplementations" >> Results_Number_of_Common_Implementations_$1.txt
	fi
done

echo "Done...Exiting"

exit

