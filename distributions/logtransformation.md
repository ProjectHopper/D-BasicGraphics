Logarithmic  Transformation
===================================
If data deviate substantially from a Gaussian distribution, using a nonparametric test is not the only alternative. Consider transforming the data to create a Gaussian distribution. Transforming to reciprocals or logarithms are often helpful.

Data can fail a normality test because of the presence of an outlier. Removing that outlier can restore normality.

The decision of whether to use a parametric or nonparametric test is most important with small data sets (since the power of nonparametric tests is so low). But with small data sets, normality tests have little power to detect non-normal distributions, so an automatic approach would give you false confidence.

With large data sets, normality tests can be too sensitive. A low P value from a normality test tells you that there is strong evidence that the data are not sampled from an ideal normal distribution. But you already know that, as almost no scientifically relevant variables form an ideal normal distribution. What you want to know is whether the distribution deviates enough from the normalideal to invalidate conventional statistical tests (that assume a Gaussian distribution). A normality test does not answer this question. With large data sets, trivial deviations from the idea can lead to a small P value.
