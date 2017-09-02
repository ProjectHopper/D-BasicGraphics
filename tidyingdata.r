
library(tidyr)
library(dplyr)
library(magrittr)

install.packages('MethComp')
library(MethComp)
data(sbp)
head(sbp)

library(tidyr)
spread(sbp, repl,y) %>% setNames(c('meth','item','repl1','repl2','repl3')) %>% head

sbp2 <- spread(sbp, repl,y) # %>% setNames(c('meth','item','repl1','repl2','repl3')) 
head(sbp2)

gather(sbp2,repl,y,3:5) %>% arrange(item) %>% head(10)

library(reshape2)
# library(xtable)

dcast(sbp, item ~ meth + repl) %>% head() %>% xtable()

# xtable(dcast(sbp, item ~ meth + repl))

sbp3 <-dcast(sbp, item ~ meth + repl)
melt(sbp3,id.vars='item') %>% head(10)
# can use tidyr R package to tidy this up further

dcast(sbp, item ~ meth ,fun.aggregate = mean) %>% head() 


