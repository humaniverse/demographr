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
  filter(id == "migration21_msoa21") |>
  pull(query)

download <- tempfile(fileext = ".zip")

request(query_url) |>
  req_perform(download)

unzip(download, exdir = tempdir())

list.files(tempdir())

raw <- read_csv(file.path(tempdir(), "census2021-ts019-msoa.csv"))

# Clean data
migration21_msoa21 <-
  raw |>
  select(msoa21_code = `geography code`, 
         msoa21_name = geography, 
         all_usual_residents = `Migrant indicator: Total: All usual residents; measures: Value`, 
         address_one_year_ago_is_the_same = `Migrant indicator: Address one year ago is the same as the address of enumeration; measures: Value`, 
         address_one_year_ago_is_student_or_boarding = `Migrant indicator: Address one year ago is student term-time or boarding school address in the UK; measures: Value`, 
         migrant_from_within_uk = `Migrant indicator: Migrant from within the UK: Address one year ago was in the UK; measures: Value`, 
         migrant_from_outside_uk = `Migrant indicator: Migrant from outside the UK: Address one year ago was outside the UK; measures: Value`) |> 
mutate(prop_migrated_from_within_uk = migrant_from_within_uk / all_usual_residents,
       prop_migrated_from_outside_uk = migrant_from_outside_uk / all_usual_residents)

# ---- Save output to data/ folder ----
usethis::use_data(migration21_msoa21, overwrite = TRUE)
