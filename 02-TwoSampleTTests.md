 

Testing the equality of variance.
var.test(X,Y)
var.test(X,Z)

Welch two sample t-test
The Welch two sample t-test doesn’t not require the assumption that the two data sets under examination have equal variance.
The assumption of equal variance is testable using the “var.test” procedure.
t.test(X,Y)


Independent two sample t-tests
With    as the population mean for a data set, the null and alternative hypotheses are as follows:
 
 
This test requires that the two data sets have equal variance. This assumption must be specified when coding in R.
t.test(X,Y,var.equal=TRUE)


 



