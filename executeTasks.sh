#!/bin/bash

#Author: Stefanos Georgiou from Athens University of Business and Economics
#This work is done for the purpose of comparing power consumption of different languages

#This script file receives as a command-line parameter a file (that has a number of tasks which is an output of compileTasks and shows the successfully compiled files) and executes the languages given to it (again as command-line arguments)

#Command Line Arguments
#$1 -> pull path of the file where all the tasks (tasks paths) that successfully compiled are located

#At this point we have a file that includes all the Tasks we successfully compiled
while read tasks; 
do
	#The string of tasks has the following format Path/where/to/find/Task.(extension):[ProgrammingLanguages]
	getPath=$(echo "$tasks" | awk -F ":" '{print $1}')
	getLanguages=$(echo "$taks" | awk -f ":" '{print $2}')
	
	#A case state to execute with different languages
	case "$getLanguage" in 
	(JAVA) echo "Running Java Programs" ;;
	(C) echo "Running C Programs" ;;
	(C++) echo "Running C++ Prgorams" ;;
	(COBOL) echo "Running COBOL Programs" ;;
	(Pascal) echo "Running Pascal Programs" ;;
	(Perl) echo "Running Rerl Programs" ;;
	(JavaScript) echo "Running JavaScript Programs" ;; 

done < $1
