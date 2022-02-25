# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# List of valid 2020 LAD codes for England and Wales
lad_codes_eng_wal <-
  lookup_lad_counties_20 %>%
  distinct(lad_name, lad_code)

# Set query url
query_url <-
  query_urls |>
  filter(id == "lad_19_codes_20") |>
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
  pop %>%
  rename(lad_code = Code) %>%
  inner_join(lad_codes_eng_wal, by = c("lad_code")) |>
  relocate(lad_name, .after = lad_code) %>%
  select(-Name, -Geography1) %>%
  rename(total_population = `All ages`)

# To get valid 2020 codes for Scot and NI an bind

# Rename
population_lad_19_codes_20 <- pop_eng_wal

# Save output to data/ folder
usethis::use_data(population_lad_19_codes_20, overwrite = TRUE)