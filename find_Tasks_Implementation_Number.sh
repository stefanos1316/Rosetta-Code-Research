!/bin/bash

#This script is responsible to identify the number of different languages implementations for a certain task.

#Remove Results if exist
removeResults="$(rm -f Results.txt)"
eval=$removeResults

for D in `ls Task`
do
	findNumberOfImplementations="$(ls -l "Task/"$D | wc -l)"
	eval=$findNUmberOfImplementations
	printf "Directory "$D \t \t \t $findNumberOfImplementations >> Results.txt
done

echo "Done...Exiting"

exit 
