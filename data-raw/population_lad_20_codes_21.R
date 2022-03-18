# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# List of valid 2021 LAD codes for England and Wales
lad_codes_eng_wal <-
  lookup_lad_21_counties_ua_21 |>
  distinct(lad_21_name, lad_21_code) 

# Set query url
query_url <-
  query_urls |>
  filter(id == "lad_20_codes_21") |>
  pull(query)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xls"))
)

pop <-
  read_excel(
    tf,
    sheet = "MYE2 - Persons",
    skip = 7
  )

# Valid pop for England and Wales
pop_eng_wal <-
  pop |>
  rename(lad_21_code = Code) |>
  inner_join(lad_codes_eng_wal, by = "lad_21_code") |>
  relocate(lad_21_name, .after = lad_21_code) |>
  select(-Geography, -Name) |>
  rename(total_population = `All ages`)

# To get valid 2021 codes for Scot and NI an bind

# Rename
population_lad_20_codes_21 <- pop_eng_wal

# Save output to data/ folder
usethis::use_data(population_lad_20_codes_21, overwrite = TRUE)
