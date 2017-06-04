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

	getExecutablesPath=$(echo "$tasks" | awk -F ":" '{print $1}' | awk -F "." '{print $1}')
	getLanguages=$(echo "$tasks" | awk -F ":" '{print $2}')
	echo "$tasks"
	#A case state to execute with different languages
	case "$getLanguages" in 
	(Jav) echo "Running Java Programs"
		#For the Java case this line below is necessary
		getDirectoryPath=$(echo "$tasks" | awk -F "." '{print $1}' | awk -F "/" '{$5="";print}' | tr ' ' '/')
		getExecutable=$(echo "$tasks" | awk -F "." '{print $1}' | awk -F "/" '{print $5}')
		#Run a million times the experiment
		echo "Executing $tasks task"		
		for i in {1..1000};
		do
			eval=$(java -classpath $getDirectoryPath $getExecutable)
			if [ $? -ne 0 ]
			then
				echo "Failed to execute Task $tasks" >> Reports/Error_Log.txt
				break;
			fi
		
		done
	echo "Done with $getExecutablesPath"

	;;
	(Cs) echo "Running C Programs" 
		echo "Executing $tasks task"
		for i in {1..1000};
		do
			eval=$(./$getExecutablesPath)
			if [ $? -ne 0 ]
			then
				echo "Failed to execute Task $tasks" >> Reports/Error_Log.txt
				break;
			fi
		done
	;;
	(C++s) echo "Running C++ Prgorams" 
	echo "Executing $tasks task"
		for i in {1..1000};
		do
			eval=$(./$getExecutablesPath)
			if [ $? -ne 0 ]
			then
				echo "Failed to execute Task $tasks" >> Reports/Error_Log.txt
				break;
			fi
		done
	;;
	(COBOLs) echo "Running COBOL Programs" 
	echo "Executing $tasks task"
		for i in {1..1000};
		do
			eval=$(./$getExecutablesPath)
			if [ $? -ne 0 ]
			then
				echo "Failed to execute Task $tasks" >> Reports/Error_Log.txt
				break;
			fi
		done
	;;
	(Pascals) echo "Running Pascal Programs" 
	echo "Executing $tasks task"
		for i in {1..10};
		do
			eval=$(./$getExecutablesPath)
			if [ $? -ne 0 ]
			then
				echo "Failed to execute Task $tasks" >> Reports/Error_Log.txt
				break;
			fi
		done
	;;
	(Perll) echo "Running Rerl Programs" 
	echo "Executing $tasks task"
	#At this point of the script we have to enter all the directory tasks from (Common_Tasks_to_Test.txt).
	#Grap all the .pl files and execute them.
	while read taskFile;
	do
		PATH="Task/$taskFile/Perl/*"
		for i in $PATH;
		do 
			echo "$i"
			exit
			for j in {1..10};
			do
				eval=$(perl $tasks)
				if [ $? -ne 0 ]
				then
					echo "Failed to execute Task $tasks" >> Reports/Error_Log.txt
					break;
				fi
			done
		done
	done < Common_Tasks_to_Test.txt
	;;
	(JavaScript) echo "Running JavaScript Programs" ;; 
	esac

done < $1


#At this point we will execute the tasks for perl and JavaScript
while read taskFile;
do
              	PATH="Task/$taskFile/Perl/*"
                for i in $PATH;
                do
                        echo "Here $i"
                        
                        for j in {1..10};
                        do
                                eval=$(perl $i)
                                if [ $? -ne 0 ]
                                then
                                        echo "Failed to execute Task $tasks" >> Reports/Error_Log.txt
                                        break;
                                fi
                        done
                done
done < Common_Tasks_to_Test.txt

