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
  filter(id == "msoa_20_codes_11") |>
  pull(query)


GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

msoa_pop <- read_excel(tf,
  sheet = "Mid-2020 Persons",
  skip = 4
)

# Select and rename vars
msoa_pop <-
  msoa_pop |>
  select(
    msoa_11_name = `MSOA Name`,
    msoa_11_code = `MSOA Code`,
    `total_population` = `All Ages`,
    `0`:`90+`
  ) |>
  distinct()

# Rename
population_msoa_20_codes_11 <- msoa_pop

# Save output to data/ folder
usethis::use_data(population_msoa_20_codes_11, overwrite = TRUE)
