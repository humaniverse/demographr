#--- init ----------------------------------------------------------------------

library(tidyverse)
library(geographr)
library(devtools)
library(httr2)

load_all(".")


#--- download ------------------------------------------------------------------

query_url <-
  query_urls |>
  filter(id == "household_overcrowding21_lsoa21") |>
  pull(query)


file <- tempfile(fileext = ".zip")

request(query_url) |>
  req_perform(file)

unzip(file, exdir = tempdir())

list.files(tempdir())


#--- read ----------------------------------------------------------------------

raw <- read_csv(file.path(tempdir(), "census2021-ts052-lsoa.csv"))


#--- clean ---------------------------------------------------------------------

names(raw) <- str_remove(names(raw), "Occupancy rating for bedrooms: ")
names(raw) <- str_remove(names(raw), "Occupancy rating of bedrooms: ")

household_overcrowding21_lsoa21 <-
  raw |>
  select(lsoa21_code = `geography code`, total_households = `Total: All households`, everything(), -date, -geography) |>
  pivot_longer(cols = -c(lsoa21_code, total_households), names_to = "occupancy_rating", values_to = "n") |>
  mutate(occupancy_rating = case_when(str_detect(occupancy_rating , "\\-2") ~ paste(occupancy_rating, "(overcrowded)"),
                                      str_detect(occupancy_rating , "\\-1") ~ paste(occupancy_rating, "(overcrowded)"),
                                      str_detect(occupancy_rating , "0")    ~ paste(occupancy_rating, "(ideal)"),
                                      str_detect(occupancy_rating , "\\+1") ~ paste(occupancy_rating, "(under-occupied)"),
                                      str_detect(occupancy_rating , "\\+2") ~ paste(occupancy_rating, "(under-occupied)")
                                      )) |>
  mutate(prop = n / total_households)


#--- save ----------------------------------------------------------------------

usethis::use_data(household_overcrowding21_lsoa21, overwrite = TRUE)
