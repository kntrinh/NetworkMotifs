#Code to determine the degree of each node during specific timesteps

rm(list = ls())  #WARNING: Will clear all objects from workspace
simulationvector <- c(1,8,9,11,13,16,18,19,20,25,26,27,28,29,30) #change this to control which simulations will be analyzed
directoryname0 <-"D:/previousPC/school/Research/motif"  #change these 2 to control where your working directory will be
directoryname2 <- "undirected"
stepsize<-50                                            #change this to control which timesteps will be analyzed

for (s in seq(1,length(simulationvector),1)){

  simulationnumber <-toString(simulationvector[s],NULL) #converts simulationvector objects to string objects

  directoryname1 <- simulationnumber              #determines which simulation is to be analyzed, combined in fulldirectoryname variable

  fulldirectoryname <-paste0(directoryname0,directoryname1,directoryname2)  #combines all directorynameX variables into one string
  
  #sets Working directory
  setwd(fulldirectoryname)
  library(igraph)

  chunk<-100  #one adjacency matrix is 100x100
  networkfile <- paste0('Network',simulationnumber,'.csv')  #name of the networkfile to be read

  #Importing Network Data from Timestep 1 to Timestep 10000
  net <-read.csv(networkfile,header=F) 
  blank<-na.omit(net) #removes timestep rows
  #Splitting Network Data into 10000 Matrices with 100 rows

  n<-nrow(blank)
  r<-rep(1:ceiling(n/chunk),each=chunk)[1:n]
  list<-split(blank,r)
  network<-matrix(list)

  #creates empy data frame with 10 rows
  degstoredataframe <- data.frame(x=rep(0,100))

  #for loop to get the degree data
  for (i in seq(stepsize,10000,stepsize)){

    matrix<-as.matrix(network[[i]])
    graph<- graph.adjacency(matrix, mode="undirected", diag=F)
    #Degree
    deg<-degree(graph)
    degstoredataframe[,i/stepsize] <- deg
  
  }

  #name of file that's to be outputted
  filename0 <-'DegreeDistrSimulation'
  filename1 <- toString(simulationnumber)
  filename2 <- 'Stepsize'
  filename3 <- toString(stepsize,NULL)
  filename4 <- '.csv'
  fullfilename <- paste0(filename0, filename1, filename2, filename3, filename4)

  #export data as csv files
  write.csv(degstoredataframe,file=fullfilename)
  
  #the data in the workspace takes up a lot of memory so it is cleared here before moving onto the next iteration with the exception of a few objects
  ls()[!(ls() %in% c('simulationvector','directoryname0', 'directoryname2','stepsize'))]
  rm(list= ls()[!(ls() %in% c('simulationvector','directoryname0', 'directoryname2','stepsize'))])

}


