# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)
library(janitor)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "estimates22_ltla19_scot") |>
  pull(query)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

pop <-
  read_excel(
    tf,
    sheet = "Table 1"  
    )

population22_ltla19_scotland <- pop |>
  row_to_names(row_number = 3) |>
  filter(`Area type` == "Council area") |>
  filter(Sex == "Persons") |>
  rename(
    ltla19_name = `Area name`,
    ltla19_code = `Area code`,
    sex = Sex,
    all_ages = `All ages`
  ) |>
  select(!`Area type`)

# Save output to data/ folder
usethis::use_data(population22_ltla19_scotland, overwrite = TRUE)
