#!/bin/bash

#This script will modify all our dataset from upper case to lower case letters

destination="Task/*"

for f in $destination;
do
	#echo "Files are $f changed to..."
	parentDirToLower=$( echo "$f" | awk -F "/" '{print $2}' | tr '[A-Z]' '[a-z]')
	fullPathParentDirToLower="Task/"$parentDirToLower
	if [ $f != $fullPathParentDirToLower ]; 
	then
	eval=$(mv $f $fullPathParentDirToLower)
	fi
	#echo "The new dir name is $parentDirToLower and the path is $fullPathParentDirToLower"

	#At this point we will dive in each files directory of directory (current file (Tasks) -> dir (Programming Languages) -> dir (Task's Implementation))
	#to change the Tasks file name
	deepDirectory=$fullPathParentDirToLower"/*"
	for tasksProgrammingLanguages in $deepDirectory;
	do
		#echo "Currently in directory $tasksProgrammingLanguages"
		#At this point we are also changing programming languages letter from upper to lower case
		changeProgrammingLan=$(echo "$tasksProgrammingLanguages" | awk -F "/" '{print $NF}' | tr '[A-Z]' '[a-z]')
		remainPath=$(echo "$tasksProgrammingLanguages" | awk -F "/" '{$NF=""; print $1"/"$2"/"}')
		#echo "Current path $remainPath$changeProgrammingLan"
		newPathLang=$remainPath"/"$changeProgrammingLan
		eval=$(mv $tasksProgrammingLanguages $newPathLang)
		#echo "Changing $tasksProgrammingLanguages to $newPathLang"
		#Now get one level deeper
		deepDeepDirecotry=$newPathLang"/*"
		for tasksImplementations in $deepDeepDirecotry;
		do
			#echo "Currently in directory $deepDeepDirecotry and file name is $tasksImplementations"
			changeToLower=$(echo "$tasksImplementations" | awk -F "/" '{print $4}' | tr '[A-Z]' '[a-z]')
			remain=$(echo "$tasksImplementations" | awk -F "/" '{print $1"/"$2"/"$3}')
			newChangedToLower=$remain"/"$changeToLower
			#echo "New is $newChangedToLower"
			if [ $tasksImplementations != $newChangedToLower ];
			then
				eval=$(mv $tasksImplementations $newChangedToLower)
			fi
			#echo "Moved from $tasksImplementations to $newChangedToLower"
			
		done
	done
done

#Also chaning tasks from Common_Tasks_to_Test.txt
eval=$(tr '[A-Z]' '[a-z]' < Common_Tasks_to_Test.txt > Common_for_Testing.txt)
eval=$(mv Common_for_Testing.txt Common_Tasks_to_Test.txt)
echo "Changed also Common_Tasks_to_test.txt from upper to lower case letters"  
eval=$(rm -rf Common_for_Testing.txt)
exit
