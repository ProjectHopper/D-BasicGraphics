getwd()
#############################################################################################
# load the data into R
idahoData <- read.csv("ss06hid.csv", header=TRUE)
# are we sure it's just Idaho data?
table(idahoData$ST)
dim(idahoData)

head(idahoData)
head(idahoData)[,1:10]

summary(idahoData[,1:10])

##############################################################################################


table(idahoData$TYPE)
names(idahoData)
summary(idahoData[,11:30])

str(idahoData[,11:50])

##############################################################################################

summary(idahoData$ST)
# How many housing units [are] worth more than $1,000,000?
table(idahoData$TYPE,idahoData$VAL)

##############################################################################################

# How many households have 3 bedrooms and and 4 total rooms?
# How many households have 2 bedrooms and 5 total rooms?
# How many households have 2 bedrooms and 7 total rooms?

table(idahoData$RMS,idahoData$BDS,dnn=list("RMS","BDS"))

##############################################################################################

# How many households have 3 bedrooms and 4 total rooms?
nrow(idahoData[!is.na(idahoData$BDS) & idahoData$BDS==3 &
!is.na(idahoData$BDS) & idahoData$RMS==4,])
# How many households have 2 bedrooms and 5 total rooms?
nrow(idahoData[!is.na(idahoData$BDS) & idahoData$BDS==2 &
!is.na(idahoData$BDS) & idahoData$RMS==5,])
# How many households have 2 bedrooms and 7 total rooms?
nrow(idahoData[!is.na(idahoData$BDS) & idahoData$BDS==2 &
!is.na(idahoData$BDS) & idahoData$RMS==7,])
6
