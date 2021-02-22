library(rnaturalearth) # provides world map
library(rnaturalearthdata)

world <- ne_countries(scale = "medium", returnclass = "sf") # pulls country data
class(world) # what class it is?
# type view(world) in your console to take a look at the data frame

library(ggplot2)
# plot basic world map
ggplot(data = world) +
  geom_sf() + # adds a geometry stored in world
  theme_minimal()

# narrow down to a smaller region
library(tidyverse)
library(sf)

# get the coords of the center of each country for text labels
country_centre_coords <-
  as_tibble(st_coordinates(st_centroid(world$geometry)))

world_points <-
  world %>%
  bind_cols(country_centre_coords) %>%
  filter(name %in% c("Japan", "China", "Korea", "Taiwan", "Mongolia"))

library(shadowtext)
# plot map
Korea_in_Asia <-
  ggplot(data = world) +
  geom_sf() +
  geom_shadowtext(data= world_points, # add texts
                  aes(x = X, y = Y,
                      label = name),
                  color='black',
                  bg.colour='white',
                  size = 3.5,
                  position = position_nudge(y = 0, x = 3)) +
  coord_sf(xlim = c(100, 155), # zoom in the area of interest
           ylim = c(20, 60),
           expand = FALSE) + # match the limits we provide
  scale_x_continuous(breaks = seq(100, 150, by = 15)) +
  scale_y_continuous(breaks = seq(20, 60, by = 15)) +
  theme(axis.title.x = element_blank(),
        axis.title.y = element_blank())

Korea_in_Asia
