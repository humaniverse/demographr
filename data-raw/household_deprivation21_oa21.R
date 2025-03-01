#--- init ----------------------------------------------------------------------

library(tidyverse)
library(geographr)
library(devtools)
library(httr2)

load_all(".")


#--- download ------------------------------------------------------------------

query_url <-
  query_urls |>
  filter(id == "household_deprivation21_oa21") |>
  pull(query)


file <- tempfile(fileext = ".zip")

request(query_url) |>
  req_perform(file)

unzip(file, exdir = tempdir())

list.files(tempdir())


#--- read ----------------------------------------------------------------------

raw <- read_csv(file.path(tempdir(), "census2021-ts011-oa.csv"))


#--- clean ---------------------------------------------------------------------

names(raw) <- str_remove(names(raw), "Household deprivation: ")
names(raw) <- str_remove(names(raw), "; measures: Value")

household_deprivation21_oa21 <-
  raw |>
  select(oa21_code = `geography code`, total_households = `Total: All households`, contains("Household"), -date, -geography) |>
  pivot_longer(cols = -c(oa21_code, total_households), names_to = "deprivation_dimensions", values_to = "n") |>
  mutate(prop = n / total_households)


#--- save ----------------------------------------------------------------------

usethis::use_data(household_deprivation21_oa21, overwrite = TRUE)
