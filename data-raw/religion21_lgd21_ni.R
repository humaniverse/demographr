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
  filter(id == "religion21_lgd21_ni") |>
  pull(query)

raw <- import(query_url, which = "LGD")
colnames(raw) <- raw[8,]

# ---- Clean data ----
religion21_lgd21_ni <- raw |>
  slice(9:19) |>
  pivot_longer(cols = (4:11), names_to = "religion", values_to = "count") |>
  mutate(prop = as.integer(count)/as.integer(`All usual residents`)) |>
  select(lgd21_code = `Geography code`,
         religion,
         count,
         prop) |>
  mutate(religion = str_replace(religion, "Catholic \\r\\n\\[note 2\\]", "Catholic"))

# ---- Save output to data/ folder ----
usethis::use_data(religion21_lgd21_ni, overwrite = TRUE)
