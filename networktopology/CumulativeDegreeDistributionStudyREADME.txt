During this research, some results showed a possibility that the overall global network structures might
have an influence over the performance level of each simulation.  To test this hypothesis, an analysis
was performed to measure the global network structure (or the degree distribution).

The degree distribution was calculated by first determining the degree of each node at each timestep.  A 
script written in R accomplishes that.  To see the script that was used to accomplish this, see both 
degreedistributionscriptREADME.txt and degreedistributionscript.R

Once all the degrees of each node were calculated, the distribution of all nodes' degree value was determined.
In the files labeled DegreeDistrStepsize50Analysis.xlsx, the countif Excel function was used to count 
how many nodes had a certain degree value.  The results of these can be seen in cells B106:GS126 in all sheets except the Correlation sheet.

These values were then divided by the total number of possibilities, which in this case is 100 due to there being 100 different nodes.
These values were then cumulatively subtracted from 1.  The cumulative values can be seen in cells B173:GS193.

Then, the slope was calculated for each of these values.  The average of the slopes and the standard deviation of the slopes were calculated
for each time frame.  These results can be seen in cells A200:C210.

Finally, the correlation analysis was done for all sets of data which can be seen in the Correlation sheet.  The standard deviation of the slopes
were correlated to the simulations, and the average of the slopes were correlated to the foraging performance of the simulations.

As seen, these correlation values were very low, therefore, it was ruled that the overall global network structures (or degree distribution) had little
role in simulation performance level.


Miscellaneous things: within the DegreeDistrSimulation#Stepsize50Analysis.xlsx, the numbers labeled 50, 100, 150, etc. represent which timesteps
were used in this analysis.  The numbers (1,2,3,4,5,etc.) in column A for the first section represent which nodes were which.  There were a hundred nodes,
so the numbers go all the way to 100.  The numbers labeled 1-20 in column A in the next section represent possible degree values.  The number to the right of 
column A in this second section represent various values that indicate the degree distribution.


If any of this needs clarification, please email me at kntrinh0215@gmail.com

-Khoinguyen "Khoi" Trinh