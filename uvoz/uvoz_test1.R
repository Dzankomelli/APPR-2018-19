library(readr)
library(dplyr)
library(tidyr)


#1. tabela
osnovne_sole <- read.csv2(file = 'podatki/osnovnesole.csv', skip = 3,
                          header = FALSE, encoding = 'Windows-1250', sep = ';', dec = '.',
                          col.names = c('Leto', 'brezveze', 'Regija', 'Spol', 'Vrednost'))

osnovne_sole <- osnovne_sole[,-2]