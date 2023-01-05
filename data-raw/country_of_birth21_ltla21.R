# ---- Load libs ----
library(tidyverse)
library(geographr)
library(devtools)
library(httr2)
library(janitor)

# ---- Load internal sysdata.rda file with URLs ----
load_all(".")

# ---- Download data ----
query_url <-
  query_urls |>
  filter(id == "country_of_birth21_ltla21") |>
  pull(query)

download <- tempfile(fileext = ".zip")

request(query_url) |>
  req_perform(download)

unzip(download, exdir = tempdir())

list.files(tempdir())

raw <- read_csv(file.path(tempdir(), "census2021-ts012-ltla.csv"))

names(raw) <- str_remove(names(raw), "Country of birth:")
names(raw) <- str_remove(names(raw), "; measures: Value")

# ---- Clean data ----
country_of_birth21_ltla21 <-
  raw |>
  clean_names() |> 
  pivot_longer(cols = -c("date", "geography", "geography_code", "total_all_usual_residents"), names_to = "country_of_birth", values_to = "value") |> 
  mutate(prop = value / total_all_usual_residents) |> 
  select(-date, ltla21_name = geography, ltla21_code = geography_code)
  
# ---- Save output to data/ folder ----
usethis::use_data(country_of_birth21_ltla21, overwrite = TRUE)
