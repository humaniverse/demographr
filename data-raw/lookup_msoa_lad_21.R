# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "msoa_lad_21") |>
  pull(query)

msoa_lad <-
  read_sf(query_url)

# Select and rename vars
msoa_lad <-
  msoa_lad |>
  select(
    msoa_name = MSOA11NM,
    msoa_code = MSOA11CD,
    lad_name = LAD21NM,
    lad_code = LAD21CD
  )

# Rename
lookup_msoa_lad_21 <- msoa_lad

# Save output to data/ folder
usethis::use_data(lookup_msoa_lad_21, overwrite = TRUE)