During this research, some results showed a possibility that the overall global network structures might
have an influence over the performance level of each simulation.  To test this hypothesis, an analysis
was performed to measure the global network structure (or the degree distribution).

The degree distribution was calculated by first determining the degree of each node at each timestep.  This 
script written in R accomplishes that.  To further understand what was done in this analysis, please see the file labeled
CumulativeDegreeDistributionStudyREADME.txt



To use this script, first change the 'simulationvector'.  Change them to the values of the simulations that you are wishing to analyze
(i.e. if you are wishing to analyze simulation 3, 7, and 8, change the 'simulationvector' to c(3,7,8))

Next you will want to change your directory names to where your 'NetworkX.csv' files are located.  I recommend using a file system
that has multiple folders; each of which that is specific to a certain simulation.  To do this, change the 'directorynameX' variables 
that will work according to your file system.

Lastly, if you want to choose a different stepsize to control which timesteps will be analyzed, change the 'stepsize' variable.

P.S. Don't worry if the file directory in the script does not match up with the file system that you were given. Before backing up these files,
I had organized the files into different folders, so it won't match up with the file system that I was working with when I wrote these scripts. The only thing 
that matters is if your working directory matches up with the location of where your 'NetworkX.csv' file is located.  If this is confusing, 
check the 'motif8undirected' folder.  This folder has been left unorganized as to demonstrate how the file system looked when I created these scripts.

If any of this needs clarification, please email me at kntrinh0215@gmail.com.

-Khoinguyen "Khoi" Trinh