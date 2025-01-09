# ---- Load ----
library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "estimates21_scot") |>
  pull(query)

scot_pop <- read_csv(query_url, skip = 8)

scot_pop <- 
  scot_pop |> 
  mutate(area_code = str_remove(`http://purl.org/linked-data/sdmx/2009/dimension#refArea`, "http://statistics.gov.scot/id/statistical-geography/")) |> 
  select(area_code, area_name = `Reference Area`, total_population = Count)

# ---- Data zones ----
population21_dz11 <- 
  scot_pop |> 
  filter(str_detect(area_code, "^S01")) |> 
  rename(dz11_code = area_code, dz11_name = area_name)

# ---- Intermediate zones ----
population21_iz11 <- 
  scot_pop |> 
  filter(str_detect(area_code, "^S02")) |> 
  rename(iz11_code = area_code, iz11_name = area_name)

# ---- Council Areas ----
population21_ltla21 <- 
  scot_pop |> 
  filter(str_detect(area_code, "^S12")) |> 
  rename(ltla21_code = area_code, ltla21_name = area_name)

# ---- Save outputs to data/ folder ----
usethis::use_data(population21_dz11, overwrite = TRUE)
usethis::use_data(population21_iz11, overwrite = TRUE)
usethis::use_data(population21_ltla21, overwrite = TRUE)
