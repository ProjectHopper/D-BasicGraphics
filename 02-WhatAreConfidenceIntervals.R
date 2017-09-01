myPop = sample(750:1250,100000,TRUE)
mean(myPop)
mySample = sample(myPop,20)
mean(mySample)
t.test(mySample)
mySample = sample(myPop,25)
t.test(mySample)
names(t.test(mySample))
t.test(mySample)$conf.int
t.test(mySample)$conf.int[1]
t.test(mySample)$conf.int[2]
#################################################3

myTrueMean <- sample(95:105,1)

# Dont Look !!

myPop <- rnorm(25000,myTrueMean,20)

mySamp <- sample(myPop,30)

t.test(mySamp,mu=100)

myTestObject <- t.test(mySamp,mu=100)

class(myTestObject)
names(myTestObject)

myTestObject$conf.int

LL <- myTestObject$conf.int[1]
UL <- myTestObject$conf.int[2]

library(dplyr)

between(myTrueMean,LL,UL)


myResult <- numeric()

for (i in 1:10000){
 mySamp <- sample(myPop,30)
 myTestObject <- t.test(mySamp,mu=100)
 LL <- myTestObject$conf.int[1]
 UL <- myTestObject$conf.int[2]
 myResult <- c(myResult, between(myTrueMean,LL,UL) )
}
