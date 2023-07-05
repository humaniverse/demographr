# Age and gender demographic indicators in Northern Ireland
# Geography level: Local Government District

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
  sheet = "MS-A08",
  range = "A9:BJ21"
)

# ---- Clean data ----
# LGD renamed ltla for consistency in package

age_gender_ltla21_ni <- raw |>
  mutate(
    younger_females = `Female:\r\n 0-4 years` + `Female: \r\n5-9 years` + `Female: \r\n10-14 years` + `Female: \r\n15-19 years`,
    working_age_females = `Female: \r\n20-24 years` + `Female: \r\n25-29 years` + `Female: \r\n30-34 years` + `Female: \r\n35-39 years` + `Female: \r\n40-44 years` + `Female: \r\n45-49 years` + `Female: \r\n50-54 years` + `Female: \r\n55-59 years` + `Female: \r\n60-64 years`,
    older_females = `Female: \r\n65-69 years` + `Female: \r\n70-74 years` + `Female: \r\n75-79 years` + `Female: \r\n80-84 years` + `Female: \r\n85-89 years` + `Female: \r\n90+ years`,
    younger_males = `Male: \r\n0-4 years` + `Male: \r\n5-9 years` + `Male: \r\n10-14 years` + `Male: \r\n15-19 years`,
    working_age_males = `Male: \r\n20-24 years` + `Male: \r\n25-29 years` + `Male: \r\n30-34 years` + `Male: \r\n35-39 years` + `Male: \r\n40-44 years` + `Male: \r\n45-49 years` + `Male: \r\n50-54 years` + `Male: \r\n55-59 years` + `Male: \r\n60-64 years`,
    older_males = `Male: \r\n65-69 years` + `Male: \r\n70-74 years` + `Male: \r\n75-79 years` + `Male: \r\n80-84 years` + `Male: \r\n85-89 years` + `Male: \r\n90+ years`
    ) |>
  select(
    ltla21_name = "Geography",
    ltla21_code = "Geography code",
    total_population = "All usual residents:\r\nAll ages",
    total_female_population = "Female: \r\nAll ages",
    total_male_population = "Male:\r\nAll ages",
    younger_females,
    working_age_females,
    older_females,
    younger_males,
    working_age_males,
    older_males
  )
    
# ---- Save output to data/ folder ----
usethis::use_data(age_gender_ltla21_ni, overwrite = TRUE)
