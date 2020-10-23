## code to prepare `owid` dataset goes here

library(readr)


owid <- read_csv("owid-covid-data (1).csv") 


usethis::use_data(owid, overwrite = TRUE)

