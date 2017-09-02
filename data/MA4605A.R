# Lab A (Week 1)

X = c(0.07, 0.07,0.08,0.07,0.07,0.08,0.08,0.09,0.08)

###################

# Lab B

UVSA <- c(84.63,84.38,84.08,84.41,83.82,83.55,83.92,83.69,84.06,84.03)
NIRS <- c(83.15,83.72,83.84,84.20,83.92,84.16,84.02,83.60,84.13,84.25)

t.test(UVSA)
t.test(UVSA, conf.level = 0.95)

t.test(UVSA, conf.level = 0.99)
t.test(NIRS)

t.test(NIRS, conf.level = 0.95)
t.test(NIRS, conf.level = 0.99)

Diffs = UVSA - NIRS

t.test(Diffs)

t.test(UVSA, NIRS, paired= TRUE)
###################
# Lab C
Dist = c(1.4,3.8,7.5,10.2,11.7,15.0)
Merc = c(2.4,2.5,1.3,1.3,0.7,1.2)
# compute the correlation coefficient
cor(Dist, Merc)
cor.test(Dist,Merc)
# create a scatterplot
# plot(Dist, Merc)
#--------------------------------------------#
# create a linear model
myModel = lm(Merc~Dist)
summary(myModel)
coef(myModel)
# enhanced scatterplot

# plot(Dist, Merc, pch=16, col='red', cex=1.5)
# title('Scatterplot')
# abline(coef(myModel))

# This adds a line to the scatterplot

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
# Call it something like 'RegModel' or 'myNewModel2'
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



# FitA = lm(Taste ~ Acetic); 
# FitB = lm(Taste ~ H2S); 
# FitC = lm(Taste ~ Lactic)

# Fit1 = lm(Taste ~ Acetic + H2S); 
# Fit2 = lm(Taste ~ Acetic + Lactic);
# Fit3 = lm(Taste ~ H2S + Lactic);
# FitAll = lm(Taste ~ Acetic + H2S + Lactic)
###################
# Lab E

Fit1 = lm(Taste ~ Acetic + H2S)
Fit2 = lm(Taste ~ Acetic + Lactic)
Fit3 = lm(Taste ~ H2S + Lactic)
FitAll = lm(Taste ~ Acetic + H2S + Lactic)

Fit2res = resid(Fit2)
# Type in "Fit2res" to get a sense of the data.

#--------------------------------------------#

# plot(Fit2)
# Hit Return after inspecting each screen

# plot(Fit2, which=c(1))
# plot(Fit2, which=c(2))
# plot(Fit2, which=c(3))
# plot(Fit2, which=c(4))
# plot(Fit2, which=c(5))
# plot(Fit2, which=c(6)) 



# cooks.distance(Fit2)

# Make it easier to read the output
# specify 6 decimal places only.

# round( cooks.distance(Fit2) ,6)


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
