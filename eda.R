#!/usr/bin/Rscript

library(tidyverse)
library(readxl)

# MIP: matriz de insumo producto
# COU: cuadros de oferta y utilizacion

COLS <- c("path", "desc", "type", "aggreg", "scale")

COUs <- read_tsv("data/COU.tsv", col_names = COLS, col_types = "cffff")
MIPs <- read_tsv("data/MIP.tsv", col_names = COLS, )

MIPs_DESC <- c(pbasicos = "Oferta de bienes y servicios a precios básicos",   
              pcompr = "Utilización de bienes y servicios a precios comprador",
                  comercio_transporte = "Márgenes de comercio y transporte",  
                  comercio = "Márgenes de comercio",                          
                  trasnporte = "Márgenes de transporte",                      
                  impuestos_Nsubsidios = "Impuestos netos de subsidios",
                  impuestos = "Impuestos",                        
                  subsidios = "Subsidios",                                    
                  utilizacion = "Utilización de bienes y servicios a precios básicos") 

COUs <- COUs |>
  mutate(desc = fct_recode(desc, !!!MIPs_DESC))
# COUs
# 
# oneH <- read_xlsx("data/COU/excels/COU_100.xlsx",
#                   col_names = F, skip = 6)
# oneH <- read_xlsx("data/COU/excels/COU_100.xlsx", skip = 5)
