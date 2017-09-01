# Capital Punishment Data Sets
Cappun <- read.csv('https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/cappun.csv')

###################
# Superworld Data Set
SW <- read.csv('https://raw.githubusercontent.com/RWorkshop/SuperWorld/master/Version1/Superworld.csv')

###################

install.packages('MethComp') # Systolic Blood Pressure
install.packages('outliers')
install.packages('nortest')
install.packages('broom')
###############################

library(MASS)

Sigma <- matrix(c(9,8,8,25),2,2)
HW <- data.frame(mvrnorm(n = 5000, c(55, 170), Sigma))

#####################################
source('https://gist.githubusercontent.com/DragonflyStats/e99b44fa0b256947dd8eef60f41dedc2/raw/58d95e913c1d68578fe11a5f9fd5a22793dbe257/MA4605LabClasses.R')
