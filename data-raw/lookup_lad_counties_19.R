# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")


# Set query url
query_url <-
  query_urls %>%
  filter(id == "lad_counties_19") %>%
  pull(query)

lad_counties <-
  read_sf(query_url)

lad_counties <-
  lad_counties %>%
  select(
    lad_name = LTLA19NM,
    lad_code = LTLA19CD,
    county_ua_name = UTLA19NM,
    county_ua_code = UTLA19CD
  )

# Rename
lookup_lad_counties_19 <- lad_counties

# Save output to data/ folder
usethis::use_data(lookup_lad_counties_19, overwrite = TRUE)