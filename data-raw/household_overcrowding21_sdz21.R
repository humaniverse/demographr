#--- init ----------------------------------------------------------------------

library(tidyverse)
library(geographr)
library(devtools)
library(httr2)

load_all(".")


#--- download ------------------------------------------------------------------

query_url <-
  query_urls |>
  filter(id == "household_overcrowding21_sdz21") |>
  pull(query)


file <- query_url


#--- read ----------------------------------------------------------------------

raw <- read.csv(file)


#--- clean ---------------------------------------------------------------------

names(raw) <- c("sdz21_code", "area", "rating_code", "occupancy_rating", "n")

household_overcrowding21_sdz21 <-
  raw |>
  select(sdz21_code, occupancy_rating, n) |>
  mutate(occupancy_rating = str_remove(occupancy_rating, "Occupancy rating - Rooms: ")) |>
  mutate(occupancy_rating = case_when(str_detect(occupancy_rating , "\\-2") ~ paste(occupancy_rating, "(overcrowded)"),
                                      str_detect(occupancy_rating , "\\-1") ~ paste(occupancy_rating, "(overcrowded)"),
                                      str_detect(occupancy_rating , "0")    ~ paste(occupancy_rating, "(ideal)"),
                                      str_detect(occupancy_rating , "\\+1") ~ paste(occupancy_rating, "(under-occupied)"),
                                      str_detect(occupancy_rating , "\\+2") ~ paste(occupancy_rating, "(under-occupied)")
                                      )) |>
  group_by(sdz21_code) |>
  mutate(total_households = sum(n)) |>
  mutate(prop = n / total_households) |>
  relocate(sdz21_code, total_households, occupancy_rating, n, prop)


#--- save ----------------------------------------------------------------------

usethis::use_data(household_overcrowding21_sdz21, overwrite = TRUE)
