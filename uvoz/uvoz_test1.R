library(readr)
library(dplyr)
library(tidyr)


#1. tabela
osnovne_sole <- read.csv2(file = 'podatki/osnovnesole.csv', skip = 3, na = c(' ','-'),
                          header = FALSE, encoding = 'Windows-1250', sep = ';', dec = '.',
                          col.names = c('Leto', 'brezveze', 'Regija', 'Spol', 'Vrednost'))

osnovne_sole <- osnovne_sole[,-2]
osnovne_sole <- osnovne_sole %>% fill(1:2)%>% filter(complete.cases(.))





#2. tabela
brezposelni <- read.csv2(file = 'podatki/brezposelni.csv', skip = 2, header = FALSE,
                         encoding = 'Windows-1250', sep = ';', dec = '.', na = c(' ','-'),
                         col.names = c('Leto', 'Regija', 'Aktivnost', 'Vrednost'))

brezposelni <- brezposelni %>% fill(1:2)%>% filter(complete.cases(.))





#3. tabela
diplomanti <- read.csv2(file = 'podatki/diplomanti.csv', skip = 2, header = FALSE,
                        encoding = 'Windows-1250', sep = ';', dec = '.', na = c(' ','-'),
                        col.names = c('Leto', 'Regija', 'Meritev', 'Vrednost'))

diplomanti <- diplomanti %>% fill(1:2)%>% filter(complete.cases(.))





#4. tabela
vrtec <- read.csv2(file = 'podatki/vrtec.csv', skip = 1, header = FALSE, 
                   encoding = 'Windows-1250', sep = ';', na = c(' ','-'),
                   col.names = c('Leto', 'Regija', 'Spol', 'Vrednost'))

vrtec <- vrtec %>% fill(1:2)%>% filter(complete.cases(.))



#5. tabela
dijaki <- read.csv2(file = 'podatki/dijaki.csv', skip = 3, header = FALSE, 
                    encoding = 'Windows-1250', sep = ';', na = c(' ','-'),
                    col.names = c('Leto', 'Regija', 'krneki', 'Stevilo dijakov'))

dijaki <- dijaki[,-3]
dijaki <- dijaki %>% fill(1:2)%>% filter(complete.cases(.))



#6. tabela
terciarno <- read.csv2(file = 'podatki/terciarno.csv', skip = 2, header = FALSE,
                       encoding = 'Windows-1250', sep = ';', na = c(' ','-'),
                       col.names = c('Leto', 'Regija', 'Vrsta', 'Spol', 'Vrednost'))

terciarno <- terciarno %>% fill(1:3)%>% filter(complete.cases(.))



#7. tabela.... tukaj imam tezave
stipendisti <- read.csv(file = 'podatki/stipendisti.csv', skip = 2, na = c(' ','-'),
                        header = FALSE, encoding = 'Windows-1250', sep = ';')

stipendisti <- stipendisti %>% fill(1:2)%>% filter(complete.cases(.))
