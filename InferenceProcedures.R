# - prop.test
#        prop.test can be used for testing the null that the proportions (probabilities of success) in several groups are the same, or that they equal certain given values.
# - Kolmogorov-Smirnov test      [ks.test()]
#	       Performs one or two sample Kolmogorov-Smirnov tests. 
# - Anderson Darling test        [ad.test()]
# - Grubbs test for outliers     [Grubbs.test()]
# - Dixon test for outliers
# - correlation test 		[cor.test()]
# - Analysis of variance.	[anova()]

#################################################
# Proportions Test
# - prop.test

heads <- rbinom(1, size = 100, prob = .5)
prop.test(heads, 100)          # continuity correction TRUE by default
prop.test(heads, 100, correct = FALSE)

## Data from Fleiss (1981), p. 139.
## H0: The null hypothesis is that the four populations from which
##     the patients were drawn have the same true proportion of smokers.
## A:  The alternative is that this proportion is different in at
##     least one of the populations.

smokers  <- c( 83, 90, 129, 70 )
patients <- c( 86, 93, 136, 82 )
prop.test(smokers, patients)

#################################################

# Formal hypothesis teest for Pearson Correlation

X <- rnorm(10)
Y <- rnorm(10)
cor.text(X,Y)

#################################################

# Kolmogorov-Smirnov Family of Tests

x <- rnorm(50)
y <- runif(30)
# Do x and y come from the same distribution?
ks.test(x, y)
# Does x come from a shifted gamma distribution with shape 3 and rate 2?
ks.test(x+2, "pgamma", 3, 2) # two-sided, exact
ks.test(x+2, "pgamma", 3, 2, exact = FALSE)
ks.test(x+2, "pgamma", 3, 2, alternative = "gr")

# test if x is stochastically larger than x2
x2 <- rnorm(50, -1)
plot(ecdf(x), xlim = range(c(x, x2)))
plot(ecdf(x2), add = TRUE, lty = "dashed")
t.test(x, x2, alternative = "g")
wilcox.test(x, x2, alternative = "g")
ks.test(x, x2, alternative = "l")
