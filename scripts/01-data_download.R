#### Preamble ####
# Purpose: Download data from opendatatoronto
# Author: Yuxuan Yang
# Data: 3 February 2022
# Contact: yuxuanmaggie.yang@mail.utoronto.ca 
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)

#### Data Download ####
# From https://open.toronto.ca/dataset/neighbourhood-crime-rates/

# Datasets are grouped into 'packages' that have multiple datasets 
# also called 'resources' that are relavant to that topic. So we first 
# look at the package using a unique key that we obtain from the 
# datasets webpage. (see above)

# get all resources for this package
resources <- list_package_resources("fc4d95a6-591f-411f-af17-327e6c5d03c7")

# We need the unique key from that list of resources

# There is only one resource, so get_resource will load that.
crime_rate_neighborhood <- 
  resources %>%
  get_resource()

#### Save data ####
write.csv(crime_rate_neighborhood, "inputs/data/crime_rate_neighborhood.csv")


