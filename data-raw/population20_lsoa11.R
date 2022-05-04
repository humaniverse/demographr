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
  filter(id == "estimates20_lsoa11") |>
  pull(query)


GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

lsoa_pop <- read_excel(tf,
  sheet = "Mid-2020 Persons",
  skip = 4
)

# Select and rename vars
lsoa_pop <-
  lsoa_pop %>%
  select(
    lsoa11_name = `LSOA Name`,
    lsoa11_code = `LSOA Code`,
    `total_population` = `All Ages`,
    `0`:`90+`
  ) %>%
  distinct()

# Rename
population20_lsoa11 <- lsoa_pop

# Save output to data/ folder
usethis::use_data(population20_lsoa11, overwrite = TRUE)
