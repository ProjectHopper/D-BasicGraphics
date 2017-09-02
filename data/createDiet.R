library(MASS)

Sigma <- cor(mtcars)
myData1 <- mvrnorm(n = 10000, rep(0, 11), Sigma)

Sigma <- cor(iris[,1:4])
myData2 <- mvrnorm(n = 10000, rep(0, 4), Sigma)

myData <- floor(cbind(myData1,myData2))+4
myData[myData<1] = 8 
myData[myData>7] = 8

myData <- data.frame(ID=1:10000,myData)

colnames(myData) <- c(sort(c("Vegetables","Fruit","RedMeat","Coldmeat","Bread",
                   "Cheeses" ,"Eggs","Salads","BreakCereal","Soup")),sort(c(
                   "Softdrinks","Tea","Coffee","Juices","HotChoc")))
                   
                 
