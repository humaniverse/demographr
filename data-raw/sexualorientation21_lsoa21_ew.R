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
  filter(id == "sexualorientation21_msoa21_ew") |>
  pull(query)

download <- tempfile(fileext = ".zip")

request(query_url) |>
  req_perform(download)

unzip(download, exdir = tempdir())

list.files(tempdir())

raw <- read_csv(file.path(tempdir(), "census2021-ts077-msoa.csv")) # No data available at LSOA level

names(raw) <- str_remove(names(raw), "Sexual orientation: ")

# ---- Clean data ----
sexualorientation21_msoa21_ew <-
  raw |>
  select(-date, -geography) |>
  rename(
    msoa21_code = `geography code`,
    total_residents = `Total: All usual residents aged 16 years and over`
  ) |>
  pivot_longer(cols = -c(msoa21_code, total_residents), names_to = "sexual_orientation", values_to = "n") |>
  mutate(prop = n / total_residents) |>
  mutate(prop = format(prop, scientific = FALSE)) |>
  relocate(total_residents, .before = prop)


# ---- Save output to data/ folder ----
usethis::use_data(sexualorientation21_msoa21_ew, overwrite = TRUE)
