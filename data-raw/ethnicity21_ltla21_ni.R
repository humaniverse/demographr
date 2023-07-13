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
  filter(id == "ethnicity21_ltla21_ni") |>
  pull(query)

download <- tempfile(fileext = ".xlsx")

request(query_url) |>
  req_perform(download)

raw_count <- read_excel(
  download,
  sheet = "MS-B01",
  range = "A9:P21"
)

raw_percent <- read_excel(
  download,
  sheet = "MS-B01",
  range = "A24:P36"
)

# ---- Clean data ----
ethnicity_count <-
  raw_count |> 
  select(
    ltla21_name = Geography,
    ltla21_code = `Geography code`,
    `White (number)` = White,
    `White: Irish Traveller (number)` = `Irish Traveller`,
    `White: Roma (number)` = Roma,
    `Asian: Indian (number)` = Indian,
    `Asian: Chinese (number)` = Chinese,
    `Asian: Filipino (number)` = Filipino,
    `Asian: Pakistani (number)` = Pakistani,
    `Arab (number)` = Arab,
    `Other Asian (number)` = `Other Asian`,
    `Black: African (number)` = `Black African`,
    `Other Black (number)` = `Black Other`,
    `Mixed ethnic groups (number)` = Mixed,
    `Other ethnicities (number)` = `Other ethnicities`
  ) |> 
  filter(ltla21_code != "N92000002") |> 
  pivot_longer(
    !starts_with("ltla21"),
    names_to = "ethnic_group",
    values_to = "value"
  )

ethnicity_percent <-
  raw_percent |> 
  select(
    ltla21_name = Geography,
    ltla21_code = `Geography code`,
    `White (percent)` = White,
    `White: Irish Traveller (percent)` = `Irish Traveller`,
    `White: Roma (percent)` = Roma,
    `Asian: Indian (percent)` = Indian,
    `Asian: Chinese (percent)` = Chinese,
    `Asian: Filipino (percent)` = Filipino,
    `Asian: Pakistani (percent)` = Pakistani,
    `Arab (percent)` = Arab,
    `Other Asian (percent)` = `Other Asian`,
    `Black: African (percent)` = `Black African`,
    `Other Black (percent)` = `Black Other`,
    `Mixed ethnic groups (percent)` = Mixed,
    `Other ethnicities (percent)` = `Other ethnicities`
  ) |> 
  filter(ltla21_code != "N92000002") |> 
  pivot_longer(
    !starts_with("ltla21"),
    names_to = "ethnic_group",
    values_to = "value"
  )

ethnicity21_ltla21_ni <- 
  bind_rows(
    ethnicity_count,
    ethnicity_percent
  )

# ---- Save output to data/ folder ----
usethis::use_data(ethnicity21_ltla21_ni, overwrite = TRUE)
