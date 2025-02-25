#--- init ----------------------------------------------------------------------

library(tidyverse)
library(readxl)
library(geographr)
library(devtools)
library(httr2)

load_all(".")


#--- download ------------------------------------------------------------------

query_url <-
  query_urls |>
  filter(id == "household_deprivation11_dz11") |>
  pull(query)


file <- query_url


#--- read ----------------------------------------------------------------------

raw <- read_excel(file, sheet = 1, skip = 10)


#--- clean ---------------------------------------------------------------------

raw <- raw |>
  select(-1) |>
  slice(-1) |>
  remove_missing()

household_deprivation11_dz11 <-
  raw |>
  select(dz11_code = `...2`, total_households = `All households`, everything()) |>
  pivot_longer(cols = -c(dz11_code, total_households), names_to = "deprivation_dimensions", values_to = "n") |>
  mutate(prop = n / total_households)


#--- save ----------------------------------------------------------------------

usethis::use_data(household_deprivation11_dz11, overwrite = TRUE)
