# Lab A (Week 1)

X = c(0.07, 0.07,0.08,0.07,0.07,0.08,0.08,0.09,0.08)

###################

# Lab B

UVSA = c(84.63,84.38,84.08,84.41,83.82) 
NIRS = c(83.15,83.72,83.84,84.20,83.92,84.16, 84.02)

t.test(UVSA)
t.test(UVSA, conf.level = 0.95)

t.test(UVSA, conf.level = 0.99)
t.test(NIRS)
t.test(NIRS, conf.level = 0.95)
t.test(NIRS, conf.level = 0.99)

CWdiff = UVSA - NIRS

t.test(UVSA, NIRS, paired= TRUE)
###################
# Lab C
Dist = c(1.4,3.8,7.5,10.2,11.7,15.0)
Merc = c(2.4,2.5,1.3,1.3,0.7,1.2)
# compute the correlation coefficient
cor(Dist, Merc)
cor.test(Dist,Merc)
# create a scatterplot
plot(Dist, Merc)
#--------------------------------------------#
# create a linear model
myModel = lm(Merc~Dist)
summary(myModel)
coef(myModel)
# enhanced scatterplot
plot(Dist, Merc, pch=16, col=”red”, cex=1.5)
title(“Scatterplot”)
abline(coef(myModel))
#This adds a line to the scatterplot

#--------------------------------------------#
# Little Trick
# What does this line of code do?
1:5
#and this one?
(1:5)*2
Gluc = c(0,2,4,5,8,10)
Abs1 = c(0.002,0.150,0.294,0.434,0.570,0.704)


#--------------------------------------------#
Conc = c(10,15,20,25,30,0,5)
Abs2 = c(0.251,0.390,0.498,0.625,0.763,0.003,0.127)
# hint: fit a regression model
# Call it something like “RegModel” or “myNewModel2”
# use the commands summary(), coef() and confint()



#--------------------------------------------#
Gold = c(30,40,50,60,70,0,10,20)
Absrb= c(0.413,0.468,0.528,0.574,0.635,0.257,0.314,0.364)
lm(Absrb ~ Gold)
summary(lm(Absrb ~ Gold))
# look at summary output for asterisk signs

# Lab D

Taste = c(12.3, 20.9, 39, 47.9, 5.6, 25.9, 37.3, 21.9, 18.1, 21, 34.9, 
57.2, 0.7, 25.9, 54.9, 40.9, 15.9, 6.4, 18, 38.9, 14, 15.2, 32, 
56.7, 16.8, 11.6, 26.5, 0.7, 13.4, 5.5);
Lactic = c(0.86, 1.53, 1.57, 1.81, 0.99, 1.09, 1.29, 1.78, 1.29, 1.58, 
1.68, 1.9, 1.06, 1.3, 1.52, 1.74, 1.16, 1.49, 1.63, 1.99, 1.15, 
1.33, 1.44, 2.01, 1.31, 1.46, 1.72, 1.25, 1.08, 1.25);
H2S =c(3.135, 5.043, 5.438, 7.496, 3.807, 7.601, 8.726, 7.966, 3.85, 
4.174, 6.142, 7.908, 2.996, 4.942, 6.752, 9.588, 3.912, 4.7, 
6.174, 9.064, 4.949, 5.22, 9.242, 10.199, 3.664, 3.219, 6.962, 
3.912, 6.685, 4.787);
Acetic=c(4.543, 5.159, 5.366, 5.759, 4.663, 5.697, 5.892, 6.078, 4.898, 
5.242, 5.74, 6.446, 4.477, 5.236, 6.151, 6.365, 4.787, 5.412, 
5.247, 5.438, 4.564, 5.298, 5.455, 5.855, 5.366, 6.043, 6.458, 
5.328, 5.802, 6.176);



FitA = lm(Taste ~ Acetic); 
FitB = lm(Taste ~ H2S); 
FitC = lm(Taste ~ Lactic)

Fit1 = lm(Taste ~ Acetic + H2S); 
Fit2 = lm(Taste ~ Acetic + Lactic);
Fit3 = lm(Taste ~ H2S + Lactic);
FitAll = lm(Taste ~ Acetic + H2S + Lactic)
###################
# Lab E

