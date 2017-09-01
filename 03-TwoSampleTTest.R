
################################################################

X=c(16.38,16.41,16.52,16.58,16.59,16.84,16.94,17.03,17.14,17.21)
Y=c(16.60,16.70,16.88,16.98,17.00,17.08,17.13,17.27,17.34,17.39)


t.test(X,Y)

var.test(X,Y)

t.test(X,Y,var.equal=TRUE)

################################################################

myTrueMean1 <- sample(95:105,1)
myTrueMean2 <- sample(95:105,1)

myTrueVars <- c(10,15,20,25,30)

# Dont Look !!

myPop1 <- rnorm(25000,myTrueMean1,sample(myTrueVars,1))

# N.B. Same Variance of 20

mySamp1 <- sample(myPop1,30)
mySamp2 <- sample(myPop2,30)
