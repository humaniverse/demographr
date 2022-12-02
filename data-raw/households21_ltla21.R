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
  filter(id == "households_england_wales") |>
  pull(query)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

raw_eng_wal <- read_excel(tf, sheet = "H01", skip = 6)

households_england_wales <- 
  raw_eng_wal |> 
  # Keep only Local Authority Districts - codes start with E06, E07, E08, E09, and W06
  filter(str_detect(`Area code [note 2]`, "^E0|^W0")) |> 
  select(ltla21_name = `Area name`, ltla21_code = `Area code [note 2]`, households = `Number of households with at least one usual resident`)

# Rename
households21_ltla21 <- households_england_wales

# Save output to data/ folder
usethis::use_data(households21_ltla21, overwrite = TRUE)
