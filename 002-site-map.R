# add site location
site_location <-
  data.frame(location = c("A", "B"),
             lon = c(126.5, 128),
             lat = c(34.6, 35.8))

library(ggmap)
library(ggspatial)
library(legendMap)

local_map <- ggmap(get_stamenmap(rbind(as.numeric(c(126, 34.2,
                                                    128.5, 36.5))), zoom = 9)) # define the range

site_Korea <-
  local_map +
  geom_point(data = site_location, # add a layer of sites
             aes(x = lon,
                 y = lat),
             size = 3,
             color = "red") +
  geom_shadowtext(data = site_location, # add texts
                  aes(x = lon,
                      y = lat,
                      label = location),
                  size = 5,
                  position = position_nudge(y = - 0.07),
                  check.overlap = TRUE) +
  coord_sf(xlim = c(126, 128.5), # define the range
           ylim = c(34.2, 36.5),
           expand = FALSE) +
  scale_x_continuous(breaks = seq(126, 128.5, by = 1)) +
  scale_y_continuous(breaks = seq(34.2, 36.5, by = 0.5)) +
  legendMap::scale_bar(
    lon = 127.8,
    lat = 34.3,
    legend_size = 3,
    # distance of one section of scale bar, in km
    distance_lon = 25,
    # height of the scale bar, in km
    distance_lat = 2,
    # distance between scale bar and units, in km
    distance_legend = 7,
    # units of scale bar
    dist_unit = "km",
    # add the north arrow
    orientation = TRUE,
    # length of N arrow, in km
    arrow_length = 4,
    # distance between scale bar & base of N arrow, in km
    arrow_distance = 13,
    # size of letter 'N' on N arrow, in km
    arrow_north_size = 4) +
  theme(axis.title.x = element_blank(),
        axis.title.y = element_blank())

# save the map
ggsave(here::here("Korea-site-map.jpg"),
       width = 150,
       height = 150,
       dpi = 300,
       units = "mm")
