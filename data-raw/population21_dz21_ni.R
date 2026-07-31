library(tidyverse)
library(devtools)
library(readxl)
library(httr2)

load_all(".")

query_url <-
  query_urls |>
  filter(str_detect(id, "estimates21_dz21_ni")) |>
  pull(query)

download <- tempfile(fileext = ".xlsx")

request(query_url) |>
  req_perform(download)

dz_pop <- read_excel(download, skip = 5,
                     sheet = "DZ")

population21_dz21_ni <- dz_pop |>
  transmute(dz21_code = `Geography Code`,
            n_people = `All usual residents`
        ) |>
  drop_na()

usethis::use_data(population21_dz21_ni, overwrite = TRUE)
