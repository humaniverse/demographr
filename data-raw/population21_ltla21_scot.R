# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "estimates20_ltla21") |>
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
  rename(ltla21_code = Code) |>
  inner_join(ltla_codes_eng_wal, by = "ltla21_code") |>
  relocate(ltla21_name, .after = ltla21_code) |>
  select(-Geography, -Name) |>
  rename(total_population = `All ages`)

# To get valid 2021 codes for Scot and NI an bind

# Rename
population20_ltla21 <- pop_eng_wal

# Save output to data/ folder
usethis::use_data(population20_ltla21, overwrite = TRUE)
