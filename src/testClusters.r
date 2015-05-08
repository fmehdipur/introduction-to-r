source('./distance.r')
source('./clusters.r')

v1 = c(1,4,7,8)
v2 = c(2,5,9,10)
v3 = c(3,6,11,12)
vdf = data.frame(v1, v2, v3)
#Ranges 
Ranges = data.frame() 
for( i in 1:dim(vdf)[1]){
  temp = data.frame(c(min(vdf[i,]), max(vdf[i,])))
  Ranges = c(Ranges, temp)
  rm(temp)
}

NumberOfRows = dim(vdf)[1]
runif(NumberOfRows)*Ranges[[1]]
UniformVariates = runif(prod(dim(vdf)), min=0.0, max=1.0)

clusters = data.frame() 
k = 4
for( i in 1:k){
  clusters = c(clusters, data.frame(runif(k)*Ranges[[1]]))
}

#clusters=[[random.random()*(ranges[i][1]-ranges[i][0])+ranges[i][0] 
#           for i in range(len(vv1[0]))] for j in range(4)]



#[m for m in (vdf[i,] for i in 1:dim(vdf)[1]) if m]
#ranges = [(min([v[i] for v in vv1]), max([v[i] for v in vv1]))
#for i in range(len(vv1[0]))]

#[m for m in (1:p for p in 1:3) if m]


