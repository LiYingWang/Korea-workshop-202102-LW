# We visualize raster data and work on vector data to extract elevations of sites for comparison
# This is helpful to explore any relationships between geography and site locations

# cover to a dataframe for ggplot
crop_DEM_df <- as.data.frame(crop_DEM, xy = TRUE)

# read example of archaeological sites and take a look
sites <- st_read("data/site_example.shp")
view(sites)

# plot raster data with site locations
crop_DEM_df %>%
  ggplot() +
  geom_raster(aes(x = x, y = y, fill = layer)) +
  geom_sf(data = sites, aes(color = phase)) + # add site shapefile
  scale_color_manual(values=c("red", "black")) + # change default color
  scale_fill_viridis_c(name = "Elevation") +
  coord_sf() # all layers use a common CRS

# convert sf (simple feature) to a spatial object
sp_sites <- as(sites, "Spatial")

# extract elevation for each site
elevation <- extract(crop_DEM, sp_sites,
                     method = "simple") # use values for the cell a point falls in
sites <- cbind(sites, elevation)

sites %>%
  ggplot(aes(phase, elevation)) +
  geom_boxplot() +
  theme_minimal()