Fit1 = lm(Taste ~ Acetic + H2S)
Fit2 = lm(Taste ~ Acetic + Lactic)
Fit3 = lm(Taste ~ H2S + Lactic)
FitAll = lm(Taste ~ Acetic + H2S + Lactic)

Fit2res = resid(Fit2)
# Type in "Fit2res" to get a sense of the data.

#--------------------------------------------#

plot(Fit2)
# Hit Return after inspecting each screen

plot(Fit2, which=c(1))

plot(Fit2, which=c(2))

plot(Fit2, which=c(3))

plot(Fit2, which=c(4))

plot(Fit2, which=c(5))

plot(Fit2, which=c(6)) 



cooks.distance(Fit2)
# Make it easier to read the output
# specify 6 decimal places only.
round( cooks.distance(Fit2) ,6)


#--------------------------------------------#
library(MASS)
Fit2.rr = rlm(Taste ~ Acetic + Lactic)
summary(Fit2.rr)

Weights( Fit2.rr)

#--------------------------------------------#

ISE = c(108,12,152,3,106,11,128,12,160,128)

Grav = c(105,16,113,0,108,11,141,11,182,118)

lm(ISE ~ Grav)
summary(lm(Grav ~ ISE))
# look at summary output for asterisk signs


#--------------------------------------------#
#Standard Additions
Gold = c(30,40,50,60,70,0,10,20)
Absrb= c(0.413,0.468,0.528,0.574,0.635,0.257,0.314,0.364)
lm(Absrb ~ Gold)
summary(lm(Absrb ~ Gold))
# look at summary output for asterisk signs
###############################################

###################
# Lab F
Conc=c( 0, 5, 10, 15, 20, 25, 30)
Abso=c( 0.003, 0.127, 0.251, 0.390, 0.498, 0.625, 0.763)

FitA = lm(Abso~Conc)
summary(FitA)
confint(FitA)

preds = predict(FitA)
resids = resid(FitA)

length(Abso)
mean(Abso)
Abso-mean(Abso)
(Abso-mean(Abso))^2
TSS = sum((Abso-mean(Abso))^2)
TSS

# FitA
# confint(FitA)
# AIC(FitA)
# cor(Conc,Abso)
# cor.test(Conc,Abso)
# summary(FitA)
# var(Abso)
var(Abso)
var(Abso) *(7-1)
cor(Conc,Abso)
cor(Conc,Abso)^2
plot(FitA)
######################################
## Lab G
y1 = c(23, 23, 20, 21);
y2 = c(27, 29, 25, 23, 24);
y3 = c(24, 26, 24);
y = c(y1, y2, y3)
;

group = c(1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3)
#Alternative Approach – Useful for larger data sets
group = c(rep(1,4),rep(2,5),rep(3,3))


group = factor(group)
flordata = data.frame(y,group)

a = c(84.55, 84.61, 84.26, 84.36, 84.66, 84.31, 84.65, 84.41, 84.52, 84.44)
b = c(84.12, 84.04, 83.95, 84.51, 84.08, 84.07, 84.35, 83.99, 84.25, 84.14)
c = c(84.44, 84.48, 84.14, 84.17, 84.31, 84.60, 84.44, 84.24, 84.64, 84.47)
d = c(84.05, 84.14, 84.53, 84.07, 84.45, 83.95, 84.10, 84.29, 84.13, 83.98)
e = c(84.09, 84.53, 84.60, 84.48, 84.42, 84.57, 84.35, 84.30, 84.37, 84.63)
y = c(a, b, c, d,e)
group = rep(1:5, each = 10)
group
group = factor(group)

paracetamol = data.frame(y, group)
model = aov(y ~ group,paracetamol)

##############################################

# Lab H
Perc=c(16.03,16.13,16.09,16.05,16.13,16.15,16.02,15.94,16.12,16.12,15.97,16.10); 
Sol=c(rep("1",3),rep("2",3),rep("3",3),rep("4",3)); 
Meth=c(rep(c("A","B","C"),4)); 
Sol=factor(Sol,c("1","2","3","4"));
Meth=factor(Meth,c("A","B","C"));
#-----------------------------------------------------------#

Results=aov(Perc~Sol+Meth); 
summary(Results);

