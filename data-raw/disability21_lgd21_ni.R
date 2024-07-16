# ---- Load libs ----
library(tidyverse)
library(geographr)
library(devtools)
library(rio)

# ---- Load internal sysdata.rda file with URLs ----
load_all(".")

# ---- Download data ----
query_url <-
  query_urls |>
  filter(id == "disability21_lgd21_ni") |>
  pull(query)

raw <- import(query_url, which = "LGD")
colnames(raw) <- raw[8,]

# ---- Clean data ----
disability21_lgd21_ni <- raw |>
  slice(9:19) |>
  pivot_longer(cols = (4:6), names_to = "disability", values_to = "count") |>
  mutate(prop = as.integer(count)/as.integer(`All households`)) |>
  select(lgd21_code = `Geography code`,
         disability,
         count,
         prop) 

# ---- Save output to data/ folder ----
usethis::use_data(disability21_lgd21_ni, overwrite = TRUE)
