# We learn how to convert raster data and crop an area we want for later analysis

library(raster)

# read in raster data (Robinson et al., 2014) downloaded from: http://www.earthenv.org/DEM
Korea_raster1 <- raster(here::here("data/EarthEnv-DEM90_N35E125/EarthEnv-DEM90_N35E125.bil"))
Korea_raster2 <- raster(here::here("data/EarthEnv-DEM90_N35E125/EarthEnv-DEM90_N30E125.bil"))

# combine two raster tiles
Korea_raster <- merge(Korea_raster1, Korea_raster2)

# assign coordinate reference system
crs(Korea_raster) <- "+proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs"

plot(Korea_raster) # take a look at raster data

# define the area that we want to crop from the DEM
x_coord <- c(126, 126, 128.5, 128.5, 126)
y_coord <- c(34.2, 36.5, 36.5, 34.2, 34.2)
xym <- cbind(x_coord, y_coord)
class(xym)

library(sp)
p = Polygon(xym) # convert the matrix to polygon
ps = Polygons(list(p),1) # make lists
sps = SpatialPolygons(list(ps)) # convert to Spatial Polygons
crs(sps) <- crs(Korea_raster) # define coordinate reference system
crop_DEM <- crop(Korea_raster, sps) # crop a raster to the extent of specified spatial object
summary(crop_DEM)
plot(crop_DEM) # takes some time
