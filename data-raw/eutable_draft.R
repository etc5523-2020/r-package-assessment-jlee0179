## code to prepare `eutable_draft` dataset goes here
library(dplyr)


Dtlist <- c("2020-01-05", "2020-02-05", "2020-03-05", "2020-04-05", "2020-05-05", "2020-06-05", "2020-07-05", "2020-08-05", "2020-09-05", "2020-10-05")

eutable_draft <- owid_eu %>%
  filter(date %in% as.Date(Dtlist)) %>%
  mutate(`Case fatality rate` = round(total_deaths / total_cases, digits = 3)) %>%
  select(-new_cases, -new_deaths) %>%
  rename("Location" = "location", "Date" = "date", `Total cases` = "total_cases", `Total deaths` = "total_deaths", "Population" = "population", `Life expectancy` = "life_expectancy")

usethis::use_data(eutable_draft, overwrite = TRUE)
