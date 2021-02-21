# Create a simple dataframe with lat/long values

early_neo <- data.frame(lon = c(runif(2, 126.35, 127), runif(8, 126.65, 127.2)),
                        lat = c(runif(2, 34.8, 35.45), runif(8, 35.5, 36.4)),
                        name = paste0("a", 1:10),
                        phase = "early neolithic")

late_neo <- data.frame(lon = runif(10, 126.6, 128.3),
                        lat = runif(10, 35, 36.4),
                        name = paste0("b", 1:10),
                        phase = "late neolithic")

neolithic <- rbind(early_neo, late_neo)

# convert the dataframe to a spatial object
# crs= 4326 parameter assigns a WGS84 coordinate system to the
# spatial object
site_example <- st_as_sf(neolithic, coords = c("lon", "lat")) #crs = "+proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs")

s.sp <- as(site_example, "Spatial")
class(s.sp)

raster::shapefile(s.sp, "site_example.shp", overwrite = TRUE)
