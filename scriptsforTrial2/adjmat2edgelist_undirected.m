%reads csv file containing adjacency matrices and converts to
%edgelist/exports as txt files, use for UNDIRECTED NETWORKS

start = 50; %chooses initial timestep network to convert 
timestep = 10000 ; %number of timesteps
network = cell(timestep, 1) ; %create 'timestep' amount of arrays
stepsize = 50;  % determines stepsize of for loop
nodes = 100;  %number of entities (ants) within an network

%names of file directory
filedirectory1 = 'D:\motiftrialtwo\motif'; 
filedirectory3 = 'undirected\motiffilesinputoutput';

%file name variables
networkfilename1 = 'Network';
networkfilename3 = '.csv';
temporarylist = {3, 4, 5, 6, 7, 10, 12, 14, 15, 17, 21, 22, 23, 24}; %simulation numbers that is to be analyzed

for j = 1:length(temporarylist)
    
    simulationnumber = num2str(temporarylist{j}); %converts temporarylist to string
    
    filedirectory = strcat(filedirectory1, simulationnumber, filedirectory3) %combines file directory variables into one variable
    cd(filedirectory) %change working file directory
 
    networkfilename = strcat(networkfilename1, simulationnumber, networkfilename3); %file name to be analyzed
 
    for k = start :stepsize: timestep %starts at timestep ends at 10000 by steps of 50
    
        network = csvread( networkfilename, k + nodes*(k-1), 0, [k+nodes*(k-1),0,nodes*k+(k-1),nodes-1]); %reads network file, index starts at 0?
        edge = undirected(network); %converts adjacency matrix of network to edgelist using edgelist() function
        dlmwrite(sprintf('%d.txt', k),edge,'delimiter','\t','newline','pc') %exports edgelist to txt file
 
    end

 end