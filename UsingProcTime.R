g <- rnorm(100000)
h <- rep(NA, 100000)

# Start the clock!
ptm <- proc.time()

# Loop through the vector, adding one
for (i in 1:100000){
	h[i] <- g[i] + 1
}

# Stop the clock
proc.time() - ptm
