# ---- Load libs ----
library(tidyverse)
library(readxl)
library(sf)
library(geographr)
library(devtools)
library(httr2)

# ---- LTLA lookup table ----
lookup_ltla21 <- boundaries_ltla21 |>
  st_drop_geometry()

# ---- Load internal sysdata.rda file with URL's ----
load_all(".")

# ---- Download data ----
query_url <-
  query_urls |>
  filter(id == "ethnicity21_ltla21") |>
  pull(query)

download <- tempfile(fileext = ".xlsx")

request(query_url) |>
  req_perform(download)

raw <- read_excel(
  download,
  sheet = "Figure 3",
  range = "A5:AN336"
)

# ---- Clean data ----
ethnicity_longer <- raw |>
  pivot_longer(
    !starts_with("Area"),
    names_to = "ethnic_group",
    values_to = "value"
  )

ethnicity21_ltla21 <-
  ethnicity_longer |>
  mutate(ethnic_group = str_replace_all(ethnic_group, "\r\n", " ")) |>
  rename(ltla21_code = `Area code`, ltla21_name = `Area name`)

# ---- Save output to data/ folder ----
usethis::use_data(ethnicity21_ltla21, overwrite = TRUE)
