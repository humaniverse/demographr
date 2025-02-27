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
  filter(id == "disability22_dz11_scot") |>
  pull(query)

file <- query_url


#--- read ----------------------------------------------------------------------

raw <- read_excel(file, sheet = 1, skip = 10)


#--- clean ---------------------------------------------------------------------

raw <- raw |>
  select(-1) |>
  slice(-1) |>
  remove_missing()


disability22_dz11_scot <-
  raw |>
  select(dz11_code = `...2`, total_residents= `All people`, everything()) |>
  pivot_longer(cols = -c(dz11_code, total_residents), names_to = "disability", values_to = "n") |>
  mutate(prop = n / total_residents)


#--- save ----------------------------------------------------------------------

usethis::use_data(disability22_dz11_scot, overwrite = TRUE)
