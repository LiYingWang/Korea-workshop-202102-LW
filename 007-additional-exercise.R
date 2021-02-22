## Quiz: Do the early neolithic sites ramdonly distributed or non-ramdonly distributed? The pattern is clustterd or dispersed?

# filter the early sites
sites_coords_early_neo <-
  sites %>%
  st_coordinates() %>%
  as.data.frame () %>%
  bind_cols(sites) %>%
  filter(phase == "early neolithic")

sites_ppp_early_neo <- (ppp(x = sites_coords_early_neo$X,
                            y = sites_coords_early_neo$Y,
                            range(crop_DEM_df$x),
                            range(crop_DEM_df$y)))

K2 <- density(sites_ppp_early_neo)

plot(K2, main=NULL, las=1)
contour(K2, add=TRUE)


# get the mean distance for our observation
ann_p <- mean(nndist(sites_ppp_early_neo, k=1))
n     <- 100 # Number of simulations

ann_r <- vector(length = n) # an object for storing simulated ANN values

# simulation
for (i in 1:n){
  rand_p   <- rpoint(sites_ppp_early_neo$n,
                     win = as.owin(crop_DEM_df))  # Generate random point locations
  ann_r[i] <- mean(nndist(rand_p, k=1))  # Tally the ANN values
}

# plot the histogram and add our observed ANN value line
hist(ann_r, main=NULL, las=1, breaks=40,
     col = "bisque",
     xlim = range(ann_p, ann_r))
abline(v = ann_p, col="blue")
```
