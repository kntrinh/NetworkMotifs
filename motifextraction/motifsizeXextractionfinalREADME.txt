These scripts involve C++.  These scripts were originally written in Visual Studio 2019.

These scripts are used to extract the motif data found from the numerous txt files generated from mfinder.  Specifically
it extracts the NREAL value found in the 2nd column of the "Full list of subgraphs size 3 ids:".  This NREAL number indicates
the number of occurrences a specific motif type has within a network.

I had multiple network motif text files that were generated from the mfinder algorithm.  This data had to be
organized into an Excel spreadsheet.  These scripts help accomplish that.

Each script can be modified to accomplish what the other two scripts do, however, to keep things easier, 3 different scripts have been generated, so less
modification is required. Each script is differentiated by a number; this number indicates which category of motif file is to be extracted, i.e. 
motifsize3extractionfinal.cpp is used to extract size-3 motif types, motifsize4extractionfinal.cpp is used to extract size-4 motif types, and 
motifsize5extraction.cpp is used to extract size-5 motif types.

To use these scripts, each of the motifsizeXextractionfinal.cpp must be modified to fit for your needs.  The variables that need to be changed are in the
CHANGE THESE VARIABLES section (lines 12-32) and the MISCELLANEOUS VARIABLES SECTION (line 33-40).  

CHANGE THESE VARIABLES SECTION
The first variable that needs to be changed is the string 'simulationnumber' variable.  Change it accordingly to how your file system looks.
The next variable is the string 'folderpath' variable.  Change this to where your network files are located.
The string 'endfilepath' variable is suffix associated with your motif data files.  Change it accordingly to how your motif data text files are named.
The string 'csvfilename' is the name of your output .CSV file. This output .CSV file will contain all of the data found in your motif data text files in one
	organized Excel spreadsheet. Change this variable to whatever you like.
The 'csvfilepath' variable is where you want your output .CSV file to be generated.  Change it to wherever you want your file to be located.
The 'numberofmotiftypes' indicates how many motif types that can be found in your motif data text files.  For my research, my network data files had undirected edges,
	so I had 29 different motif types that could be found (2 for size-3 motifs, 6 for size-4 motifs, and 21 for size-5 motifs).  Change this number accordingly to meet your
	requirements.
The string 'search[numberofmotiftypes]' variable is the variable used to identify the ID numbers associated with each motif type.  You will need to manually input these ID values to accommodate
	for your requirements.  (The ID numbers can be found in your motif data text files generated from the mfinder algorithm; it will be the first column under the "Full list of subgraphs size X ids:"
	section)
	
MISCELLANEOUS VARIABLES SECTION
The int 'stepsize' variable indicates which motif data files are to be read.  For example, I had motif data files labeled 50size3_OUT, 100size3_OUT, 150size3_OUT, ... 9950size3_OUT, 10000size3_OUT, so
	I chose my stepsize value to be 50.  Modify this based on how your motif data files are named.
The const int 'timesteps' variable indicates the final number associated with how my motif data file is named.  For example, my last motif data file is named 10000size3_OUT, so I chose my timestep value
	to be 10000.  Modify based on how your motif data file is named.
	

These scripts were written in Visual Studio 2019, so some additional adjustments might have to be made in order for your code to compile in your chosen IDE.

Some sample files have been placed in this folder.  The .CSV files without "MOD" are the raw .CSV files generated from the script.  The .CSV files with "MOD" have been created to help clarify the data. 
The .txt files with "OUT" are sample input files.  They are the raw motif data files that were generated from mfinder.

If any of this needs clarification, please email me at kntrinh0215@gmail.com

-Khoinguyen "Khoi" Trinh