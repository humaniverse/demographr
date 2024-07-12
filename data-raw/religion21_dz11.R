library(tidyverse)

religion21_dz11 <- read_csv("data-raw/scotland/table_2024-07-12_20-33-05.csv", skip = 10)

religion21_dz11 <- 
  religion21_dz11 |> 
  slice(-1) |> 
  rename(dz11_code = Religion) |> 
  pivot_longer(cols = -(dz11_code:`All people`), names_to = "religion", values_to = "count") |> 
  mutate(proportion = count / `All people`) |> 
  select(-`All people`)

# ---- Save output to data/ folder ----
usethis::use_data(religion21_dz11, overwrite = TRUE)
