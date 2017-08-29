myPop = sample(750:1250,100000,TRUE)
mean(myPop)
mySample = sample(myPop,20)
mean(mySample)
t.test(mySample)
mySample = sample(myPop,25)
t.test(mySample)
names(t.test(mySample))
t.test(mySample)$conf.int
t.test(mySample)$conf.int[1]
t.test(mySample)$conf.int[2]
