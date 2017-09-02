library(MASS)
data(survey)
head(survey)

names(survey)

survey$Smoke

class(survey$Smoke)
mode(survey$Smoke)
levels(survey$Smoke)
