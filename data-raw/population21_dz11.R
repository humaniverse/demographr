# ---- Load ----
library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "estimates21_dz11") |>
  pull(query)

dz_pop <- read_csv(query_url)

population_dz <-
  dz_pop |>
  
  # Keep year 2021 and don't include Scotland totals
  filter(Year == "2021" & DataZone != "S92000003") |>
  
  # Select and rename vars
  select(
    dz11_code = `DataZone`,
    `total_population` = AllAges,
    sex = Sex,
    Age0:Age90plus
  ) |>
  
  # Rename single years of age columns in line with England and Wales' naming
  rename_with(~ str_remove(.x, "Age"), starts_with("Age")) |>
  rename(`90+` = `90plus`)

# Rename
population21_dz11 <- population_dz

# Save output to data/ folder
usethis::use_data(population21_dz11, overwrite = TRUE)
