library(tidyverse)
library(readxl)

age_gender21_dz11 <- 
  read_excel(
    "data-raw/scotland/table_2024-07-12_20-33-56.xlsx", 
    skip = 9, 
    col_names = c("age_group", "all_people", "female", "male")
  )

age_gender21_dz11 <- 
  age_gender21_dz11 |> 
  filter(!age_group %in% c("Age", "Sex")) |> 
  mutate(dz11_code = if_else(str_detect(age_group, "^S"), age_group, NA_character_)) |> 
  fill(dz11_code) |> 
  drop_na() |> 
  relocate(dz11_code)

# ---- Save output to data/ folder ----
usethis::use_data(age_gender21_dz11, overwrite = TRUE)
