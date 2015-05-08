#Install any required packages. 
#install.packages("mvtnorm")
#Load the library
library(mvtnorm) 
library(lattice)
options(scipen = 999, digits=2)

#Import the data
KidCreative = read.csv("../data/KidCreative.csv", header=TRUE)

#Understand the data structure and basic characteristics
#str(KidCreative)
head(KidCreative)
#summary(KidCreative)

#Determine the Beta Coefficients
n = length(KidCreative$Buy)
Dependent = KidCreative$Buy
Independent = cbind(rep(1,n), KidCreative$Income, KidCreative$Is.Female,
                  KidCreative$Is.Married, KidCreative$Has.College, KidCreative$Is.Professional, KidCreative$Is.Retired,
                  KidCreative$Unemployed, KidCreative$Residence.Length, KidCreative$Dual.Income,
                  KidCreative$Minors, KidCreative$Own, KidCreative$House, KidCreative$Is.USBorn,
                  KidCreative$English, KidCreative$Prev.Child.Mag, KidCreative$Prev.Parent.Mag)

p = dim(Independent)[2]
xx = matrix(Independent, n, p)

beta = solve(t(xx) %*% xx) %*% t(xx) %*% Dependent
Beta.Frame = data.frame(t(beta))
colnames(Beta.Frame) = colnames(KidCreative)
Beta.Frame$Buy <- NULL
str(Beta.Frame)

#Determine the expected response based on the model
beta.vec = as.vector(beta)
Expected = rep(0,n)
for(i in 1:n){
  Expected[i] = sum(xx[i,1:p]*beta.vec)
}

#Compare the expected and observed values
Observed = KidCreative$Buy
Error = rep(0,n)
for(i in 1:n){
  Error[i] = (Observed[i]-Expected[i])
}

#Compare the total values
table(Observed)
table(round(Expected))
table(abs(round(Error)))

#Determine an unbiased estimate of variance
SSE = sum(Error^2)
sigma.hat=sqrt(SSE/(n-2))
paste0("Error: ",toString(sigma.hat^2))

#Validate the model 
qq(Observed~Expected, ylab="Expected", xlab="Observed")

#Predictions, Analysis, and Observations
#2D Example
means = apply(Independent, 2,function(x) mean(x))
stds = apply(Independent, 2, function(x) sd(x))

set.seed(123)
NewSurveys = rmvnorm( n = 5, mean = means, sigma = cov(Independent))
NewResponses = apply(NewSurveys, 1, function(x) 
    round(sum(x*beta.vec)))

SamplePredictions = data.frame(round(NewSurveys),NewResponses)
colnames(SamplePredictions) = c( "Identity"
                                ,colnames(KidCreative)[2:p] 
                                ,"Prediction")

SamplePredictions

