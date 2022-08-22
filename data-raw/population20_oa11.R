# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(str_detect(id, "population20_oa11")) |>
  pull(query)

# Download and read population estimates for each region
oa_pop <- NULL

for (url in query_url) {
  GET(url, write_disk(tf <- tempfile(fileext = ".xlsx")))
  oa_pop_temp <- read_excel(tf, sheet = "Mid-2020 Persons", skip = 4) 
  oa_pop <- bind_rows(oa_pop,  oa_pop_temp)
}

oa_pop <-
  oa_pop %>%
  rename(
    oa11_code = OA11CD,
    lsoa11_code = LSOA11CD,
    total_population = `All Ages`
  )

population20_oa11 <- oa_pop

# Save output to data/ folder
usethis::use_data(population20_oa11, overwrite = TRUE)
