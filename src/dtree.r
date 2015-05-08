#Install any required packages. 
#install.packages("rpart")

#Load the library
library(rpart)
options(scipen = 999, digits=2)

#Import the data
KidCreative = read.csv("../data/KidCreative.csv", header=TRUE)

#--------------------------------------------------
#Creating decision trees

tree1 <- rpart(Buy~Income  +Is.Married + Is.USBorn, 
               method="anova", data=KidCreative)

#Displays the statistics collected during the tree creation. 
printcp(tree1)


# plot tree 
par(xpd = TRUE, mar=c(1,1,2,1), oma=c(1,1,1,1))
plot(tree1, uniform = TRUE, compress=TRUE
     ,main="KidCreative Decision Tree 1")
text(tree1, use.n=TRUE,digits=2, cex=.9)


