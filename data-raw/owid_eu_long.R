## code to prepare `owid_eu_long` dataset goes here
library(tidyr)
owid_eu_long <- owid_eu %>%
  pivot_longer(cols = c("new_cases", "new_deaths"),
               names_to = "type_new",
               values_to = "count") 

usethis::use_data(owid_eu_long, overwrite = TRUE)
