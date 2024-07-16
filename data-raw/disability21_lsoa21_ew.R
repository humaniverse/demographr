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
  filter(id == "disability21_lsoa21_ew") |>
  pull(query)

download <- tempfile(fileext = ".zip")

request(query_url) |>
  req_perform(download)

unzip(download, exdir = tempdir())

list.files(tempdir())

raw <- read_csv(file.path(tempdir(), "census2021-ts038-lsoa.csv"))

names(raw) <- str_remove(names(raw), "Disability: ")

# ---- Detailed ethnic categories ----
disability21_lsoa21_ew <-
  raw |>
  select(
    lsoa21_code = `geography code`,
    total_residents = `Total: All usual residents`, !contains(":"), -date, -geography
  ) |>
  pivot_longer(cols = -c(lsoa21_code, total_residents), names_to = "disability", values_to = "n") |>
  mutate(prop = n / total_residents) |>
  relocate(total_residents, .before = prop)

# ---- Save output to data/ folder ----
usethis::use_data(disability21_lsoa21_ew, overwrite = TRUE)
