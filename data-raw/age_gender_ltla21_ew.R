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
  filter(id == "age_gender_ltla21_ew") |>
  pull(query)

download <- tempfile(fileext = ".zip")

request(query_url) |>
  req_perform(download)

unzip(download, exdir = tempdir())

list.files(tempdir())

raw <- read_csv(file.path(tempdir(), "census2021-ts009-ltla.csv")) # No data available at LSOA level

# ---- Clean data ----
age_gender21_ltla21_ew <-
  raw |>
  mutate(
    younger_females = 
      `Sex: Female; Age: Aged under 1 year; measures: Value` +
      `Sex: Female; Age: Aged 4 years and under; measures: Value` + 
      `Sex: Female; Age: Aged 5 to 9 years; measures: Value` +
      `Sex: Female; Age: Aged 10 to 15 years; measures: Value`,
    working_age_females = 
      `Sex: Female; Age: Aged 16 to 19 years; measures: Value` + 
      `Sex: Female; Age: Aged 20 to 24 years; measures: Value` +
      `Sex: Female; Age: Aged 25 to 34 years; measures: Value` + 
      `Sex: Female; Age: Aged 35 to 49 years; measures: Value` +
      `Sex: Female; Age: Aged 50 to 64 years; measures: Value`,
    older_females = 
      `Sex: Female; Age: Aged 65 to 74 years; measures: Value`, + 
      `Sex: Female; Age: Aged 75 to 84 years; measures: Value` +
      `Sex: Female; Age: Aged 85 years and over; measures: Value` + 
      `Sex: Female; Age: Aged 90 years and over; measures: Value`,
    younger_males = 
      `Sex: Male; Age: Aged under 1 year; measures: Value` +
      `Sex: Male; Age: Aged 4 years and under; measures: Value` + 
      `Sex: Male; Age: Aged 5 to 9 years; measures: Value` +
      `Sex: Male; Age: Aged 10 to 15 years; measures: Value`,
    working_age_males = 
      `Sex: Male; Age: Aged 16 to 19 years; measures: Value` + 
      `Sex: Male; Age: Aged 20 to 24 years; measures: Value` +
      `Sex: Male; Age: Aged 25 to 34 years; measures: Value` + 
      `Sex: Male; Age: Aged 35 to 49 years; measures: Value` +
      `Sex: Male; Age: Aged 50 to 64 years; measures: Value`,
    older_males = 
      `Sex: Male; Age: Aged 65 to 74 years; measures: Value`, + 
      `Sex: Male; Age: Aged 75 to 84 years; measures: Value` +
      `Sex: Male; Age: Aged 85 years and over; measures: Value` + 
      `Sex: Male; Age: Aged 90 years and over; measures: Value`,
  )  |>
  select(
    ltla21_code = `geography code`,
    total_population = `Sex: All persons; Age: Total; measures: Value`,
    total_females = `Sex: Female; Age: Total; measures: Value`,
    total_males = `Sex: Male; Age: Total; measures: Value`,
    younger_females, working_age_females, older_females, younger_males, working_age_males, older_males
  ) 


# ---- Save output to data/ folder ----
usethis::use_data(age_gender21_ltla21_ew, overwrite = TRUE)