#-----------------------------------------------------------#
Perc2=c(16.05, 16.19, 16.13, 16.08, 16.17, 16.17, 16.05, 15.98, 16.15, 16.15, 15.99, 16.15); 
Perc.new=c(Perc,Perc2); 
Sol=rep(Sol,2); Meth=rep(Meth,2);
#-----------------------------------------------------------#
Results.B=aov(Perc.new~Sol+ Meth); 
summary(Results.B);
#-----------------------------------------------------------#
Results.C=aov(Perc.new~Sol + Meth + Sol:Meth); 
summary(Results.C); 
interaction.plot(Sol,Meth,Perc.new);
##############################################################
# Lab I  - Week 10 

# Main Effects
# A is Concentration 
# B is Agitation
# C is Temperature

A = c("L","H","L","H","L","H","L","H","L","H","L","H","L","H","L","H");
B = c("L","L","H","H","L","L","H","H","L","L","H","H","L","L","H","H");
C = c("L","L","L","L","H","H","H","H","L","L","L","L","H","H","H","H");

A=factor(A,levels=c("L","H"));B=factor(B,levels=c("L","H"));C=factor(C,levels=c("L","H"));
y=c(38, 40, 23, 25, 85, 56, 20, 20, 30, 62, 45, 30, 89, 75, 53, 20);

# visualize data in long form
cbind(y,A,B,C);


Model2 = aov(y~A*B*C);
summary(Model2);

interaction.plot(A,B,y);
interaction.plot(A,C,y);
interaction.plot(B,c,y);

###################################################################################
## Lab J

library(tidyr)
library(qcc)
data(pistonrings)
attach(pistonrings)
summary(pistonrings)
# pistonrings
#------------------------------------------------------------------------#
Reps<-rep(c("R1","R2","R3","R4","R5"),40)
SPCData <- data.frame(pistonrings,Reps)
SPCData <- spread(SPCData,Reps,diameter)
SPCData <- SPCData[,-1]
SPCData <- SPCData[,-1]
set.seed(1452);SPC2 <- sample(rbind(SPCData,SPCData,SPCData[1:20,]))
#------------------------------------------------------------------------#
set.seed(1126);SPC3<-2*round(SPC2+ matrix(rnorm(500)/5,nrow=100),3)+2
set.seed(2345);SPC4<-2*round(SPC2+ matrix(rnorm(500)/4,nrow=100),3)
set.seed(3456);SPC5<-1.5*round(SPC2+ matrix(rnorm(500)/3,nrow=100),3)
set.seed(4567);SPC6<-2*round(SPC2+ matrix(rnorm(500)/2.6,nrow=100),3)
set.seed(5678);SPC7<-2.1*round(SPC2+ matrix(rnorm(500)/1.5,nrow=100),3)
set.seed(2345);SPC8<-2*round(SPC2+ matrix(rnorm(500)/4.2,nrow=100),3)
set.seed(3416);SPC9<-2.5*round(SPC2+ matrix(rnorm(500)/3.2,nrow=100),3)
set.seed(4920);SPC10<-2*round(SPC2+ matrix(rnorm(500)/2.4,nrow=100),3)
set.seed(5371);SPC11<-3*round(SPC2+ matrix(rnorm(500)/1.5,nrow=100),3)
set.seed(4947);SPC12<-2*round(SPC2+ matrix(rnorm(500)/2,nrow=100),3)
set.seed(5388);SPC13<-3.1*round(SPC2+ matrix(rnorm(500)/1.5,nrow=100),3)
set.seed(2365);SPC14<-2*round(SPC2+ matrix(rnorm(500)/4.2,nrow=100),3)
set.seed(3256);SPC15<-2.5*round(SPC2+ matrix(rnorm(500)/3.2,nrow=100),3)
set.seed(1927);SPC16<-2*round(SPC2+ matrix(rnorm(500)/2.4,nrow=100),3)
set.seed(5318);SPC17<-3.5*round(SPC2+ matrix(rnorm(500)/1.5,nrow=100),3)
set.seed(4127);SPC18<-2.8*round(SPC2+ matrix(rnorm(500)/2,nrow=100),3)
set.seed(5378);SPC19<-3.3*round(SPC2+ matrix(rnorm(500)/1.5,nrow=100),3)
################################################################
