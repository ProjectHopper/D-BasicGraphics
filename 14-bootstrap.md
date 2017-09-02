
Nonparametric Bootstrapping
=========================================
The boot package provides extensive facilities for bootstrapping and related resampling methods. You can bootstrap a single statistic (e.g. a median), or a vector (e.g., regression weights). This section will get you started with basic nonparametric bootstrapping.

The main bootstrapping function is boot( ) and has the following format:
<pre><code>
bootobject <- boot(data= , statistic= , R=, ...) where
</code></pre>

#### parameter description

* ***data***	A vector, matrix, or data frame
* ***statistic***	A function that produces the k statistics to be bootstrapped (k=1 if bootstrapping a single statistic). 
The function should include an indices parameter that the boot() function can use to select cases for each replication (see examples below).
* ***R***	Number of bootstrap replicates
* ...	Additional parameters to be passed to the function that produces the statistic of interest

boot( ) calls the statistic function R times. Each time, it generates a set of random indices, with replacement, from the integers 1:nrow(data). These indices are used within the statistic function to select a sample. The statistics are calculated on the sample and the results are accumulated in the bootobject. The bootobject structure includes

### element	description
t0	The observed values of k statistics applied to the orginal data.
t	An R x k matrix where each row is a bootstrap replicate of the k statistics.
You can access these as bootobject$t0 and bootobject$t.

Once you generate the bootstrap samples, print(bootobject) and plot(bootobject) can be used to examine the results. If the results look reasonable, you can use boot.ci( ) function to obtain confidence intervals for the statistic(s).

The format is
<pre><code>
boot.ci(bootobject, conf=, type= ) where
</code></pre>
### parameter	description
bootobject	The object returned by the boot function
conf	The desired confidence interval (default: conf=0.95)
type	The type of confidence interval returned. Possible values are "norm", "basic", "stud", "perc", "bca" and "all" (default: type="all")
Bootstrapping a Single Statistic (k=1)
The following example generates the bootstrapped 95% confidence interval for R-squared in the linear regression of miles per gallon (mpg) on car weight (wt) and displacement (disp). The data source is mtcars. The bootstrapped confidence interval is based on 1000 replications.

<pre><code>
# Bootstrap 95% CI for R-Squared
library(boot)
# function to obtain R-Squared from the data 
rsq <- function(formula, data, indices) {
  d <- data[indices,] # allows boot to select sample 
  fit <- lm(formula, data=d)
  return(summary(fit)$r.square)
} 
# bootstrapping with 1000 replications 
results <- boot(data=mtcars, statistic=rsq, 
  	 R=1000, formula=mpg~wt+disp)

# view results
results 
plot(results)

# get 95% confidence interval 
boot.ci(results, type="bca")

</code></pre>

#### Bootstrapping several Statistics (k>1)
In example above, the function rsq returned a number and boot.ci returned a single confidence interval. The statistics function you provide can also return a vector. In the next example we get the 95% CI for the three model regression coefficients (intercept, car weight, displacement). In this case we add an index parameter to plot( ) and boot.ci( ) to indicate which column in bootobject$t is to analyzed.
<pre><code>
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


results
plot(results, index=1) # intercept 
plot(results, index=2) # wt 
plot(results, index=3) # disp 

# get 95% confidence intervals 
boot.ci(results, type="bca", index=1) # intercept 
boot.ci(results, type="bca", index=2) # wt 
boot.ci(results, type="bca", index=3) # disp
</code></pre>


#### Going Further
* The boot( ) function can generate both nonparametric and parametric resampling. For the nonparametric bootstrap, resampling methods include ordinary, balanced, antithetic and permutation. For the nonparametric bootstrap, stratified resampling is supported. Importance resampling weights can also be specified.

* The boot.ci( ) function takes a bootobject and generates 5 different types of two-sided nonparametric confidence intervals. These include the first order normal approximation, the basic bootstrap interval, the studentized bootstrap interval, the bootstrap percentile interval, and the adjusted bootstrap percentile (BCa) interval.

