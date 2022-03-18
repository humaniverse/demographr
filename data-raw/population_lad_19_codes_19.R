# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# List of valid 2019 LAD codes for England and Wales
lad_codes_eng_wal <-
  lookup_lad_19_counties_ua_19 |>
  distinct(lad_19_name, lad_19_code)

# Set query url
query_url <-
  query_urls |>
  filter(id == "lad_19_codes_19") |>
  pull(query)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xls"))
)

pop <-
  read_excel(
    tf,
    sheet = "MYE2 - Persons",
    skip = 4
  )

# Valid pop for England and Wales
pop_eng_wal <-
  pop |>
  rename(lad_19_code = Code) |>
  inner_join(lad_codes_eng_wal, by = c("lad_19_code")) |>
  relocate(lad_19_name, .after = lad_19_code) |>
  select(-Name, -Geography1) |>
  rename(total_population = `All ages`)

# To get valid 2020 codes for Scot and NI an bind

# Rename
population_lad_19_codes_19 <- pop_eng_wal

# Save output to data/ folder
usethis::use_data(population_lad_19_codes_19, overwrite = TRUE)
