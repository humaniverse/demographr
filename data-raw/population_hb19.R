# ---- Load ----
library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "estimates_hb19") |>
  pull(query)

estimates_hb19 <- read_csv(query_url)

population_hb19 <- 
  estimates_hb19 |> 
  filter(Sex == "All") |> 
  
  # Don't include Scotland totals
  filter(HB != "S92000003") |> 
  
  select(
    hb19_code = HB,
    year = Year,
    total_population = AllAges
  )

# Save output to data/ folder
usethis::use_data(population_hb19, overwrite = TRUE)
