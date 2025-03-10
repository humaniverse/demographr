library(tidyverse)
library(nomisr)

# ---- Population estimates - small area (2021 based) by single year of age - England and Wales ----
population_raw <- 
  nomis_get_data(
    id = "NM_2014_1",
    time = "2022", 
    geography = "TYPE151",  # LSOAs
    gender = "0",  # Total
    c_age = "200",  # All ages
    measures = "20100"  # Value
  )

population22_lsoa21 <- 
  population_raw |> 
  select(lsoa21_code = GEOGRAPHY_CODE, n_people = OBS_VALUE)

# Save output to data/ folder
usethis::use_data(population22_lsoa21, overwrite = TRUE)
