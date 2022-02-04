#### Preamble ####
# Purpose: Download data from opendatatoronto
# Author: Yuxuan Yang
# Data: 3 February 2022
# Contact: yuxuanmaggie.yang@mail.utoronto.ca 
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!

#### Data Download ####
# From https://open.toronto.ca/dataset/neighbourhood-crime-rates/

library(opendatatoronto)
library(tidyverse)

# get package
package <- show_package("fc4d95a6-591f-411f-af17-327e6c5d03c7")

# get all resources for this package
resources <- list_package_resources("fc4d95a6-591f-411f-af17-327e6c5d03c7")

# identify datastore resources; by default, #Toronto Open Data sets datastore
# resource format to CSV for non-geospatial #and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a #sample
crime <- filter(datastore_resources, row_number()==1) %>% get_resource()

write_csv(crime, "inputs/data/crime.csv")
#read_csv("crime.csv")
