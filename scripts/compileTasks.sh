#!/bin/bash

#Author: Stefanos Georgiou from Athens University of Business and Economics
#This work is done for the purpose of comparing energy consumption of different languages

#This script file receives as a command-line parameter a file (that has a number of tasks) and compiles the languages given to it (again as
#command-line arguments)

# $1 -> file that has the name of the tasks found under the Task directory
# $2, $3, ..., $n number of languages to be compiled with (for the moment we will add only the seven we will use for our experiment)

for language in ${@:2};
do 
	
	#At this point we can iterate a number of languages given be the user to compile	
	while read p; 
	do
		#At this point we opened the Common_Tasks_to_Test.txt file where all the tasks to be tested are located
		#the argument $p has line-by-line the tasks		
		echo "Analyzing task $p"
		for A in `ls -l Task/$p`; 
		do
			if [ $A == $language ]; 
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
				createNewDir=1
				#########################################################################################################
				#Before proceeding check if there is only a single file located in our dataset.

				for f in $FILES;
				do
					#To change the name we will grap the third word from the file (since the first is public 
					#the second is class, and the third is the name) and we will use it as the current file's name
					fileName=$(grep "public class" $f | awk '{print $3}')
					className=$fileName
					echo $className " and " $fileName
					#sleep 10;		
				
					if [ -z "$fileName" ];
					then
						echo "String empty, applying new pattern"
						fileName=$(awk 'NR==1{print $3}' $f)				
					fi				

					#Some of the third word in the fileName variable may contain '{' at the end that we have to remove
					if [[ $fileName == *"{" ]];
					then
						echo "This var contains $fileName"
						echo "Removing it..."
						fileName=$(echo "$fileName" | sed 's/{//g')
						echo "Changed to $fileName"
						className=$fileName
					fi
		
					#Sometimes the thrid work maybe a special character, if it is then do not change 
					if [[ $fileName == *['!'@#\$%^\&*()_+-]* ]]
					then
  						echo "File name contains a special charaacter"
						echo "Leaving the same name as: $fileName"
						changedName=$(echo "$f" | awk -F "/" '{print $4}'| tr -d '-' )
						eval=$(mkdir -p Task/$p/$A/$createNewDir)
						eval=$(mv $f Task/$p/$A/$createNewDir/$changedName)
						echo "Changed to Task/$p/$A/$createNewDir/$changedName from $f"
						createNewDir=$((createNewDir + 1))
						
					else

					#At this point we change the files name to be the same as the class'.
					newName=$(echo "$f" | grep "public class" | awk '{print $3}')
					eval=$(mkdir -p Task/$p/$A/$createNewDir)
					changeNameBasedOnClass=Task/$p/$A/$createNewDir/$className.java
					echo "$changeNameBasedOnClass"
					eval=$(mv $f $changeNameBasedOnClass)
					echo "Moving $className from $f to $changeNameBasedOnClass"
				        #sleep 10;                                   
					#Some of the file may have the same name and as an outcome the scrip will override them
					#changeClassName=$(echo "$newName" | awk -F "." '{print $1}')
					#echo "Changing $className to $changeClassName in $changeNameBasedOnClass"
					#eval=$(sed -i "s/$className/$changeClassName/" $changeNameBasedOnClass)
					createNewDir=$((createNewDir + 1))
						
					
					fi
					echo "#########################################################################################"
				done				
				

				#Here we added a while statement in order to compile
				#Some of the files may not compile and an error may occur
				echo "#########################################################################################"
				echo "## 					COMPILING				     ##"
				echo "#########################################################################################"
				for f in `ls Task/$p/$A`;
				do
					for deeper in `ls Task/$p/$A/$f`;
					do
						echo "javac Task/$p/$A/$f/$deeper "
						eval=$(javac Task/$p/$A/$f/$deeper)
						if [ $? -eq 0 ];
						then
							echo "Task/$p/$A/$f/$deeper:Java" >> Reports/Compiled_Report.txt
						else
							echo "Failed:Task/$p/$A/$f/$deeper" >> Reports/Java_Failed_Report.txt
						fi
					done
					echo "#########################################################################################"
				done				
				;;
				(C) echo "Compile using gcc"
				echo "#########################################################################################"
				echo "## 					COMPILING				     ##"
				echo "#########################################################################################"
				FILES="Task/$p/$A/*"
				for f in $FILES;
				do
					#We use the '.' to separete our string here
					fileNameToCompile=$(echo "$f" | awk -F "." '{print $1}')
				
					echo "gcc -o $fileNameToCompile  $f"
					eval=$(gcc -o $fileNameToCompile $f)
					if [ $? -eq 0 ];
					then
						echo "$f:C" >> Reports/Compiled_Report.txt
					else
						echo "Failed:$f" >> Reports/C_Compiled_Error_Report.txt
					fi
				done
				;;
				(C++) echo "Compile using g++"
				echo "#########################################################################################"
				echo "## 					COMPILING				     ##"
				echo "#########################################################################################"
				FILES="Task/$p/$A/*"
				for f in $FILES;
				do
					#We use the '.' to separete our string here
					fileNameToCompile=$(echo "$f" | awk -F "." '{print $1}')
				
					echo "g++ -o $fileNameToCompile  $f"
					eval=$(g++ -o $fileNameToCompile $f)
					if [ $? -eq 0 ];
					then
						echo "$f:C++" >> Reports/Compiled_Report.txt
					else
						echo "Failed:$f" >> Reports/C++_Compiled_Error_Report.txt
					fi
				done
				;;	
				(Pascal) echo "Compile using fpc (for Pascal)"	
				echo "#########################################################################################"
				echo "## 					COMPILING				     ##"
				echo "#########################################################################################"
				FILES="Task/$p/$A/*"
				for f in $FILES;
				do			
					echo "fpc $f"
					eval=$(fpc $f)
					if [ $? -eq 0 ];
					then
						echo "$f:Pascal" >> Reports/Compiled_Report.txt
					else
						echo "Failed:$f" >> Reports/Pascal_Compiled_Error_Report.txt
					fi
				done
				;;	
				(COBOL) echo "Compile using cobc"
				echo "#########################################################################################"
				echo "## 					COMPILING				     ##"
				echo "#########################################################################################"
				FILES="Task/$p/$A/*"
				for f in $FILES;
				do
					#We use the '.' to separete our string here
					fileNameToCompile=$(echo "$f" | awk -F "." '{print $1}')
				
					echo "cobc -free -x -o $fileNameToCompile  $f"
					eval=$(cobc -free -x -o $fileNameToCompile $f)
					if [ $? -eq 0 ];
					then
						echo "$f:COBOL" >> Reports/Compiled_Report.txt
					else
						echo "Failed:$f" >> Reports/COBOL_Compiled_Error_Report.txt
					fi
				done
				;;		
				esac
			fi
		done
	
	done < Common_Tasks_to_Test.txt

done	
