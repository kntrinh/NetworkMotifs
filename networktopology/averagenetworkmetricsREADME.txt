These scripts involve the language R.

This script is used to extract basic network topology data for each simulation.  For most of the network metrics, the average values
of each metric was calculated.  The network metrics analyzed were the degree, geodesic distance, eccentricity, betweenness centrality, 
closeness centrality, edge betweenness, local transitivity, global transitivity, diameter, and radius metrics.

To use this script, first change the 'simulationvector'.  Change them to the values of the simulations that you are wishing to analyze
(i.e. if you are wishing to analyze simulation 3, 7, and 8, change the 'simulationvector' to c(3,7,8))

Next you will want to change your directory names to where your 'NetworkX.csv' files are located.  I recommend using a file system
that has multiple folders; each of which that is specific to a certain simulation.  To do this, change the 'directorynameX' variables 
that will work according to your file system.

Lastly, if you want to choose a different stepsize to control which timesteps will be analyzed, change the 'stepsize' variable.

If any of this needs clarification, please email me at kntrinh0215@gmail.com

-Khoinguyen "Khoi" Trinh