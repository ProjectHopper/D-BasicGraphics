
LEN = nrow(MASTER)
Over12s = numeric()

for(i in 1:LEN){

if( i %in% c(500,1000,2000,3500,5000,7000) ){
 cat("\n Reached Iteration :",i," out of",LEN," Iterations")
 if (.Platform$OS.type == "windows") flush.console()

 }
TEMP=MASTER[i,]
Over12s= c(Over12s,length(which(TEMP[,grep("years",names(MASTER))]>12)))
}
