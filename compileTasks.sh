#!/bin/bash

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
					changeName=$(sed -i "1s/.*/public class $p-$loopIt {/" Task/$p/$A/$p"-"$loopIt".java")
					eval=$changeName

					#Also of the authros did not add '{' in the first line propably we will have duplicates
					#that will cause failed compilation
					removeSecondLineCurryBracketIfExist=$(sed -i "2s/^\(.\)//" Task/$p/$A/$p"-"$loopIt".java")
					eval=$removeSecondLineCurryBracketIfExist
					let loopIt=loopIt+1
				done				
				

				#Here we added a while statement in order to compile
				#Some of the files may not compile and an error may occur
				declare -i interator=1
				while [ ! $(javac Task/$p/$A/$p-"$interator".java) ];
				do
					echo "javac Task/$p/$A/$p-"$iterator".java finished with errors"
					let iterator=iterator+1
				done

				echo "javac Task/$p/$A/$p-"$iterator".java compiled"
				exit
				
				if "$(javac Task/$p/$A/$p-1.java)"; then
				echo "Compiled with no errors"
				else
				echo "Compiled with errors"
				echo "Trying the next number"
				
				fi
				echo "Compiling javac /Task/$p/$A/$p-1.java"
				exit
				;;
				(C) echo "Compile using gcc";;
				(C++) echo "Compile using g++";;			
				esac
			fi
		done
	
	done < Common_Tasks_to_Test.txt

done
