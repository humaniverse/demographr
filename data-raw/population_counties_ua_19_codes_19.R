# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# List of valid 2019 LAD codes for England and Wales
counties_codes_eng_wal <-
  lookup_lad_counties_19 %>%
  distinct(county_ua_name, county_ua_code)

# Set query url
query_url <-
  query_urls |>
  filter(id == "counties_19_codes_19") |>
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
  rename(county_ua_code = Code) %>%
  inner_join(counties_codes_eng_wal, by = c("county_ua_code")) |>
  relocate(county_ua_name, .after = county_ua_code) %>%
  select(-Name, -Geography1) %>%
  rename(total_population = `All ages`)

# To get valid 2020 codes for Scot and NI an bind

# Rename
population_counties_ua_19_codes_19 <- pop_eng_wal

# Save output to data/ folder
usethis::use_data(population_counties_ua_19_codes_19, overwrite = TRUE)