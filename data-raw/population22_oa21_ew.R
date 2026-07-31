library(tidyverse)
library(devtools)
library(readxl)
library(httr2)

load_all(".")

query_url <-
  query_urls |>
  filter(str_detect(id, "estimates22_oa21_ew")) |>
  pull(query)

download <- tempfile(fileext = ".xlsx")

request(query_url) |>
  req_perform(download)

oa_pop <- read_excel(
  path = download,
  sheet = 5,
  range = cell_limits(
    ul = c(4, 3),       # row 4, column C
    lr = c(188884, 4)   # row 188,884, column D
  ),
  col_types = c("text", "numeric"),
  progress = TRUE
)

population22_oa21_ew <- oa_pop |>
  rename(oa21_code = `OA 2021 Code`,
         n_people = Total) |>
  drop_na()

usethis::use_data(population22_oa21_ew, overwrite = TRUE)
