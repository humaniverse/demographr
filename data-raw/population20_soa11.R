# ---- Load ----
library(tidyverse)
library(devtools)
library(compositr)
library(readxl)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "estimates20_soa11") |>
  pull(query)

tf <- download_file(query_url, ".xlsx")

soa_pop <- read_excel(tf, sheet = "Flat")

population20_soa11 <- 
  soa_pop |> 
  filter(Year == max(Year)) |> 
  filter(Area == "Small Areas") |> 
  
  select(soa11_code = Area_Code, total_population = MYE)

# Save output to data/ folder
usethis::use_data(population20_soa11, overwrite = TRUE)
