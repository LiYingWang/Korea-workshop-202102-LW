Introduction to spatial data visualization and analysis Using R
================
Liying Wang, February 2021

## Overview

In this workshop we will practice some techniques for visualization and analyzing
spatial data using R. Here are the [slides](). The outline of this workshop as below:

1.  Make a regional map
2.  Make a site map with labels
3.  Crop an area from raster data
4.  Extract elevation of sites from vector data 
5.  Make a kernel density plot
6.  Hypothesis testing on spatial distribution

If you want to download the code and data from this repository onto your computer, please run the following lines in your R console (please answer 'Yes' to each question that appears in your console):

```r
if (!require("usethis")) install.packages("usethis") # to install usethis
usethis::use_course("LiYingWang/Korea-workshop-202102-LW")
```

## Dependencies 

We will use multiple R packages to work on spatial data and you can install them by running the following line in your R console: 

```r
install.packages(c("rnaturalearth", "rnaturalearthdata", "ggplot2", "tidyverse", "sf", "sp","shadowtext", "ggmap", "ggspatial", "raster", "spatstat", "maptools", "devtools"))
```
```r
devtools::install_github('3wen/legendMap')
```

Those packages have detailed and great documentations that you can further search it if you want to know more about their functions.

### Contributing

If you would like to contribute to this project, please start by reading
our [Guide to Contributing](CONTRIBUTING.md). Please note that this
project is released with a [Contributor Code of Conduct](CONDUCT.md). By
participating in this project you agree to abide by its terms.
