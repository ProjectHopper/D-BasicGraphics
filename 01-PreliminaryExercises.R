# tidyverse packages
library(dplyr)
library(tidyr)
library(magrittr)

library(MethComp) # We are going to use a dataset from this package.
#######################################################
# A Range of integers

1:10

# Simulate One Roll

sample(1:6,1)                #  sample(Pop,n)

runif(1,0,6)		     #  runif(n,l,u)
runif(1,0,6) %>% ceiling()   
runif(1,1,7) %>% floor()    


sample(1:6,100)              # Error

sample(1:6,100,replace=TRUE)         	      # Replace = TRUE : sampling with replacement

sample(1:6,100,replace=TRUE) %>% sum()        
# Remark - This is a fair dice


#######################################################

# Crooked Dice : biased in favour of "Six"

sample(1:6,100,prob = c(1/7,1/7,1/7,1/7,1/7,2/7), replace=TRUE) %>% sum()        

#######################################################


# Basic For Loop

for ( i in 1:10) { 

    print(i)

    }

#######################################################

# Repeated the experiment 1000 times, and collect the results

myDiceSums <- numeric()         # empty container

for ( i in 1:1000) { 

    mySum <- sample(1:6,100,replace=TRUE) %>% sum() 

    myDiceSums <- c(myDiceSums, mySum)

    }


########################################################

summary(myDiceSums)
mean(myDiceSums)
median(myDiceSums)

# Base graphics : not pretty, but good for a quick look

hist(myDiceSums)
hist(myDiceSums, breaks=25)

# Shape: Bell-shaped

boxplot(myDiceSums, horizontal = TRUE)

########################################################

# How many values are over 400? how many less than 300?

sum(myDiceSums>400)
mean(myDiceSums>400)

########################################################

# Exercises
# Run the code from the last section again, this time for 100 thousand iterations
# See how those values change 


# Repeat this exercise for our crooked die 
# How many values are over 400? how many less than 300?

########################################################
