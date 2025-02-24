#--- init ----------------------------------------------------------------------

library(tidyverse)
library(geographr)
library(devtools)
library(httr2)

load_all(".")


#--- download ------------------------------------------------------------------

query_url <-
  query_urls |>
  filter(id == "household_tenure21_oa21") |>
  pull(query)


file <- tempfile(fileext = ".zip")

request(query_url) |>
  req_perform(file)

unzip(file, exdir = tempdir())

list.files(tempdir())


#--- read ----------------------------------------------------------------------

raw <- read_csv(file.path(tempdir(), "census2021-ts054-oa.csv"))


#--- clean ---------------------------------------------------------------------

names(raw) <- str_remove(names(raw), "Tenure of household: ")

household_tenure21_oa21 <-
  raw |>
  select(oa21_code = `geography code`, total_households = `Total: All households`, contains(":"), `Lives rent free`, -date, -geography) |>
  pivot_longer(cols = -c(oa21_code, total_households), names_to = "tenure", values_to = "n") |>
  mutate(prop = n / total_households)


#--- save ----------------------------------------------------------------------

usethis::use_data(household_tenure21_oa21, overwrite = TRUE)
