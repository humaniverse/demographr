# ---- Load libs ----
library(tidyverse)
library(devtools)
library(rio)

# ---- Load internal sysdata.rda file with URLs ----
load_all(".")

# ---- Download data ----
query_url <-
  query_urls |>
  filter(id == "age_gender23_ltla21_ni") |>
  pull(query)

raw <- import(query_url, sheet = "Flat")

# ---- Clean data ----
# LGD renamed ltla for consistency in package
age_gender23_ltla_ni <- raw |>
  filter(area == "2. Local Government Districts (LGD2014)" & year == "2023" ) |>
  group_by(area_name, area_code) |>
  summarise(
    total_population = sum(MYE[sex == "All persons"], na.rm = TRUE),
    total_female_population = sum(MYE[sex == "Females"], na.rm = TRUE),
    total_male_population = sum(MYE[sex == "Males"], na.rm = TRUE),
    younger_females = sum(MYE[sex == "Females" & age_broad %in% c("00-15")], na.rm = TRUE),
    working_age_females = sum(MYE[sex == "Females" & age_broad %in% c("16-39", "40-64")], na.rm = TRUE),
    older_females   = sum(MYE[sex == "Females" & age_broad == "65+"], na.rm = TRUE),
    younger_males   = sum(MYE[sex == "Males"   & age_broad %in% c("00-15")], na.rm = TRUE),
    working_age_males = sum(MYE[sex == "Males" & age_broad %in% c("16-39", "40-64")], na.rm = TRUE),
    older_males   = sum(MYE[sex == "Males" & age_broad == "65+"], na.rm = TRUE),
    .groups = "drop") |>
  rename(ltla21_name = area_name,
         ltla21_code = area_code)
  

# ---- Save output to data/ folder ----
usethis::use_data(age_gender23_ltla_ni, overwrite = TRUE)
