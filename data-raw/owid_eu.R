## code to prepare `owid_eu` dataset goes here
library(dplyr)

owid_eu <- owid %>%
  filter(location %in% c("Austria", "Italy", "Belgium",	"Latvia", "Bulgaria",	"Lithuania", "Croatia",	"Luxembourg", "Cyprus",	"Malta", "Czechia",	"Netherlands", "Denmark",	"Poland", "Estonia",	"Portugal", "Finland",	"Romania", "France",	"Slovakia", "Germany",	"Slovenia", "Greece",	"Spain", "Hungary",	"Sweden", "Ireland")) %>%
  select(location, date, total_cases, new_cases, total_deaths, new_deaths, population, life_expectancy)

usethis::use_data(owid_eu, overwrite = TRUE)
