%reads csv file containing adjacency matrices and converts to
%edgelist/exports as txt files

 start = 50; %chooses initial timestep network to convert 
 timestep = 10000 ; %number of timesteps
 network = cell(timestep, 1) ; %create 'timestep' amount of arrays
 stepsize = 50 ;  % determines stepsize of for loop
 nodes = 100 ;  %number of entities (ants) within an network
 networkfilename = 'Network1.csv'; %file name to be analyzed
 
 for k = start :stepsize: timestep %starts at timestep ends at 10000 by steps of 50
    
    network = csvread( networkfilename, k + nodes*(k-1), 0, [k+nodes*(k-1),0,nodes*k+(k-1),nodes-1]); %reads network file
    edge8 = edgelist(network); %converts adjacency matrix of network to edgelist using edgelist() function
    dlmwrite(sprintf('%d.txt', k),edge8,'delimiter','\t','newline','pc') %exports edgelist to txt file
 
 end
 