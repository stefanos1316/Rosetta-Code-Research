# Authors information
Name: [Stefanos Georgiou](https://istlab.dmst.aueb.gr/content/members/sgeorgiou.html)

Affiliation: Athens University of Business and Economics

Contact details: sgeorgiou@aueb.gr, sgeorgiou@singularlogic.eu, and stefanos1316@gmai.com

# Description
This reposotory was build for research purpose. 
Our aim is to compare the energy consumption of different tasks writtern in a variety of programming languages. 
In order to achieve our aim we used a dataset publicly available from [Rosetta Code](http://rosettacode.org/wiki/Rosetta_Code).
We found all the collected tasks implemented in different langauges from a [Git repo](https://github.com/acmeism/RosettaCodeData). 
Since Rosetta Code contains the amount of 655 programming languages we decicde to limit our scope and include only the most used 
ones.  
For this puropose we collected the 14 most used ones found from [tiobe](https://www.tiobe.com/tiobe-index/) index June 2017. 
Thus we implemented a number of shell scripts in order to manage and limit our dataset.

# Downloading
Since we are using a submodule in this repository we suggest the use of the following command:

$ git clone --recursive https://github.com/stefanos1316/Rosetta-Code-Research.git

In case you used simple clone command, add the submdodules using the following commands inside the cloned repo.

$ git submodule init

$ git submodule update

# How to Execute
First browse to [Scripts](https://github.com/stefanos1316/Rosetta-Code-Research/tree/master/Scripts) directory and proceed as follows:

1) Execute the **script.cleanAll** in order to prepare the existing dataset and make it case insensitive by chaning all files from upper to lower case.
2) Execute the **script.createNewDataSet** to have a filtered dataset with all the selected tasks and programming languages that we will examine for this research.
3) Some of the Tasks cotains more that one implementation of the same languages, thus we had to manually drive through the directories and remove some of the 
   executables. In the case of Java we also had to change the .java files name since it had more than one file of a selected task.
4) Afterwards, we had to add additional code inside each file in order to force a task to run around a million of times (some tasks  are so small and are 
   finishing faster than 1 second, thus our power analyzer cannot capture those results).
5) Execute the **script.compileTasks** in order to compile all tasks.
6) Execute the **script.executeTasks[Remotly|Locally]** in order to execute the tasks and collect results (in our case we used [Watts Up Pro](https://www.wattsupmeters.com/secure/products.php?pn=0)).
   On running the **script.executeTasksRemotly**, it is necessary to have a remote host with ssh where the Watts Up Pro is connected, otherwise the **script.executeTasksLocally** can be executed without the need of the remote host.
7) Execute the **script.createPlottableData** that creates the file with all the results from all the measurements. In the end, this script will call the **script.plotGrpahs** that is responsible to create plot the graphs.
8) The **script.plotGraphs** is executed by the **script.createPlottableData** and can provide graphs for both performance and energy consumption. Moreover, there are some default setting found in the end of **script.createPlottableData**, if anyone would like to change them and plot using different configuration parameters.

**Note**: For more information for executing scripts add the --help command line argument.
