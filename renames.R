#!/usr/bin/Rscript

COU_DESC <- c(
  pbasicos = "Oferta de bienes y servicios a precios básicos",
  pcompr = "Utilización de bienes y servicios a precios comprador",
  comercio_transporte = "Márgenes de comercio y transporte",
  comercio = "Márgenes de comercio",
  trasnporte = "Márgenes de transporte",
  impuestos_Nsubsidios = "Impuestos netos de subsidios",
  impuestos = "Impuestos",
  subsidios = "Subsidios",
  utilizacion = "Utilización de bienes y servicios a precios básicos"
)

COU_TYPE <- c(
  eco_total = "Economía total",
  dom_importado = "Economía total / Origen doméstico e importado",
  domestico = "Economía total / Origen doméstico",
  importado = "Economía total / Origen importado"
)

COU_AGGREG <- c(
  rama = "Rama SCIAN",
  sector = "Sector SCIAN",
  subsector = "Subsector SCIAN"
)

COU_SCALE <- c(
  millones_p2018 = "Millones de pesos a precios de 2018"
)

MIP_DESC <- c(
  por_industria = "Matriz simétrica de insumo producto. Industria por industria",
  por_producto = "Matriz simétrica de insumo producto. Producto por producto"
)


MIP_TYPE <- c(
  domestico = "Economía total / Origen doméstico",
  coef_dir_indir = "Economía total / Origen doméstico coeficientes directos e indirectos",
  coef_tecnicos = "Economía total / Origen doméstico coeficientes técnicos",
  dom_importado = "Economía total / Origen doméstico e importado",
  importado = "Economía total / Origen importado"
)

MIP_SCALE <- c(millones_pbasicos = "Millones de pesos a precios básicos")

MIP_AGGREG <- c(
  clase = "Clase SCIAN",
  rama = "Rama SCIAN",
  sector = "Sector SCIAN",
  subsector = "Subsector SCIAN"
)
