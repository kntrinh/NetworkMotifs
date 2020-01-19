#Code to determine the average of various network metrics: 
#(degree, geodesic distance, eccentricity, betweenness centrality, closeness centrality,
#edge betweenness, local transitivity, global transitivity, diameter, and radius)

rm(list = ls())  #WARNING: Will clear all objects from workspace

simulationvector <- c(1,8,9,11,13,16,18,19,20,25,26,27,28,29,30) #change this to control which simulations will be analyzed
directoryname0 <- "D:/previousPC/school/Research/motif"  #change these 2 to control where your working directory will be
directoryname2 <- "undirected"
stepsize <- 1                                            #change this to control which timesteps will be analyzed

for (s in seq(1,length(simulationvector),1)){
  #sets Up Code
  simulationnumber <- toString(simulationvector[s],NULL) #converts simulationvector objects to string objects
  
  directoryname1 <- simulationnumber              #determines which simulation is to be analyzed, combined in fulldirectoryname variable
  
  fulldirectoryname <- paste0(directoryname0,directoryname1,directoryname2)  #combines all directorynameX variables into one string

  
  #sets Working directory
  setwd(fulldirectoryname)
  library(igraph)

  
  chunk<-100  #one adjacency matrix is 100x100
  networkfile <- paste0('Network',simulationnumber,'.csv')  #name of the networkfile to be read
  
  #Importing Network Data from Timestep 1 to Timestep 10000
  net <- read.csv(networkfile,header=F) 
  blank <- na.omit(net) #removes timestep rows
  
  #Splitting Network Data into 10000 Matrices with 100 rows
  n<-nrow(blank)
  r<-rep(1:ceiling(n/chunk),each=chunk)[1:n]
  list<-split(blank,r)
  network<-matrix(list)

  #vectors to store metric data
  degstore <- numeric(10000)
  distancestore <- numeric(10000)
  eccentstore <- numeric(10000)
  bcentstore <- numeric(10000)
  ccentstore <- numeric(10000)
  ebetweenstore <- numeric(10000)
  loctranstore <- numeric(10000)
  densitystore <- numeric(10000)
  diameterstore <- numeric(10000)
  radiusstore <- numeric(10000)
  globtranstore <- numeric(10000)

  #storing data
  for (i in seq(stepsize,10000,stepsize)){
    matrix <- as.matrix(network[[i]])
    graph <- graph.adjacency(matrix,
                             mode="undirected",
                             diag=F)
      #Degree
        deg <- degree(graph)
        avedeg <- mean(deg)
        degstore[i] <- avedeg
      
      #Geodesic Distance
        distance <- mean_distance(graph,
                                  directed=F)
        distancestore[i] <- distance

      #Eccentricity
        eccent <- eccentricity(graph,
                               V(graph),
                               mode="all")
        aveeccent <- mean(eccent)
        eccentstore[i] <- aveeccent
      
      #Betweenness Centrality
        bcent <- betweenness(graph,
                             v = V(graph),
                             directed = F,
                             weights = NULL,
                             nobigint = F,
                             normalized = T)
        avebcent <- mean(bcent)
        bcentstore[i] <- avebcent
      
      #Closeness Centrality
        ccent <- closeness(graph,
                           vids = V(graph),
                           mode = c("all"),
                           weights = NULL,
                           normalized = T)
        aveccent <- mean(ccent)
        ccentstore[i] <- aveccent
      
      #Edge Betweenness
        ebetween <- edge_betweenness(graph,
                                     e = E(graph),
                                     directed = F,
                                     weights = NULL)
        aveebetween <- mean(ebetween)
        ebetweenstore[i]<- aveebetween
      
      #Local Transitivity Average  
        loctran <- transitivity(graph,
                                type = c("localundirected"),
                                weights = NULL,
                                isolates = c("zero"))
        aveloctran <- mean(loctran)
        loctranstore[i] <- aveloctran
      
      #Density
        density <- edge_density(graph,
                                loops = F)
        densitystore[i] <- density

      #Diameter
        diameter_value <- diameter(graph,
                                   directed=F,
                                   unconnected=F,
                                   weights=NULL)
        diameterstore[i] <- diameter_value
      
      #Radius
        radius_value <- radius(graph)
        radiusstore[i] <- radius_value
      
      #Global Transmitivity
        globtran <- transitivity(graph,
                                 type = c("globalundirected"),
                                 vids=NULL,
                                 weights = NULL,
                                 isolates = c("zero"))
        globtranstore[i]<-globtran
  }


  filetype <- c('AveDegree',
                'AveGeoDist',
                'AveEccent',
                'AveBCent',
                'AveCCent',
                'AveEBetween',
                'AveLocTran',
                'AveDensity',
                'Diameter',
                'Radius',
                'AveGlobTran')
  
  fullfilename <- vector()
  
  #for loop to create file names
  for (f in seq(1,length(filetype),1)){  
    #name of file that's to be outputted
    filename0 <- filetype[f]
    filename1 <- 'Simulation'
    filename2 <- toString(simulationnumber)
    filename3 <- 'Stepsize'
    filename4 <- toString(stepsize,NULL)
    filename5 <- '.csv'
  
    fullfilename[f] <- paste0(filename0, filename1, filename2, filename3, filename4, filename5)
  }  

  #export data as csv files, probably should be redone in for loop
  write.csv(degstore, file=fullfilename[1])
  write.csv(distancestore, file=fullfilename[2])
  write.csv(eccentstore,file=fullfilename[3])
  write.csv(bcentstore, file=fullfilename[4])
  write.csv(ccentstore,file=fullfilename[5])
  write.csv(ebetweenstore,file=fullfilename[6])
  write.csv(loctranstore,file=fullfilename[7])
  write.csv(densitystore,file=fullfilename[8])
  write.csv(diameterstore,file=fullfilename[9])
  write.csv(radiusstore,file=fullfilename[10])
  write.csv(globtranstore,file=fullfilename[11])

  #the data in the workspace takes up a lot of memory so it is cleared here before moving onto the next iteration with the exception of a few objects
  ls()[!(ls() %in% c('simulationvector','directoryname0', 'directoryname2','stepsize'))]
  rm(list= ls()[!(ls() %in% c('simulationvector','directoryname0', 'directoryname2','stepsize'))])
}