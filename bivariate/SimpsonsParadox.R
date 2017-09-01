\documentclass{beamer}

\usepackage{amsmath}
\usepackage{framed}

\begin{document}




Divide iris into three subsets, one for each species.
\begin{framed}
\begin{verbatim}
Virg  = subset(iris,Species=="virginica")

Seto    = subset(iris,Species=="Setosa")

Vers = subset(iris,Species=="Versicolor")

\end{verbatim}
\end{framed}


%----------------------------------------%


\begin{verbatim}
> names(iris)
[1] "Sepal.Length" "Sepal.Width"  "Petal.Length"
[4] "Petal.Width"  "Species" 
\end{verbatim}

\noindent For ease of use, I am going to give the variables shorter names
\begin{framed}
\begin{verbatim}

names(Virg) = c("SL","SW","PL","PW","Spec")

names(Seto) = c("SL","SW","PL","PW","Spec")

names(Vers) = c("SL","SW","PL","PW","Spec")

\end{verbatim}
\end{framed}


%---------------------------------------------%

END SLIDE

\end{document}


Virg  = subset(iris,Species=="virginica")
Seto    = subset(iris,Species=="setosa")
Vers = subset(iris,Species=="versicolor")

#-----------------------------------------------------#
names(Virg) = c("SL","SW","PL","PW","Spec")
names(Seto) = c("SL","SW","PL","PW","Spec")
names(Vers) = c("SL","SW","PL","PW","Spec")

#-----------------------------------------------------#

par(mfrow=c(3,1))
plot(Virg$SL,Virg$SW, pch = 16 , cex=2, col="red",xlim=c(4.8,8) , ylim=c(1.9,4.6), main="Virginica")
plot(Seto$SL,Seto$SW, pch = 16 , cex=2, col="blue",xlim=c(3.6,6.6),ylim=c(1.9,4.6), main="Setosa")
plot(Vers$SL,Vers$SW, pch = 16 , cex=2, col="green",xlim=c(4.4,7.6),ylim=c(1.9,4.6), main="Versicolor")
par(mfrow=c(1,1))
