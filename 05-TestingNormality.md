\section{Testing Normality}
%% http://psystats.wikispaces.com/Shapiro-Wilk+Test

\subsection{Assumption of Normality}

One of the assumptions of many statistical procedures (including the t test) is that the population from which you are sampling is normally distributed. The t test is said to be rather ‘robust’ in terms of this assumption, which means that reality can deviate from this assumption a fair amount without seriously affecting the validity of the analysis. 

This is particularly true when the size of the samples is large (thanks to the Central Limit Theorem). Some deviations from normality can pose a problem for the t test, specifically those that involve getting extreme scores more frequently then you would if the distribution were normal. 

Distributions that have a greater than ‘normal’ probability of extreme scores in both directions are said to be fat tailed (because if you look at those distribution the tails look fat compared to the normal distribution). If the distribution has a fat tail on only one side it is called a skewed distribution. 
 
Statistical Software Packages provides two statistical tests for deviation from normality, the 'Kolomogorov-Smirnov' test and the 'Shapiro-Wilk' test. Of the two, the Shapiro-Wilk (1965) test seems to be preferable.
%%(see the comparative study by Shapiro, Wilk, & Chen, 1968). 

The null hypothesis of the tests is that the population is normally distributed, and the alternative hypothesis is that it is not normally distributed. 

\subsection{Limitations of Tests}
There are some important limitations to the usefulness of these tests.
 
Because it involves null hypothesis significance testing, if you reject H0 you can conclude that the population is not normally distributed, but if you don't reject H0 then you only conclude that you failed to show the population is not normally distributed. In other words, you can prove the population is not normally distributed but you can't prove it is normally distributed.
 
Rejecting H0 means that the population is not normally distributed, but it doesn't tell you whether it is because it is a fat-tailed distribution, a thin-tailed distribution, a skewed distribution, or something else. As we have seen, some of these deviations from normality are much more a problem than others.
 
The tests are influenced by power. If you have a small sample the test may not have enough power to detect non-normality in the population (and it is when N is small that we usually have to worry the most because of the Central Limit Theorem). If you have a very large sample the test will detect even trivial deviations from normality, those we don't really have to worry about.
 
\end{document}
