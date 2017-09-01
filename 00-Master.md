

### Statistical Inference

*  $R$ commands for statistical inference procedures 
*  t.test() - testing procedure for means.

*  One sample *  Two sample *  Paired

*  prop.test() - testing procedure for proportions.

*  One sample *  Two sample

*  var.test() - testing procedure for variances.






%-
###Single sample inference

If we have a single sample we might want to answer several
questions:

*  What is the mean value? *  Is the mean value
significantly different from current theory? (Hypothesis test)
*  What is the level of uncertainty associated with our
estimate of the mean value? (Confidence interval)

To ensure that our analysis is correct we need to check for
outliers in the data (i.e. boxplots) and we also need to check
whether the data are normally distributed or not.








%-
###Hypothesis testing for a mean


*  (Last week : confidence interval for a mean) *  Revision:
For large samples (n >= 30) and/or if the population standard
deviation ($\sigma$) is known, the usual test statistic is given
by: $Z =\frac{\bar{X - \mu{SE(\bar{X)$

*  $SE(\bar{X) = \sigma /\sqrt{n$ or $s / \sqrt{n$. *  For small samples, use the $t-$distribution
with $n-1$ degrees of freedom.
* 
Critical value from tables.
*  Compare test statistics and critical values.





%-
###One sample t-test: t.test()

*  We can use the $R$ command `t.test()' to perform both procedures.
*  The t.test() command determines a confidence interval for the
mean of a data set, and performs a hypothesis test on the mean.
* 
The default null hypothesis is $H_{0: \mu = 0$.
*  The default alternative hypothesis is $H_{1: \mu \neq 0$.\\
*  The default confidence level is 95\% (hence default $\alpha$ = 0.05).
*  Base all decisions on p-values, i.e. reject the null if less than $\alpha$ or $\alpha/2$.



%-
###t-test
<pre><code>
> x <- c(3, 0, 5, 2, 5, 5, 5, 4, 4, 5)
> t.test(x)

        One Sample t-test

data:  x t = 7.125, df = 9, p-value = 5.514e-05
alternative hypothesis:
  true mean is not equal to 0
95 percent confidence interval:
 2.593516 5.006484
sample estimates: mean of x
      3.8

</code></pre>

%----
### one sample t-test: code
We can give the output of the procedure a name (i.e. `test1').
The output is a data structure made up of several components.
These components can be found using the names() command, and accessed using the
'\$' symbol ( i.e. just like data frames )
<pre><code>
> test1=t.test(x)
> names(test1)
[1] "statistic"  "parameter"   "p.value"
[4] "conf.int"  "estimate"    "null.value"
[7] "alternative" "method" "data.name"
</code></pre>


### one sample t-test: code

<pre><code>
> test1$method
[1] "One Sample t-test"
> test1$null.value
mean
   0
> test1$data.name
[1] "x"
>
> test1$conf.int                                                            $
[1]  2.593516 5.006484 attr
(,"conf.level")
[1] 0.95                                                                    $
> test1$p.value
[1] 5.514e-05
</code></pre>

%-


\subsection[containsverbatim]{One sample t-test: Decision rule

*  The null hypothesis is $H_{0: \mu = 0$.
*  The alternative hypothesis is $H_{1: \mu \neq 0$.
*  The p-value is given in the output.
<pre><code>
> test1$p.value
[1] 5.514e-05                                                           $
</code></pre>
*  This is a 2 tailed test, so compare p.value with $\alpha/2$.
*  The p-value is extremely small and is less than $\alpha/2$
*  Therefore we reject the null hypothesis. $\mu$ must be greater than 0.


%
###One sample t-test: Null hypotheses
We can specify the null hypothesis, e.g. $H_{0: \mu = 3$. Consequently $H_{1: \mu \neq 3$.
<pre><code>
> t.test(x,mu=3)
....
....
t = 1.5, df = 9, p-value = 0.1679
alternative hypothesis:
  true mean is not equal to 3
95 percent confidence interval:
 2.593516 5.006484

</code></pre>
Note the p-value is now 0.1679. We fail to reject the null hypothesis.
The confidence interval is unaffected. Note that $\mu$(i.e 3) lies within the confidence interval.

%-

###One sample t-test: significance
We can also specify the confidence level $1-\alpha$ (and consequently $\alpha$).
<pre><code>
> t.test(x,mu=3, conf.level=0.90)

        One Sample t-test

data:  x
t = 1.5, df = 9, p-value = 0.1679
alternative hypothesis:
   true mean is not equal to 3
90 percent confidence interval:
 2.82234 4.77766

</code></pre>

###One sample t-test: significance


*  The p-value remains the same (it is independent of $\alpha$).
*  We fail to reject the null hypothesis.
*  A 90\% confidence interval is calculated.
*  The confidence interval validates the decision not to reject the null
hypothesis ( $\mu$ lies within the interval).




%-

###The alternative hypothesis
The default alternative hypothesis is the `two tailed' or `not equal' hypothesis.\\
Both the one tailed alternative hypotheses can be specified using the `alternative' parameter.

*  alternative = "less"
*  alternative = "greater"


<pre><code>
> t.test(x,mu=3, alternative ="less")
> t.test(x,mu=3, alternative ="greater")
</code></pre>

We shall test with both sets of hypotheses respectively.\\
1) $H_{0: \mu \geq 3$ \quad v \quad $H_{1: \mu < 3$\\
2) $H_{0: \mu \leq 3$ \quad v \quad $H_{1: \mu > 3$\\

%-
###The 'less' alternative hypothesis
<pre><code>
> t.test(x,mu=3, alternative ="less")
.....
t = 1.5, df = 9, p-value = 0.916
alternative hypothesis:
    true mean is less than 3
95 percent confidence interval:
    -Inf 4.77766
sample estimates:
mean of x
      3.8
</code></pre>
Consider both the p-values and the confidence interval.
We fail to reject the null hypothesis.

%-
### The 'greater' alternative hypothesis


<pre><code>
> t.test(x,mu=3, alternative ="greater")
.....
data:  x
t = 1.5, df = 9, p-value = 0.08393
alternative hypothesis:
    true mean is greater than 3
95 percent confidence interval:
 2.82234     Inf
sample estimates:
mean of x
      3.8
</code></pre>
Again we fail to reject the null hypothesis.


%--
###Two Sample t-test

*  The two-sample t-test is one of the most commonly used
hypothesis tests. *  It is applied to compare whether the
average difference between two groups is really significant or if
it is due instead to random chance. *  It helps to answer
questions like whether the average success rate is higher after
implementing a new sales tool than before, *  or whether the
test results of patients who received a drug are better than test
results of those who received a placebo.
* 
$H_{0: \mu_{x = \mu_{y \quad v \quad \mu_{x \neq \mu_{y$\\



%--
###Two Sample t-test

To perform a two sample test, just name both data sets as arguments for the t.test()
command. \\ Both data sets dont necessarily have to be of equal length. \\ This test is called the Welch Two Sample t-test.
<pre><code>
> x = c(3, 0, 5, 2, 5, 5, 5, 4, 4, 5)
> y = c(2, 1, 4, 1, 4, 3, 3, 2, 3, 5)
> t.test(x,y)
</code></pre>

%-
###Two Sample t-test
<pre><code>
        Welch Two Sample t-test

data:  x and y
t = 1.478, df = 16.999, p-value = 0.1577
alternative hypothesis:
true difference in means is not equal to 0
95 percent confidence interval:
 -0.4274951  2.4274951
sample estimates:
mean of x mean of y
      3.8       2.8
</code></pre>

%--
###Two Sample t-test
The p.value is 0.1577. Therefore we fail to reject the null hypothesis.\\
Also the null difference (0) lies within the confidence interval.\\

All of the variations described previously (i.e. specifying the null value, the confidence level and the alternative hypothesis)
apply to the two sample $t$-test also.

%----------------------------------------------------%
\subsubsection{Two Sample t test}

The two-sample t test is used to test the hypothesis that two samples may
be assumed to come from distributions with the same mean.

The theory for the two-sample t test is not very different in principle from
that of the one-sample test. Data are now from two groups, $x_{11}, . . . , x_{1n1}$
and $x_{21}, . . . , x_{2n2}$ , which we assume are sampled from the normal distributions
$N(µ_{1}, \sigma^{1}_{2} )$ and
$N(µ_{2}, \sigma^{2}_{2} )$, and it is desired to test the null hypothesis
$\mu_{1} = \mu_{2}$. You then calculate

\[
t = \frac{\bar{X}_{1}-\bar{X}_{2}}{S.E.(\bar{X}_{1}-\bar{X}_{2})}
\]


\subsubsection{Two Sample Tests}


All of the previous hypothesis tests and confidence intervals can be
extended to the two-sample case.

The same assumptions apply, i.e. data are normally distributed in
each population and we may want to test if the mean in one
population is the same as the mean in the other population, etc.

Normality can be checked using histograms, boxplots and Q-Q
plots as before. The Anderson-Darling test can be used on
each group of data also.


%------------------------------------------------------%
\subsubsection{Implementation}

This can be carried out in R by hand:

\footnotesize \begin{verbatim}
>obs.vals <- matrix(c(43,9,44,4), nrow=2, byrow=T)
>row.tots <- apply(obs.vals, 1, sum)
>col.tots <- apply(obs.vals, 2, sum)
>exp.vals <- row.tots%o%col.tots/sum(obs.vals)
>TS <- sum((obs.vals-exp.vals)^2/exp.vals)
>TS
>[1] 1.777415
 \end{verbatim}\normalsize


%------------------------------------------------------%
%-
###Paired t tests
For `before/after' procedures, the corresponding elements of both data sets are said to be `paired'.
We can perform an analysis of the case-wise differences between both data sets.
Necessarily both data sets should be of the same length.
<pre><code>
> x = c(3, 0, 5, 2, 5, 5, 5, 4, 4, 5)
> y = c(2, 1, 4, 1, 4, 3, 3, 2, 3, 5)
>
> x-y
 [1]  1 -1  1  1  1  2  2  2  1  0
> mean(x-y)
[1] 1
</code></pre>
Where the casewise differences are important, we add `paired=TRUE' as an argument to the t.test() command.

--
###Paired t tests
<pre><code>
> t.test(x,y,paired=TRUE)

        Paired t-test

data:  x and y t = 3.3541, df = 9,
 p-value = 0.008468
alternative hypothesis:
 true mean is not equal to 0
95 percent confidence interval:
 0.3255550 1.6744450
sample estimates: mean of x
                      1
> t.test(x,y,paired=TRUE)$p.value
[1] 0.00846815                                                               $
</code></pre>

--
###Paired t tests: alternative method
The paired $t-$test is equivalent to a one sample $t-$test on the differences of $x$ and $y$, i.e. ($x-y$).
<pre><code>
> t.test(x-y)
.....
data:  x - y t = 3.3541, df = 9,
 p-value = 0.008468
alternative hypothesis:
 true mean is not equal to 0
95 percent confidence interval:
 0.3255550 1.6744450
.....
> t.test(x-y)$p.value
[1] 0.00846815
</code></pre>


###Paired t tests
Both the p-value and the confidence interval validate the conclusion that we should reject the null hypothesis.

%-



### Hypothesis Tests for a Proportion 

*  We can also perform a hypothesis test for a population
proportion, p. The $R$ function to carry out such a test is
prop.test.

*  Example: A manufacturer claims that the proportion of
defective items produced is approximately 4\%. A random sample of
size 50 is taken, 3 of which are defective. Is the manufacturer's
claim justified?

<pre><code>
>prop.test(x=3, n=50, p = 0.04, alternative = "two.sided",
conf.level = 0.95)
</code></pre>


###Proportion test : Results

<pre><code>
        1-sample proportions test

data:  3 out of 50, null probability 0.04
X-squared = 0.1302, df =1, p-value = 0.7182
alternative hypothesis:
 true p is not equal to 0.04
95 percent confidence interval:
 0.01562459 0.17541874
sample estimates:
   p
0.06
</code></pre>


###prop.test
Paramaters

*  x   number of success ( value or vector)
*  n   sample size (value or vector)
*  p   Null hypothesis value is 50\%($ H_0: p = 0.5 $)
*  conf.level confidence level (default is 95\%)


###prop.test
<pre><code>

> prop.test(280,400)

    1-sample proportions test
    with continuity correction

data:  280 out of 400, null probability 0.5
X-squared = 63.2025, df = 1,
p-value = 1.865e-15
alternative hypothesis: true p is not equal to 0.5
95 percent confidence interval:
 0.6520722 0.7440176
sample estimates:
  p
0.7
</code></pre>




%--
###prop.test - 99\ confidence interval
<pre><code>
> prop.test(280,400,conf.level=0.99)

        1-sample proportions test

data:  280 out of 400, null probability 0.5
X-squared = 63.2025, df = 1, p-value = 1.865e-15
alternative hypothesis:
    true p is not equal to 0.5
99 percent confidence interval:
 0.6368118 0.7565247
sample estimates:
  p
0.7
</code></pre>



###F test to compare two variances
We can use the F test to test for equality in the variances,
provided that the two samples are from normal populations.

<pre><code>
> var.test(x, y)

        F test to compare two variances

data:  A and B F = 2.8023, num df = 6, denom df = 4, p-value =
0.3378 alternative hypothesis: true ratio of variances is not
equal to 1 95 percent confidence interval:
  0.3046847 17.4502476
sample estimates: ratio of variances
           2.80228
</code></pre>



