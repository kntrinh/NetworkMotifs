The scripts in this section involve MatLab.

To use the mfinder algorithm, the network files to be inputted must be an edgelist text file
in the format as such

1	5	1
1	39	1
1	46	1
1	62	1
1	76	1
1	91	1
1	95	1
2	4	1
2	8	1
2	11	1
2	49	1
2	88	1
3	14	1
3	72	1
3	90	1
4	11	1
4	32	1
4	88	1
5	13	1

where the first 2 columns indicate which nodes are connected to each other and the last
column indicates the weight of the link that connects the 2 nodes.  For example, the first line of this 
edgelist indicates node 1 and node 5 have an edge with a weight of 1. The raw network file that
I used for this network was a .CSV file that represented the network data through adjacency matrices.
This data had to be converted to edgelist text files, so this script was created specifically to accomplish 
this task.

Two scripts were written specifically to convert .CSV files that contained 10,000 100x100 adjacency matrices.
These scripts are titled as such:
	adjmat2edgelist_undirected.m
	adjmat2edgelist_directed.m
Each adjacency matrix was separated by a row that states the timestep associated with the adjacency matrix.  
To ignore this row, line 30 of the files adjmat2edgelist_directed.m and adjmat2edgelist_undirected was modified 
to address this problem.  Modify this line to accommodate for how your adjacency matrix looks.

To use this script, the working directory must be changed to the location of your.CSV file that contains your network data. 
Additionally, the directed.m and undirected.m functions must be in the same location as your working directory.

To use this script, modify the variables that exist outside of the for loop to meet your specific requirements.
The 'start' variable chooses which timestep to begin with.  For my research, I began with the adjacency matrix that
	was associated with timestep 50.
The 'timestep' variable indicates how many timesteps or how many adjacency matrices that exist within the .CSV file.
The 'stepsize' variable chooses which timesteps were to be chosen.  For my research, every 50 timesteps were to be read, therefore,
	the variable was set to 50.
The 'nodes' variable indicates how many nodes there are in each adjacency matrix.  For my research, there was a static 100 nodes.
The 'filedirectoryX' variables choose where the working file directory will be.  Modify this accordingly to your file system.
The 'networkfileX' variables indicate the name of the .CSV file to be converted. Modify this accordingly to how your .CSV file is named.
The 'temporarylist' variable chooses the simulation to be analyzed.  For my research, I had multiple .CSV files that contained various
	network data for different simulations.  The numbers I had put in this variable was based on the filename of the .CSV files and the 
	working directory of where each .CSV file was located.  Modify this variable accordingly to how your file system and .CSV file is named.

There are two versions of this script:
	adjmat2edgelist_undirected
	adjmat2edgelist_directed
The undirected version calls on the undirected.m function while the direct version calls on the directed.m function.  Which function you use
is dependent on if your network has edges that are directed or undirected.

This code will likely be needed to be modified based on how your network data file looks.  Please look at the Network8.csv files as a reference
to see how my version of this script was written to accommodate for my specific needs:
	convert 100x100 adjacency matrices to edgelist format as shown above.
	analyze every 50 adjacency matrices from numbers 50 through 10000  (50, 100, 150, 200... 9950, 10000)
	the row that indicates which timestep that each matrix was associated with had to be ignored

If any of this needs clarification, please email me at kntrinh0215@gmail.com

-Khoinguyen "Khoi" Trinh

