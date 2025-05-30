#!/usr/bin/Rscript

library(tidyverse)
library(readxl)
library(glue)

MULTIEST <- "mip_ixi_me_d_2018.xlsx"

x <- read_xlsx(MULTIEST, skip = 5)

headersTB <- read_xlsx(MULTIEST, skip = 4, n_max = 2, col_names = F)

headers <- str_c(as.character(headersTB[1, ]), ":::", as.character(headersTB[2, ]))
headers[1] <- "estado"
headers[2] <- "actividad"
headers[1283] <- "drop_me_please"
headers[1284] <- "total"

names(x) <- headers
mip_sin <- x |>
  filter(estado == "Sinaloa") |>
  select(starts_with("Sinaloa:::"))

# write_tsv(mip_sin, "mip_sin.tsv")
