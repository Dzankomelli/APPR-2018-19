library(readr)
library(dplyr)
library(tidyr)


#1. tabela
osnovne_sole <- read.csv2(file = 'podatki/osnovnesole.csv', skip = 3,
                          header = FALSE, encoding = 'Windows-1250', sep = ';', dec = '.',
                          col.names = c('Leto', 'brezveze', 'Regija', 'Spol', 'Vrednost'))

osnovne_sole <- osnovne_sole[,-2]

#2. tabela
brezposelni <- read.csv2(file = 'podatki/brezposelni.csv', skip = 2, header = FALSE,
                         encoding = 'Windows-1250', sep = ';', dec = '.',
                         col.names = c('Leto', 'Regija', 'Aktivnost', 'Vrednost'))

#3. tabela
diplomanti <- read.csv2(file = 'podatki/diplomanti.csv', skip = 2, header = FALSE,
                        encoding = 'Windows-1250', sep = ';', dec = '.',
                        col.names = c('Leto', 'Regija', 'Meritev', 'Vrednost'))

#4. tabela
vrtec <- read.csv2(file = 'podatki/vrtec.csv', skip = 1, header = FALSE, 
                   encoding = 'Windows-1250', sep = ';',
                   col.names = c('Leto', 'Regija', 'Spol', 'Vrednost'))

#5. tabela
dijaki <- read.csv2(file = 'podatki/dijaki.csv', skip = 2, header = FALSE, 
                    encoding = 'Windows-1250', sep = ';',
                    col.names = c('Leto', 'Regija', 'krneki', 'Vrednost'))

dijaki <- dijaki[,-3]

#6. tabela
terciarno <- read.csv2(file = 'podatki/terciarno.csv', skip = 2, header = FALSE,
                       encoding = 'Windows-1250', sep = ';',
                       col.names = c('Leto', 'Regija', 'Vrsta', 'Spol', 'Vrednost'))

#7. tabela
stipendisti <- read.csv(file = 'podatki/stipendisti.csv', skip = 2, header = TRUE,
                        encoding = 'Windows-1250', sep = ';')
