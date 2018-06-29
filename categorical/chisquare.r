
library(MASS)       # load the MASS package 

tbl = table(survey$Smoke, survey$Exer) 

# the contingency table 
tbl 


class(survey$Smoke)

# Sort the factors

levels(survey$Smoke)=c('Never','Occas','Regul','Heavy')
levels(survey$Exer)=c('None','Some','Freq')

# Lets see the contingency table again
tbl = table(survey$Smoke, survey$Exer)
tbl

prop.table(tbl) 

options(digits=3)

prop.table(tbl,1) 

prop.table(tbl,2) 

chisq.test(survey$Smoke, survey$Exer) 

# Notice the small cell sizes

chisq.test(tbl) 

ctbl = cbind(tbl[,"Freq"], tbl[,"None"] + tbl[,"Some"]) 
ctbl 

# Dont throw out the raw data,make a 'derived variable' instead.
survey$Exer2 <- survey$Exer

levels(survey$Exer2) <- list(Rare = c('None','Some'),Freq = 'Freq')



table(survey$Smoke,survey$Exer2)


