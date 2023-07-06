# Age and gender demographic indicators in Northern Ireland
# Geography level: Health and Social Care Trusts

# ---- Load libs ----
library(tidyverse)
library(readODS)
library(devtools)
library(httr2)

# ---- Load internal sysdata.rda file with URL's ----
load_all(".")

# ---- Download data ----
query_url <-
  query_urls |>
  filter(id == "age_gender_hsct20_ni") |>
  pull(query)

download <- tempfile(fileext = ".ods")

request(query_url) |>
  req_perform(download)

raw <- read_ods(
  download,
  sheet = "HSCT",
  range = "A4:Q9"
)

# ---- Clean data ----
age_gender_hsct20_ni <- raw |>
  mutate(
    younger_females = `Female: 0-15 years`,
    working_age_females = `Female: 16-39 years` + `Female: 40-64 years`,
    older_females = `Female: 65+ years`,
    younger_males = `Male: 0-15 years`,
    working_age_males = `Male: 16-39 years` + `Male: 40-64 years`,
    older_males = `Male: 65+ years`,
  ) |>
  select(
    hsct20_name = "HSCT",
    hsct20_code = "HSCT Code",
    total_population = "Persons",
    total_female_population = "Female",
    total_male_population = "Male",
    younger_females,
    working_age_females,
    older_females,
    younger_males,
    working_age_males,
    older_males
  )

# ---- Save output to data/ folder ----
usethis::use_data(age_gender_hsct20_ni, overwrite = TRUE)
