### Central Limit Theorem

Hypothesis testing and confidence interval construction are based on the \textbf{\textit{Central Limit Theorem}}.

Lets consider the following Dice experiment. First we will simulate the outcome of one fair roll of a die (both of the following pieces of code can be used to ``roll a die".
<pre><code>
Dice1=floor(runif(50,min=1,max=7))  

Dice2=sample(1:6,1,replace=T)
</code></pre>
A simple demonstration of the central limit theorem is given by the problem of rolling a large number of dice repeatedly. 
The distribution of the sum (or average) of the rolled numbers will be well approximated by a normal distribution, the parameters of which can be determined empirically.
<pre><code>
N=100            #number of loops
myDiceSums=numeric(N)  #array “myDiceSums” store the sample means
for( i in 1:N)
     { 
     Dice=floor(runif(50,min=1,max=7));
     myDiceSums[i]=mean(Dice)  
}                                 
myDiceSums            #print myDiceSums dataset to screen
</code></pre>

Lets look at the distribution of the means. Are they normally distributed?

<pre><code>
mean(myDiceSums)          #compute the mean. 
qqnorm(myDiceSums)        #draws a QQ plot
qqline(myDiceSums)        #adds trend line to QQplot.
shapiro.test(myDiceSums)  #Shapiro Wilk test. 
</code></pre>
