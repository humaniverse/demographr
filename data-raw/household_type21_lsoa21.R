#--- init ----------------------------------------------------------------------

library(tidyverse)
library(geographr)
library(devtools)
library(httr2)

load_all(".")


#--- download ------------------------------------------------------------------

query_url <-
  query_urls |>
  filter(id == "household_type21_lsoa21") |>
  pull(query)


file <- tempfile(fileext = ".zip")

request(query_url) |>
  req_perform(file)

unzip(file, exdir = tempdir())

list.files(tempdir())


#--- read ----------------------------------------------------------------------

raw <- read_csv(file.path(tempdir(), "census2021-ts044-lsoa.csv"))


#--- clean ---------------------------------------------------------------------

names(raw) <- str_remove(names(raw), "Accommodation type: ")

household_type21_lsoa21 <-
  raw |>
  select(lsoa21_code = `geography code`, total_households = `Total: All households`, everything(), -date, -geography) |>
  pivot_longer(cols = -c(lsoa21_code, total_households), names_to = "type", values_to = "n") |>
  mutate(prop = n / total_households)


#--- save ----------------------------------------------------------------------

usethis::use_data(household_type21_lsoa21, overwrite = TRUE)
