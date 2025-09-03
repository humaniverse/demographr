# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "estimates21_ni") |>
  pull(query)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

# ---- Super data zones ----
population21_sdz21 <- read_excel(tf,
  sheet = "SDZ",
  skip = 5
) |>
  select(
    sdz21_code = `Geography Code`,
    sdz21_name = Geography,
    residents = `All usual residents`
  )

# ---- District Electoral Area ----
population21_dea14 <- read_excel(tf,
  sheet = "DEA",
  skip = 5
) |>
  select(
    dea14_code = `Geography Code`,
    dea14_name = Geography,
    residents = `All usual residents`
  )

# ---- Local Government District ----
population21_lgd14 <- read_excel(tf,
  sheet = "LGD",
  skip = 5
) |>
  select(
    lgd14_code = `Geography code`,
    lgd14_name = Geography,
    residents = `All usual residents`
  )

# ---- Save outputs to data/ folder ----
usethis::use_data(population21_sdz21, overwrite = TRUE)
usethis::use_data(population21_dea14, overwrite = TRUE)
usethis::use_data(population21_lgd14, overwrite = TRUE)
