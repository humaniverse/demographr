library(tidyverse)
library(devtools)
library(readxl)
library(httr2)

load_all(".")

query_url <-
  query_urls |>
  filter(str_detect(id, "estimates22_oa22_s")) |>
  pull(query)

download <- tempfile(fileext = ".csv")

request(query_url) |>
  req_perform(download)

oa_pop <- read_csv(download)

population22_oa22_s <- oa_pop |>
  rename(oa22_code = 1,
         n_people = 2) |>
  drop_na()

usethis::use_data(population22_oa22_s, overwrite = TRUE)