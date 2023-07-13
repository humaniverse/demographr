# Ethnicity demographic indicators in Northern Ireland local authorities

# ---- Load libs ----
library(tidyverse)
library(readxl)
library(devtools)
library(httr2)

# ---- Load internal sysdata.rda file with URL's ----
load_all(".")

# ---- Download data ----
query_url <-
  query_urls |>
  filter(id == "age_gender_ltla21_ni") |>
  pull(query)

download <- tempfile(fileext = ".xlsx")

request(query_url) |>
  req_perform(download)

raw <- read_excel(
  download,
  sheet = "MS-B01",
  range = "A9:BJ21"
)
