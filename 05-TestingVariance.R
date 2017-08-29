# var.test 	
# Performs an F test to compare the variances of two samples from normal populations.

x <- rnorm(50, mean = 0, sd = 2)
y <- rnorm(30, mean = 1, sd = 1)
var.test(x, y)       

##################################################

# Bartlett Test of Homogeneity of Variances

# Performs Bartlett's test of the null that the variances in 
# each of the groups (samples) are the same

plot(count ~ spray, data = InsectSprays)

bartlett.test(InsectSprays$count, InsectSprays$spray)

bartlett.test(count ~ spray, data = InsectSprays)

####################################################

# Fligner-Killeen Test of Homogeneity of Variances


# The Fligner Killeen test is a non-parametric test for homogeneity of group variances based on ranks. 
# It is useful when the data is non-normal or where there are outliers.

# Test of the null that the variances in each of the groups (samples) are the same.


fligner.test(InsectSprays$count, InsectSprays$spray)

fligner.test(count ~ spray, data = InsectSprays)

## Compare this to bartlett.test()

####################################################
