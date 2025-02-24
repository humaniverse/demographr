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
  filter(id == "household_overcrowding22_dz11") |>
  pull(query)


file <- query_url


#--- read ----------------------------------------------------------------------

raw <- read_excel(file, sheet = 1, skip = 10)


#--- clean ---------------------------------------------------------------------

raw <- raw |>
  select(-1) |>
  slice(-1) |>
  remove_missing()

names(raw) <- str_remove(names(raw), "Occupancy rating of bedrooms: ")

household_overcrowding22_dz11 <-
  raw |>
  select(dz11_code = `...2`, total_households = `All occupied households`, everything()) |>
  pivot_longer(cols = -c(dz11_code, total_households), names_to = "occupancy_rating", values_to = "n") |>
  mutate(occupancy_rating = case_when(str_detect(occupancy_rating , "\\-2") ~ paste(occupancy_rating, "(overcrowded)"),
                                      str_detect(occupancy_rating , "\\-1") ~ paste(occupancy_rating, "(overcrowded)"),
                                      str_detect(occupancy_rating , "0")    ~ paste(occupancy_rating, "(ideal)"),
                                      str_detect(occupancy_rating , "\\+1") ~ paste(occupancy_rating, "(under-occupied)"),
                                      str_detect(occupancy_rating , "\\+2") ~ paste(occupancy_rating, "(under-occupied)")
                                      )) |>
  mutate(prop = n / total_households)


#--- save ----------------------------------------------------------------------

usethis::use_data(household_overcrowding22_dz11, overwrite = TRUE)
