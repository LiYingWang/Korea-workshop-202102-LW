# We plot density maps of site locations to identify any hot spots

library(spatstat)
library(maptools)

# get two columns, one longitude and another is latitude
sites_coords <-
  sites %>%
  st_coordinates() %>%
  as.data.frame

# convert to ppp object that represent a two-dimensional point pattern
sites_ppp <- ppp(x = sites_coords$X,
                 y = sites_coords$Y,
                 range(crop_DEM_df$x), # set window, means the extent of an area
                 range(crop_DEM_df$y))

K1 <- density(sites_ppp)

plot(K1, main=NULL, las=1)
contour(K1, add=TRUE)
