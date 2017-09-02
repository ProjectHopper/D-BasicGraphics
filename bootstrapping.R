##############################################################

# Bootstrap 95% CI for R-Squared
library(boot)
# function to obtain R-Squared from the data 
rsq <- function(formula, data, indices) {
  d <- data[indices,] # allows boot to select sample 
  fit <- lm(formula, data=d)
  return(summary(fit)$r.square)
} 
##############################################################

# bootstrapping with 1000 replications 
results <- boot(data=mtcars, statistic=rsq, 
  	 R=1000, formula=mpg~wt+disp)

# view results
results 
plot(results)

# get 95% confidence interval 
boot.ci(results, type="bca")

##############################################################
# Bootstrapping several Statistics (k>1)
#  - In example above, the function rsq returned a number and boot.ci returned a single confidence interval. 
#  - The statistics function you provide can also return a vector. 
#  - In the next example we get the 95% CI for the three model regression coefficients (intercept, car weight, displacement). 
#  - In this case we add an index parameter to plot( ) and boot.ci( ) to indicate which column in bootobject$t is to analyzed.

##############################################################
# Bootstrap 95% CI for regression coefficients 
library(boot)
# function to obtain regression weights 
bs <- function(formula, data, indices) {
  d <- data[indices,] # allows boot to select sample 
  fit <- lm(formula, data=d)
  return(coef(fit)) 
} 
# bootstrapping with 1000 replications 
results <- boot(data=mtcars, statistic=bs, 
  	 R=1000, formula=mpg~wt+disp)

# view results
results
plot(results, index=1) # intercept 
plot(results, index=2) # wt 
plot(results, index=3) # disp 

##############################################################

# get 95% confidence intervals 
boot.ci(results, type="bca", index=1) # intercept 
boot.ci(results, type="bca", index=2) # wt 
boot.ci(results, type="bca", index=3) # disp




