library(tidyverse)

ethnicity21_dz11 <- read_csv("data-raw/scotland/table_2024-07-12_20-31-26.csv", skip = 10)

ethnicity21_dz11 <- 
  ethnicity21_dz11 |> 
  slice(-1) |> 
  rename(dz11_code = `Ethnic Group`) |> 
  pivot_longer(cols = -(dz11_code:`All People`), names_to = "religion", values_to = "count") |> 
  mutate(proportion = count / `All People`) |> 
  select(-`All People`)

# ---- Save output to data/ folder ----
usethis::use_data(ethnicity21_dz11, overwrite = TRUE)
