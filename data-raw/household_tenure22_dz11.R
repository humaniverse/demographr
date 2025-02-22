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
  filter(id == "household_tenure22_dz11") |>
  pull(query)

file <- query_url


#--- read ----------------------------------------------------------------------

raw <- read_excel(file, sheet = 1, skip = 10)


#--- clean ---------------------------------------------------------------------

raw <- raw |>
  select(-1) |>
  slice(-1) |>
  remove_missing()

household_tenure22_dz11 <-
  raw |>
  rowwise() |>
  mutate(Owned = sum(`Owned: Owned outright`, `Owned: Owned with a mortgage or loan`),
         `Shared ownership` = sum(`Owned: Shared ownership (part owned and part rented)`, `Owned: Shared Equity (e.g. LIFT or Help-to-Buy)`),
         `Social rented` = sum(`Social Rented: Council (LA) or Housing Association/ Registered Social Landlord`),
         `Private rented` = sum(`Private rented: Total`),
         `Lives rent free` = sum(`Lives Rent Free`)
         ) |>
  select(dz11_code = `...2`, total_households = `All occupied households`, `Owned`, `Shared ownership`, `Social rented`, `Private rented`, `Lives rent free`) |>
  pivot_longer(cols = -c(dz11_code, total_households), names_to = "tenure", values_to = "n") |>
  mutate(prop = n / total_households)


#--- save ----------------------------------------------------------------------

usethis::use_data(household_tenure22_dz11, overwrite = TRUE)
