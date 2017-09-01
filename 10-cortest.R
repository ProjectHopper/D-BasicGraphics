

myXpop <- rnorm(10000,100,10)
myYpop <- rnorm(10000,100,10)

cor(myXpop,myYpop)

#-------------------------------------------#

n <- 15

myXsample <- sample(myXpop,n)
myYsample <- sample(myYpop,n)

cor(myXsample,myYsample)

#-------------------------------------------#
myRandCor <- function(n=15){
 myXsample <- sample(myXpop,n)
 myYsample <- sample(myYpop,n)
 return(cor(myXsample,myYsample))
}

# This function will only work if the populations are present
# in the environment

myRandCor()

#-------------------------------------------#

myCors <-numeric()

for (i in 1:10000){
  myCors <- c(myCors,myRandCor())
  myCors <- sort(myCors)
  }


mean (myCors > 0.5)
mean(myCors < -0.5
#--------------------------------------------#

hist(myCors,breaks=100)
abline(v=-0.25,col='red',lty=1)
abline(v=0.25,col='red',lty=1)
abline(v=-0.5,col='red',lty=2)
abline(v=0.5,col='red',lty=2)
