# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# ---- England and Wales ----
# Set query url
query_url <-
  query_urls |>
  filter(id == "census21_england_wales") |>
  pull(query)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

raw_eng_wal <- read_excel(tf, sheet = "P01", skip = 6)

population_england_wales <- 
  raw_eng_wal |> 
  filter(`Area name` %in% c("England", "Wales")) |> 
  select(country_name = `Area name`, country_code = `Area code [note 2]`, population = `All persons`)

# ---- Northern Ireland ----
# Set query url
query_url <-
  query_urls |>
  filter(id == "census21_northern_ireland") |>
  pull(query)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

raw_ni <- read_excel(tf, sheet = "Flat_file", skip = 5)

population_ni <- 
  raw_ni |> 
  filter(Sex == "All persons") |> 
  group_by(Geography, `Geography Code`) |> 
  summarise(population = sum(Value)) |> 
  ungroup() |> 
  select(country_name = Geography, country_code = `Geography Code`, population)

# ---- Scotland ----
pop_scot <- 
  population20_dz11 |> 
  filter(sex == "All") |> 
  summarise(population = sum(total_population)) |> 
  pull(population)

population_scotland <- 
  tribble(
    ~country_name, ~country_code, ~population,
    "Scotland", "S92000003", pop_scot
  )

# ---- Combine and save ----
population21_country21 <- 
  bind_rows(
    population_england_wales,
    population_scotland,
    population_ni
  )

# Save output to data/ folder
usethis::use_data(population21_country21, overwrite = TRUE)
