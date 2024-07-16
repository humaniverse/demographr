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
  filter(id == "sexualorientation21_lgd21_ni") |>
  pull(query)

raw <- import(query_url, which = "MS-C01")
colnames(raw) <- raw[7,]

# ---- Clean data ----
sexualorientation21_lgd21_ni <- raw |>
  slice(9:19) |>
  pivot_longer(cols = (4:9), names_to = "sexual_orientation", values_to = "count") |>
  mutate(prop = as.integer(count)/as.integer(`All usual residents aged 16 and over`)) |>
  select(lgd21_code = `Geography code`,
         sexual_orientation,
         count,
         prop) 

# ---- Save output to data/ folder ----
usethis::use_data(sexualorientation21_lgd21_ni, overwrite = TRUE)
