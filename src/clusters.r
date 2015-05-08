source('./distance.r')

kcluster <- function(rows, distance = pearson, k=4){
  #Determine the minimum and maximum values for each point
  NumberOfRows = dim(rows)[1]
  NumberOfColumns = dim(rows)[2]
  Ranges = list() 
  for( i in 1:NumberOfRows){
    temp = list(c(min(rows[i,]), max(rows[i,])))
    Ranges = c(Ranges, temp)
    rm(temp)
  }
  #Create k randomly-placed centroids
  clusters = data.frame()
  for ( i in 1:k) clusters  =c(clusters, data.frame(runif(k)*Ranges[[i]]))
  
  lastMatches = data.frame()
  for (t in 1:1){
    print(c("Iteration ",t))
    bestmatches = data.frame()
    
    #Find the centroid closest to each row
    for (j in 1:NumberOfColumns){
      row = rows[[j]]
      bestmatch = 1 
      for( i in 1:k){
        d = distance(clusters[[i]], row)
        if(d < distance(clusters[[bestmatch]], row)) bestmatch = i
        }
      bestmatches = c(bestmatches, bestmatch)
      }
    if(bestmatches == lastmatches) break 
    lastmatches = bestmatches
    print(bestmatches)
    }
}
  

bicluster <- setRefClass(
  "bicluster",
  fields = list(
    self, 
    vec, 
    left, 
    right,
    distance,
    id
  ),
  methods = list(
    initialize = function()
    {
    }
  )
)

kcluster <- function(rows, distance = pearson){
}

getheight <- function(clust){
}

getdepth <- function(clust){
}

drawnode <- function(draw, clust, x, y, scaling, labels){
}

drawdendogram <- function(clust, labels, jgeg="clusters.jpg"){
}