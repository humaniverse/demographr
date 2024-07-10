# ---- Load libs ----
library(tidyverse)
library(geographr)
library(devtools)
library(httr2)

# ---- Load internal sysdata.rda file with URLs ----
load_all(".")

# ---- Download data ----
query_url <-
  query_urls |>
  filter(id == "religion") |>
  pull(query)

download <- tempfile(fileext = ".zip")

request(query_url) |>
  req_perform(download)

unzip(download, exdir = tempdir())

list.files(tempdir())

raw_lsoa21 <- read_csv(file.path(tempdir(), "census2021-ts030-lsoa.csv"))

names(raw_lsoa21) <- str_remove(names(raw_lsoa21), "Religion: ")

# ---- Detailed ethnic categories ----
religion21_lsoa21 <- 
  raw_lsoa21 |> 
  select(lsoa21_code = `geography code`, total_residents = `Total: All usual residents`, !contains(":"), -date, -geography) |> 
  pivot_longer(cols = -c(lsoa21_code, total_residents), names_to = "religion", values_to = "n") |> 
  mutate(prop = n / total_residents)

# ---- Save output to data/ folder ----
usethis::use_data(religion21_lsoa21, overwrite = TRUE)
