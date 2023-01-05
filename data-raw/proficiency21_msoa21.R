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
  filter(id == "proficiency21_msoa21") |>
  pull(query)

download <- tempfile(fileext = ".zip")

request(query_url) |>
  req_perform(download)

unzip(download, exdir = tempdir())

list.files(tempdir())

raw <- read_csv(file.path(tempdir(), "census2021-ts029-msoa.csv"))

names(raw) <- str_remove(names(raw), "Proficiency in English language: ")

# ---- Data wrangling ----
proficiency21_msoa21 <- 
  raw |> 
  mutate(
    `Proportion who cannot speak English (well)` = (`Main language is not English (English or Welsh in Wales): Cannot speak English well` + `Main language is not English (English or Welsh in Wales): Cannot speak English`) / `Total: All usual residents aged 3 years and over`
  ) |> 
  select(-date, -geography, -starts_with("Total")) |>
  rename(msoa21_code = `geography code`) 

# ---- Save output to data/ folder ----
usethis::use_data(proficiency21_msoa21, overwrite = TRUE)
