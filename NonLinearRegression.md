

```R
<!-- ################################################################################ -->
<br>{Non-linear regression}
Example: In an experiment to determine the effect of concentrations of chemicals on absorbances the following
results were obtained:
\begin{tabular}{|c|c|c|c|c|c|c|c|}
  \hline
  % after <br>: \hline or \cline{col1-col2} \cline{col3-col4} ...
  Abs & 0.084 & 0.183 & 0.326 & 0.464 & 0.643 & 0.671 & 0.701 <br>
  Conc & 0.123 & 0.288 & 0.562 & 0.921 & 1.420 & 1.723 & 2.121 <br>
  \hline
\end{tabular}


<p>

<br>{Non-linear regression}
<ul>
<li> A scatterplot indicates that a linear model may be suitable.
<li> Model 1:  $Abs = \beta_{0} + \beta_{1}Conc$.
<li> But there is a slight curve in the trend, which indicates that a possible quadratic relationship.
<li> Model 2: $Abs = \beta_{0} + \beta_{1}Conc +  \beta_{2}Conc^2$
<li> We will construct a model for each and compare the $R^2$ and adjusted $R^2$ values.
</ul>
<p>
```


```R
<br><h4>Model fitting</h4>
We fit a linear model and a quadratic model. We need to create a new variable, `conc.sq`' which is simply the square
of the concentrations.
<pre><code>
>Abs<-c(0.084, 0.183, 0.326, 0.464,
0.643 ,0.671,0.701)
>Conc<-c(0.123, 0.288, 0.562, 0.921,
1.420,1.723,2.121)
>
>plot(Conc,Abs)
>fit1 = lm(Abs~Conc)
>
>Conc.sq = Conc^2
>fit2 = lm(Abs~Conc + Conc.sq)
</code></pre>
<p>

<br>
<h4>Quadratic model</h4>
<pre><code>
Call:
lm(formula = Abs ~ Conc + Conc.sq)
.....
Coefficients:
        Estimate Std. Error t value Pr(>|t|)
(Int)   0.004891   0.011649    0.42 0.696186
Conc    0.655907   0.027240   24.08 1.76e-05 ***
Conc.sq -0.154218   0.012072  -12.78 0.000216 ***
......
Multiple R-squared: 0.9985,
Adjusted R-squared: 0.9977
......
</code></pre>
```


```R
Validates use of quadratic terms.
<p>
<br>{Comparing R square values}
<pre><code>
> summary(fit1)$r.squared
[1] 0.936624
> summary(fit1)$adj.r.squared
[1] 0.9239488
> summary(fit2)$adj.r.squared
[1] 0.9977258
> summary(fit2)$r.squared
[1] 0.9984839
</code></pre>
Clearly the second model is better.
<p>

```


```R



  


<br>
<h4>Non linear models</h4>
<ul>
<li> When a curve is evident in the data, can try using
quadratic, cubic etc terms.

<li> Can also try logs, exponentials etc.

</ul>

<p>
```
