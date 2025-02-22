#--- init ----------------------------------------------------------------------

library(tidyverse)
library(geographr)
library(devtools)
library(httr2)

load_all(".")


#--- download ------------------------------------------------------------------

query_url <-
  query_urls |>
  filter(id == "household_type21_oa21") |>
  pull(query)


file <- tempfile(fileext = ".zip")

request(query_url) |>
  req_perform(file)

unzip(file, exdir = tempdir())

list.files(tempdir())


#--- read ----------------------------------------------------------------------

raw <- read_csv(file.path(tempdir(), "census2021-ts044-oa.csv"))


#--- clean ---------------------------------------------------------------------

names(raw) <- str_remove(names(raw), "Accommodation type: ")
names(raw) <- str_remove(names(raw), ",.*")

household_type21_oa21 <-
  raw |>
  rowwise() |>
  mutate(`Whole house` = sum(`Detached`, `Semi-detached`, `Terraced`)) |>
  mutate(`Flat or apartment` = sum(`In a purpose-built block of flats or tenement`, `Part of a converted or shared house`, `Part of another converted building`, `In a commercial building`)) |>
  mutate(`Mobile or temporary structure` = sum(`A caravan or other mobile or temporary structure`)) |>
  ungroup() |>
  select(lsoa21_code = `geography code`, total_households = `Total: All households`, `Whole house`, `Flat or apartment`, `Mobile or temporary structure`, -date, -geography) |>
  pivot_longer(cols = -c(lsoa21_code, total_households), names_to = "type", values_to = "n") |>
  mutate(prop = n / total_households)


#--- save ----------------------------------------------------------------------

usethis::use_data(household_type21_oa21, overwrite = TRUE)
