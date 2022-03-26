# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# List of valid 2020 LAD codes for England and Wales
counties_codes_eng_wal <-
  lookup_ltla20_utla20 |>
  distinct(utla20_name, utla20_code)

# Set query url
query_url <-
  query_urls |>
  filter(id == "estimates20_utla20") |>
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
  rename(utla20_code = Code) |>
  inner_join(counties_codes_eng_wal, by = c("utla20_code")) |>
  relocate(utla20_name, .after = utla20_code) |>
  select(-Name, -Geography) |>
  rename(total_population = `All ages`)

# To get valid 2020 codes for Scot and NI an bind

# Rename
population20_utla20 <- pop_eng_wal

# Save output to data/ folder
usethis::use_data(population20_utla20, overwrite = TRUE)
