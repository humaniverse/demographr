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
  filter(id == "household_type22_dz11") |>
  pull(query)

file <- query_url


#--- read ----------------------------------------------------------------------

raw <- read_excel(file, sheet = 1, skip = 10)


#--- clean ---------------------------------------------------------------------

raw <- raw |>
  select(-1) |>
  slice(-1)

names(raw) <- str_remove(names(raw), ": Total")

household_type22_dz11 <-
  raw |>
  rename(`Whole house` = `Whole house or bungalow`, `Flat or apartment` = `Flat, maisonette or apartment`, `Mobile or temporary structure` = `Caravan or other mobile or temporary structure`) |>
  select(dz11_code = `...2`, total_households = `All occupied households`, !contains(":")) |>
  pivot_longer(cols = -c(dz11_code, total_households), names_to = "type", values_to = "n") |>
  mutate(prop = n / total_households)


#--- save ----------------------------------------------------------------------

usethis::use_data(household_type22_dz11, overwrite = TRUE)
