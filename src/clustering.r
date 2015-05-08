#Install any required packages. 
#install.packages("fpc")
#install.packages("pvclust")

#Load the library
library(fpc)
library(pvclust)
library(cluster) 
options(scipen = 999, digits=2)

#Import the data
KidCreative = read.csv("../data/KidCreative.csv", header=TRUE)

#--------------------------------------------------
#Identify groups within the data
#Hierarchical Clustering with Bootstrapped p values
hclust <- pvclust(KidCreative, method.hclust="average",
                   method.dist="cor")


#Plot cluster models by creating dendograms with p-values
#and adding rectangles around groups with p-values within 1-alpha(%)
plot(hclust) 
pvrect(hclust, alpha=.95)




# K-Means Cluster Analysis
set.seed(123)
KidCreative = scale(KidCreative)
k = 3

fit <- kmeans(KidCreative, k)
#Print the locations of the k means
aggregate(KidCreative,by=list(fit$cluster),FUN=mean)
# append cluster number assigned by record
KidCreative <- data.frame(KidCreative, fit$cluster)

# Cluster Plot against 1st 2 principal components
clusplot(KidCreative, fit$cluster, color=TRUE, shade=FALSE, 
         labels=0, lines=0)


