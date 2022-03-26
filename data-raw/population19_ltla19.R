# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# List of valid 2019 LAD codes for England and Wales
ltla_codes_eng_wal <-
  lookup_ltla19_utla19 |>
  distinct(ltla19_name, ltla19_code)

# Set query url
query_url <-
  query_urls |>
  filter(id == "estimates19_ltla19") |>
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
  rename(ltla19_code = Code) |>
  inner_join(ltla_codes_eng_wal, by = c("ltla19_code")) |>
  relocate(ltla19_name, .after = ltla19_code) |>
  select(-Name, -Geography1) |>
  rename(total_population = `All ages`)

# To get valid 2020 codes for Scot and NI an bind

# Rename
population19_ltla19 <- pop_eng_wal

# Save output to data/ folder
usethis::use_data(population19_ltla19, overwrite = TRUE)
