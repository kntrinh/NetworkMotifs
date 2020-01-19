The mfinder algorithm is algorithm developed by researchers associated with Uri AlonLab.  This algorithm
was developed with the intent to analyze networks and mine for their network motif data.  The official website
regarding this algorithm can be found here:

https://www.weizmann.ac.il/mcb/UriAlon/download/network-motif-software

mfinder is used to analyze various networks and extract the network motif data from these networks.  There are different
types of motifs which this algorithm categorizes by the number of nodes that are associated with each motif.
I will refer to this categorization by the following:
	size-3 motifs
	size-4 motifs
	size-5 motifs
	size-6 motifs
Size-3 motifs refer to the motifs that consist of 3 nodes. Size-4 motifs refer to the motifs that consist of 4 nodes.
Size-5 motifs refer to the motifs that consist of 5 nodes. Size-6 motifs refer to the motifs that consist of 6 nodes.
The mfinder algorithm can only search for one type of motif category at a time meaning if the algorithm is selected to
search for size-5 motifs, it will only search for size-5 motifs and will not look for size-3, size-4, or size-6 motifs.  
Additionally, this algorithm is limited to finding only the motif categories that I have listed above.  As the motif size 
is increased, more intensive calculations are required to search for these motifs i.e. higher size motifs require more 
computational time.
	
This README file documents my usage of the mfinder algorithm.  For my situation, I had 3000 network files
that had to be analyzed and 9000 network files that had to be generated.  This process was quite lengthy and 
required about 1-2 days of the algorithm running to be completed.  The computer that I had used was a Dell 
Laptop with an Intel Quad Core i7-7700HQ @ 2.80 GHz processor and 8 GB of RAM on a Windows 10 operating system.  
The script that I had written was specifically to be used on a Windows 10 operating system.

The mfinder algorithm was ran through Windows Command prompt.  It calls on mfinder1.2.exe through the command prompt.
The script that I had used to call mfinder1.2.exe can be found in the file labeled mfinderscript.txt
I had multiple scripts prepared due to how long this process can take.  Multiple command prompts can be used
simultaneously to run the mfinder1.2.exe algorithm in order to save time.  When I ran this algorithm, I had used
about 8 scripts at once, meaning I had the mfinder1.2.exe algorithm running in 8 different command prompt windows.
While these 8 scripts were running, I was able to still use my computer.

//------------------------------------------------------------------------------------------------------------------------------------------------------------

SCRIPT 1
::size 3 network8 rab=1 50-5000 stepsize 50
d:
CD\previousPC\school\Research\motif8undirected
FOR /L %i IN (50,50,5000) DO (
  mfinder1.2 %i.txt -s 3 -f %isize3 -nd
)

SCRIPT 2
::size 4 network8 rab=1 5050-10000 stepsize 50
d:
CD\previousPC\school\Research\motif8undirected
FOR /L %i IN (5050,50,10000) DO (
  mfinder1.2 %i.txt -s 4 -f %isize4 -nd
)

SCRIPT 3
::size 5 network8 rab=1 5050-10000 stepsize 50
d:
CD\previousPC\school\Research\motif8undirected
FOR /L %i IN (5050,50,10000) DO (
  mfinder1.2 %i.txt -s 5 -f %isize5 -nd
)

I have included 3 scripts that I have used; each of which, I will explain what they were used to accomplish.
In the first script, this was used to analyze 100 network data files.  These 100 network files describe
the network of a foraging simulation titled network8 at various timesteps.  The timesteps analyzed were
every 50 timesteps from timestep 50 to timestep 5000 i.e. timesteps 50, 100, 150 ... 4950, 5000.
These 100 files were located in the directory D:/previousPC/school/Research/motif8undirected. The 100 network files
described a network with undirected or non-directed edges.  Each network file was named as 50.txt, 100.txt,
150.txt ... 4950.txt, 5000.txt. 
The network motif files that were generated from the mfinder algorithm were size-3 motif types.

The first line of the script is a comment line. (Apologies for spelling everything out)
	::size 3 network8 rab=1 50-5000 stepsize 50

The second and third line change the working directory of the algorithm.
	d:
	CD\previousPC\school\Research\motif8undirected

The last 3 lines are a for loop to run the algorithm.
The algorithm was chosen to run from starting from 50 to 5000 by every 50 steps.
	FOR /L %i IN (50,50,5000) DO (

The network data files to be inputted to the mfinder algorithm were named as X.txt where X represents the number 
associated with each network data text file.
	mfinder1.2 %i.txt

The argument -s 3 was used to indicate which motif category that the mfinder algorithm was to search for.  In this case,
I was looking for size-3 motifs.

The files generated from the mfinder algorithm were to be named Xsize3 where X represents the number associated with each 
network data file.  This was done by the following argument:
	-f %isize3

The network data files that I was working with were networks with undirected edges, so an argument was placed to indicate that
	-nd

Script 2 was used to search for size-4 motifs of network8 from timesteps 5050 to 10000 by every 50 steps.
Script 3 was used to search for size 5 motifs of network8 from timesteps 5050 to 10000 by every 50 steps.

//------------------------------------------------------------------------------------------------------------------------------------------------------------

IMPORTANT INFORMATION: to use the mfinder algorithm, the mfinder1.2.exe file must be located in the same working directory that
is chosen by the script you use in Windows Command prompt.  Additionally, your .txt files containing your network data must be in that
same directory.  Furthermore, your network files must be in the form of an edgelist as shown below in order for mfinder to run properly.
The first and second columns indicate the nodes that have an edge while the third column indicate the weight of the edge that connects
the two nodes.  For example, the first line of this edgelist indicates node 1 and node 5 have a edge with a weight of 1.

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


//------------------------------------------------------------------------------------------------------------------------------------------------------------

If any of this needs clarification, please refer to the 'mfinderManual.pdf' found in the mfinder1.2.zip file (located in the helpfulresources folder),
go to the official mfinder website (https://www.weizmann.ac.il/mcb/UriAlon/download/network-motif-software) or email me at kntrinh0215@gmail.com

-Khoinguyen "Khoi" Trinh