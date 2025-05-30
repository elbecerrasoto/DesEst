#!/usr/bin/Rscript

library(tidyverse)
library(leontief)

mip <- read_tsv("mip_sin.tsv")
A <- mip[-36:-40]

L <- leontief_inverse(A)
out <- output_multiplier(L)
multipliers <- tibble(sector = names(A), multipliers = as.numeric(out))

write_tsv(multipliers, "multipliers_sin.tsv")
