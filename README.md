# Authors information
Name: Stefanos Georgiou

Affiliation: Athens University of Business and Economics

Contact details: sgeorgiou@aueb.gr, sgeorgiou@singularlogic.eu, and stefanos1316@gmai.com

# Description
This reposotory was build for research purpose. 
Our aim is to compare the energy consumption of different tasks writtern in a variety of programming languages. 
In order to achieve our aim we used a dataset publicly available from Rosetta Code.
We found all the collected tasks implemented in different langauges from this link: https://github.com/acmeism/RosettaCodeData 
Since Rosetta Code contains the amount of 655 programming languages we decicde to limit our scope and include only the most used 
ones.  
For this puropose we collected the 20 most used ones found from tiobe index June 2017: https://www.tiobe.com/tiobe-index/
Thus we implemented a number of shell scripts in order to manage and limit our dataset.


# How to Execute
First drive to scripts directory and proceed as follows:

1) Execute the removeTasks.sh to have a filtered dataset with all the programming languages that we will examine for this research.
2) Execute the fromUpperToLowerCaseAll.sh in order to make all tasks' filenames to lower case (to have more consistenscy further on with our scripts)
3) Some of the Tasks cotains more that one implementation of the same languages, thus we had to manually drive through the directories and remove some of the 
   executables. In the case of Java we also had to change the .java files name since it had more than one file of a selected task.
4) Afterwards, we had to add additional code inside each file in order to force a task to run around a million of times (some tasks  are so small and are 
   finishing faster than 1 second, thus our power analyzer cannot capture those results).
5) Execute the compileTasks.sh in order to compile all tasks.
6) Execute the runTasks.sh to collect the results.
7) Execute the plotGrpahs to plot graphs.
