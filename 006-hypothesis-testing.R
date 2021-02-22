# get the mean distance for our observation
ann_p <- mean(nndist(sites_ppp, k=1))
n     <- 100 # number of simulations

ann_r <- vector(length = n) # an object for storing simulated ANN values

# simulation
for (i in 1:n){
  rand_p   <- rpoint(sites_ppp$n,
                     win = as.owin(crop_DEM_df))  # generate random point locations
  ann_r[i] <- mean(nndist(rand_p, k=1))  # tally the ANN values
}

# plot the histogram and add our observed ANN value line
hist(ann_r, main=NULL, las=1, breaks=40,
     col = "bisque",
     xlim = range(ann_p, ann_r))
abline(v = ann_p, col="blue") # the observed value

# calculate p-value
N_greater <- sum(ann_r > ann_p)
p <- min(N_greater + 1, n + 1 - N_greater) / (n +1)
