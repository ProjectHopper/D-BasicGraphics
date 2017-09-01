
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
