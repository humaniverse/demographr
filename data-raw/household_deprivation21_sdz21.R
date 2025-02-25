#--- init ----------------------------------------------------------------------

library(tidyverse)
library(geographr)
library(devtools)
library(httr2)

load_all(".")


#--- download ------------------------------------------------------------------

query_url <-
  query_urls |>
  filter(id == "household_deprivation21_sdz21") |>
  pull(query)


file <- query_url


#--- read ----------------------------------------------------------------------

raw <- read.csv(file)


#--- clean ---------------------------------------------------------------------

names(raw) <- c("sdz21_code", "area", "rating_code", "deprivation_dimensions", "n")

household_deprivation21_sdz21 <-
  raw |>
  select(sdz21_code, deprivation_dimensions, n) |>
  group_by(sdz21_code) |>
  mutate(total_households = sum(n)) |>
  mutate(prop = n / total_households) |>
  relocate(sdz21_code, total_households, deprivation_dimensions, n, prop)


#--- save ----------------------------------------------------------------------

usethis::use_data(household_deprivation21_sdz21, overwrite = TRUE)
