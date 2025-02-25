#--- init ----------------------------------------------------------------------

library(tidyverse)
library(geographr)
library(devtools)
library(httr2)

load_all(".")


#--- download ------------------------------------------------------------------

query_url <-
  query_urls |>
  filter(id == "household_type21_sdz21") |>
  pull(query)


file <- query_url


#--- read ----------------------------------------------------------------------

raw <- read.csv(file)


#--- clean ---------------------------------------------------------------------

names(raw) <- c("sdz21_code", "area", "type_code", "type", "n")

household_type21_sdz21 <-
  raw |>
  select(sdz21_code, type, n) |>
  group_by(sdz21_code) |>
  mutate(total_households = sum(n)) |>
  mutate(prop = n / total_households) |>
  relocate(sdz21_code, total_households, type, n, prop)


#--- save ----------------------------------------------------------------------

usethis::use_data(household_type21_sdz21, overwrite = TRUE)
