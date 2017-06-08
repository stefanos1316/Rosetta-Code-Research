#!/bin/bash

#This script is responsible for removing tasks, a user must give a file of tasks or all the task as command line arguments

if [ "$#" -eq 0 ]; then
	echo "Illegal number of command line arguments, try --help for more information"
	exit
fi

if [ "$1" == "--help" ]; then
	echo "	"
	echo "========================"
	echo "|Command Line Arguments|"
	echo "========================"
	echo "	"
	echo "--tasks			Write a number of tasks found under the RosettaCode repository enclosed in" 
	echo "			double quotes, e.g., \"100-doors A+B Abstract-type\"."
	echo "--tasksFile		Provide as an input a file that contains the number of tasks you would like" 
	echo "			to have in your newly created dataset, e.g., write the task's name and new" 
	echo "			line after."
	echo "--languages		Write a number of programming languages available under the RosettaCode repo-" 
	echo "			sitory closed in double quotes, e.g., \"java c c++ c# \"."
	echo "--languagesFile   	Provide as an input a file that contains the number of tasks you would like" 
	echo "			to have in your newly create dataset, e.g., write the programming languages"
	echo "			and add a new line after each one."
	echo "	"
	echo "Note: All the arguments are case insensitive, thus, adding the in capitals or smalls does not" 
	echo "      any difference."
	exit
fi

echo "Removing Tasks and languages"

#Prepare variables
tasks=0
languages=0
tasksFile=0
languagesFile=0

#Get all arguments
args=("$@") 

#Get number of elements 
ELEMENTS=${#args[@]} 

for ((i=0;i<$ELEMENTS;++i)); 
do  
	case "${args[${i}]}" in 
	("--tasks") tasks=${args[i+1]} ;;
	("--languages") languages="${args[i+1]}" ;;
	("--tasksFile") tasksFile="${args[i+1]}" ;;
	("--languagesFile") languagesFile="${args[i+1]}" ;;
	esac
done

if [[ $tasksFile != "0"  &&  $tasks != "0" ]]; 
then
	echo "Error: Add only a list of tasks or a file of tasks"
	exit
fi

if [[ $languages != "0" && $languagesFile != "0" ]]; 
then
        echo "Error: Add only a list of programming languages or a file of programming languages"
        exit
fi

arrayOfTasks=0
sorted=0

if [[ $tasks != "0" ]]; 
then
IFS=" " read -a arrayOfTasks <<< "$tasks"

#Since that Task directory is by default sorted we are also sorting our input 
#in order to remove the tasks with the appropriate sequence. 
sorted=$(for j in "${arrayOfTasks[@]}"; do echo $j; done | sort)
fi

arrayOfLanguages=0
sortedLang=0

if [[ $languages != "0" ]];
then
IFS=" " read -a arrayOfLanguages <<< "$languages"

#Sorting them
sortedLang=$(for a in "${arrayOfLanguages[@]}"; do echo $a; done | sort)
fi

#At this point of the script we will loop the task directory to remove the tasks not included in our query
for i in "${sorted[@]}"; 
do
	for containedInTask in `ls Task`;
	do
		taskName=$( echo $containedInTask | awk -F "/" '{print $NF}')
		echo "Tasks $containedInTask and $i"
		sleep 1
	
		if [ "$i" == "$taskName" ]; 
		then
			echo "SAME: $containedInTask and $i"
			#Before beaking from the loop remove the programming languages not defined from the Command Line 
			for a in "${sortedLang[@]}"; 
			do	
				for containedInLang in `ls Task/$taskName`;
				do
					langName=$(echo "$containedInLang" | awk -F "/" '{print $NF}')
					echo "Programming language is $containedInLang and $a"
					sleep 1
					if [ "$a" == "$langName" ];
					then
						break
					else
						echo "Removing $containedInLang"
						rm -rf $containedInLang
					fi

				done	
			done
			echo "Breaking point"
			break;
		fi

		#Compare and remove those who are not equal
		if [ "$i" != "$taskName" ]; 
		then
			echo "Removing $containedInTask"
			rm -rf Task/$containedInTask
		fi
	done
done

exit
