The following scripts and files were used in my network motif research.

A general summary of the scripts and files is found below.

1. adjmatrixtoedgelistconverters
In short, the network files which represent the swarming systems analyzed were in the form of 
multiple .CSV files, each of which containing 10,000 100x100-adjacency matrices.  The motif mining algorithm,
mfinder, requires the network data input to be in the form of edgelists .TXT files.  Thus, a script written in MatLab
was used to accomplish this conversion.

2. mfinderscript
Once the edgelist files were obtained, the motif algorithm, mfinder, had to be utilized.  This was done by using Windows 
command prompt.  A sample of the commands that were used can be found in the mfinderscript.txt file.  Additionally,
the mfinder algorithm can be found online for free at
https://www.weizmann.ac.il/mcb/UriAlon/download/network-motif-software

3. motifextraction
After mfinder was used to extract the network motif data of the network files, an efficient way was needed to collect and
organize all of the motif data.  Scripts writen in C++ were used to accomplish this task. 3 different scripts were generated
to collect motif data for 3 different motif sizes.

The above must be done in the listed order in order to replicate my network motif research.  

Network Topology
These scripts were done in addition to verify some findings within my research.  This portion can be disregarded as it does not
have a direct relationship to network motif research, however, since it did play a role SPECIFICALLY for MY research it has been
included here.  These scripts measure various network topologies.  These scripts were written in R.

Files
The .CSV and .TXT are files that were generated from the scripts above.  They have been placed there to serve as a reference.
Additionally, the .CSV network file containing 10,000 100x100-adjacency matrices for one of the swarming systems can be
found and downloaded via this link
https://drive.google.com/file/d/13lUIArqfT48raDWmNRl-CC90VQEYPWvb/view?usp=sharing

If there are any questions, please contact me at kntrinh0215@gmail.com
Disclaimer: my education background was not focused in programming, so these scripts were not written with the best conventions.

-Khoinguyen "Khoi" Trinh