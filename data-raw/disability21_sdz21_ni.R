#--- init ----------------------------------------------------------------------

library(tidyverse)
library(geographr)
library(devtools)
library(rio)

load_all(".")


#--- download ------------------------------------------------------------------

query_url <-
  query_urls |>
  filter(id == "disability21_sdz21_ni") |>
  pull(query)

file <- query_url


#--- read ----------------------------------------------------------------------

raw <- read.csv(file)


#--- clean ---------------------------------------------------------------------

names(raw) <- c("sdz21_code", "area", "disability_code", "disability", "n")

disability21_sdz21_ni <- raw |>
  select(sdz21_code, disability, n) |>
  group_by(sdz21_code) |>
  mutate(total_households = sum(n)) |>
  mutate(prop = n / total_households) |>
  relocate(sdz21_code, total_households, disability, n, prop)


#--- save ----------------------------------------------------------------------

usethis::use_data(disability21_sdz21_ni, overwrite = TRUE)
