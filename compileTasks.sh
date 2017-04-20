#!/bin/bash

#Author: Stefanos Georgiou from Athens University of Business and Economics
#This work is done for the purpose of comparing energy consumption of different languages

#This script file receives as a command-line parameter a file (that has a number of tasks) and compiles the languages given to it (again as
#command-line arguments)

# $1 -> file that has the name of the tasks found under the Task directory
# $2, $3, ..., $n number of languages to be compiled with (for the moment we will add only the seven we will use for our experiment)

for var in ${@:2};
do 
	#At this point we can iterate a number of languages given be the user to compile	
	while read p; 
	do
		#At this point we opened the Common_Tasks_to_Test.txt file where all the tasks to be tested are located
		#the argument $p has line-by-line the tasks		
		for A in `ls -l Task/$p`; 
		do
			if [ $A == $var ]; 
			then
				#At this point we have a match for the var, afterwards we have to compile each case
				#respectivily
				case "$A" in 
				("Java") echo "Compiling Task/$p/$A using Javac"
		
				#Some of the file names are different compare to the public class
				#Here we will perform an action to change them
				declare -i loopIt=1
				var="public class $p-"$loopIt" {"
				FILES="Task/$p/$A/*"
				for f in $FILES;
				do
					#To change the name we will grap the third word from the file (since the first is public 
					#the second is class, and the third is the name) and we will use it as the current file's name
					fileName="$(awk 'NR==1{print $3}' Task/$p/$A/$p-$loopIt.java)"
					className=$fileName					

					#Some of the third word in the fileName variable may contain '{' at the end that we have to remove
					if [[ $fileName == *"{" ]];
					then
						echo "This var contains $fileName"
						echo "Removing it..."
						fileName=$(echo "$fileName" | sed 's/{//g')
						echo "Changed to $fileName"
					fi
			
					#Sometimes the thrid work maybe a special character, if it is then do not change 
					if [[ $fileName == *['!'@#\$%^\&*()_+-]* ]]
					then
  						echo "File name contains a special charaacter"
						fileName=$p-$loopIt.java
						echo "Leaving the same name as: $fileName"
					fi
	
					#At this point we change the files name to be the same as the class'.
					newName=Task/$p/$A/$fileName"_"$loopIt".java"
					echo "Changing from $p-$loopIt.java to $newName"
					eval=$(mv Task/$p/$A/$p-$loopIt.java $newName)
				                                                        
					#Some of the file may have the same name and as an outcome the scrip will override them
					changeClassName=$fileName"_"$loopIt
					echo "Changing $className to $changeClassName in $newName"
					if [ $className == *"{" ];
					then
							
					fi
					eval=$(sed -i "1s/$className/$changeClassName/" $newName)	
					let loopIt=loopIt+1
				
				done				


				#Here we added a while statement in order to compile
				#Some of the files may not compile and an error may occur
				for f in `ls Task/$p/$A`;
				do
					echo "javac Task/$p/$A/$f "
					if [ ! $(javac Task/$p/$A/$f) ];
					then
						echo "Compiled with Errors"
					else
						echo "Succussfully compiled"
					fi	
					echo "#########################################################################################"
				done
				exit				
				;;
				(C) echo "Compile using gcc";;
				(C++) echo "Compile using g++";;			
				esac
			fi
		done
	
	done < Common_Tasks_to_Test.txt

done
