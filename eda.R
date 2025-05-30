#!/usr/bin/Rscript

library(tidyverse)
library(readxl)
library(glue)
source("renames.R")

# TODO: cofecientes

# MIP: matriz de insumo producto
# COU: cuadros de oferta y utilizacion

SKIP <- 5
COLS <- c("path", "desc", "type", "aggreg", "scale")
DATA <- "data/excels"

COU <- read_tsv("data/COU.tsv", col_names = COLS, col_types = "cffff")
MIP <- read_tsv("data/MIP.tsv", col_names = COLS, col_types = "cffff")

# Fix names
MIP <- MIP |>
  mutate(
    desc = fct_recode(desc, !!!MIP_DESC),
    type = fct_recode(type, !!!MIP_TYPE),
    aggreg = fct_recode(aggreg, !!!MIP_AGGREG),
    scale = fct_recode(scale, !!!MIP_SCALE)
  )

COU <- COU |>
  mutate(
    desc = fct_recode(desc, !!!COU_DESC),
    type = fct_recode(type, !!!COU_TYPE),
    aggreg = fct_recode(aggreg, !!!COU_AGGREG),
    scale = fct_recode(scale, !!!COU_SCALE)
  )

view(MIP)
view(COU)


to_read_MIP <- MIP |>
  filter(aggreg == "subsector") |>
  filter(desc == "por_industria") |>
  filter(type == "dom_importado") |>
  pull(path)

to_read_COU <- COU |>
  filter(aggreg == "sector") |>
  filter(desc == "pbasicos") |>
  filter(type == "eco_total") |>
  pull(path)

# Read Matrices
to_read_MIP <- glue("{DATA}/{to_read_MIP}")
to_read_COU <- glue("{DATA}/{to_read_COU}")

# Data
mip <- read_xlsx(to_read_MIP, skip = SKIP)
cou <- read_xlsx(to_read_COU, skip = SKIP)

view(mip)
# remove NAs rows
mip <- mip %>%
  rowwise() %>%
  filter(!all(is.na(across(-...1)))) %>%
  ungroup()

cou <- cou %>%
  rowwise() %>%
  filter(!all(is.na(across(-...1)))) %>%
  ungroup()
view(cou)
dim(mip)
dim(cou)
