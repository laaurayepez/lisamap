rm(list = ls())
# setwd("ruta_a_tu_directorio_de_trabajo")

gpklink = "all_lima_lisa_maps_itento2.gpkg"

library(sf)
library(ggplot2)

# 1. Definir la paleta de colores exacta de la clasificación LISA
lisa_colors <- c(
  "1 hotOutlier"  = "#7A3E1D",  # Marrón
  "2 hotSpot"     = "#E6963B",  # Naranja
  "3 no_pattern"  = "#D3D3D3",  # Gris claro / Blanco
  "4 coldSpot"    = "#968EB9",  # Lila
  "5 coldOutlier" = "#230042"   # Morado oscuro
)

# ---------------------------------------------------------
# Mapa 1: LISA Original (Pesos por perímetro)
# ---------------------------------------------------------
map1 <- read_sf(gpklink, layer = "HS_lisa")

map1gg <- ggplot() + 
  theme_void() + 
  geom_sf(data = map1, aes(fill = as.factor(HS_lisa)), color = "black", size = 0.001) +
  scale_fill_manual(values = lisa_colors, name = "Clasificación LISA") +
  ggtitle("Análisis LISA - Pesos por Perimetro") +
  theme(legend.position = "bottom")

map1gg # Muestra el mapa en RStudio para verificar
saveRDS(map1gg, file = 'map1.rds')

# ---------------------------------------------------------
# Mapa 2: LISA Contigüidad Rook
# ---------------------------------------------------------
map2 <- read_sf(gpklink, layer = "HS_lisa_rook")

map2gg <- ggplot() + 
  theme_void() + 
  geom_sf(data = map2, aes(fill = as.factor(HS_lisa_rook)), color = "black", size = 0.001) +
  scale_fill_manual(values = lisa_colors, name = "Clasificación LISA") +
  ggtitle("Análisis LISA - Contigüidad Rook") +
  theme(legend.position = "bottom")

map2gg
saveRDS(map2gg, file = 'map2.rds')

# ---------------------------------------------------------
# Mapa 3: LISA Contigüidad Queen
# ---------------------------------------------------------
map3 <- read_sf(gpklink, layer = "HS_lisa_queen")

map3gg <- ggplot() + 
  theme_void() + 
  geom_sf(data = map3, aes(fill = as.factor(HS_lisa_queen)), color = "black", size = 0.001) +
  scale_fill_manual(values = lisa_colors, name = "Clasificación LISA") +
  ggtitle("Análisis LISA - Contigüidad Queen") +
  theme(legend.position = "bottom")

map3gg
saveRDS(map3gg, file = 'map3.rds')

# ---------------------------------------------------------
# Mapa 4: LISA K-Nearest Neighbors (K=3)
# ---------------------------------------------------------
map4 <- read_sf(gpklink, layer = "HS_lisa_knn")

map4gg <- ggplot() + 
  theme_void() + 
  geom_sf(data = map4, aes(fill = as.factor(HS_lisa_knn)), color = "black", size = 0.001) +
  scale_fill_manual(values = lisa_colors, name = "Clasificación LISA") +
  ggtitle("Análisis LISA - KNN (k=3)") +
  theme(legend.position = "bottom")

map4gg
saveRDS(map4gg, file = 'map4.rds')

