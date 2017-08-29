
### Grubbs’ Test
Grubbs' test is a formal hypothesis test for assessing whether or not a  data set contains an outlier.
This data set is univariate and approximately normal distributed. This test is designed for assessing one outlier only.  If more outliers are suspected, alternative tests, such as the Tietjen-Moore test, are recommended.
Hypotheses: Grubbs' test is defined for the hypothesis: 

  H0:  There are no outliers in the data set  
  H1:  There is exactly one outlier in the data set  

<pre><code>
install.packages(“outliers”)
library(outliers)
#Package Author : Lukasz Komsta (UMLUB, Poland)

grubbs.test(DAT002)

Author : Lukasz Komsta
</code></pre>
