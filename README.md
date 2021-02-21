Introduction to spatial data visulization and analysis Using R
================
Liying Wang, Februry 2021

## Overview

In this workshop we will practice some techniques for visulizating and analysing
spatial data using R. Here are the [slides](). The outline of this workshop as below:

1.  Make regional maps 
2.  Make site maps with labels of sites
3.  Crop an area from raster data
4.  Visiualize raster data with shapefiles 
5.  Extract elevation and make a comparison
6.  Make a kernel density plot
7.  Hypothesis testing on sptial distribution

If you want to download the code and data from this repository onto your computer, please run the following lines in your R console (please answer 'Yes' to each question that appears in your console):

```r
if (!require("usethis")) install.packages("usethis") # to install usethis
usethis::use_course("LiYingWang/Korea-workshop-202102-LW")
```

## Dependencies 

We will use mulitple R packages to work on spatital data and you can install them by running the folllowing line in your R console: 

```r
install.packages(c("rnaturalearth", "rnaturalearthdata", "ggplot2", "tidyverse", "sf", "sp","shadowtext", "ggmap", "ggspatial", "raster", "spatstat", "maptools"))
```
```r
devtools::install_github('3wen/legendMap')
```

Those packages have detailed and great documentations that you can further search it if you want to know more about their fuctions.

### Contributing

If you would like to contribute to this project, please start by reading
our [Guide to Contributing](CONTRIBUTING.md). Please note that this
project is released with a [Contributor Code of Conduct](CONDUCT.md). By
participating in this project you agree to abide by its terms.
