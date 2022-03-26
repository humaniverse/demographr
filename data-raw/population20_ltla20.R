# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# List of valid 2020 LAD codes for England and Wales
ltla_codes_eng_wal <-
  lookup_ltla20_utla20 |>
  distinct(ltla20_name, ltla20_code) 

# Set query url
query_url <-
  query_urls |>
  filter(id == "estimates20_ltla20") |>
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
  rename(ltla20_code = Code) |>
  inner_join(ltla_codes_eng_wal, by = "ltla20_code") |>
  relocate(ltla20_name, .after = ltla20_code) |>
  select(-Geography, -Name) |>
  rename(total_population = `All ages`)

# To get valid 2020 codes for Scot and NI an bind

# Rename
population20_ltla20 <- pop_eng_wal

# Save output to data/ folder
usethis::use_data(population20_ltla20, overwrite = TRUE)
