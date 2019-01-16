library(readr)
library(dplyr)
library(tidyr)



#1. tabela
osnovne_sole <- read.csv2(file = 'podatki/osnovnesole.csv', skip = 3, na = c(' ','-'),
                          header = FALSE, encoding = 'Windows-1250', sep = ';', dec = '.',
                          col.names = c('Leto', 'brezveze', 'Regija', 'Spol', 'Stevilo'))

osnovne_sole <- osnovne_sole[,-2]
osnovne_sole <- osnovne_sole %>% fill(1:2) %>% filter(complete.cases(.))




#2. tabela
diplomanti <- read.csv2(file = 'podatki/diplomanti.csv', skip = 2, header = FALSE,
                        encoding = 'Windows-1250', sep = ';', dec = '.', na = c(' ','-'),
                        col.names = c('Leto', 'Regija', 'Meritev', 'Stevilo'))

diplomanti <- diplomanti %>% fill(1:2)%>% filter(complete.cases(.))
diplomanti <- diplomanti %>% filter(Meritev != 'Število diplomantk na 100 diplomantov (moški)')





#3. tabela
vrtec <- read.csv2(file = 'podatki/vrtec.csv', skip = 1, header = FALSE, 
                   encoding = 'Windows-1250', sep = ';', na = c(' ','-'),
                   col.names = c('Leto', 'Regija', 'Spol', 'Stevilo'))

vrtec <- vrtec %>% fill(1:2)%>% filter(complete.cases(.))
vrtec <- vrtec %>% filter(Spol != 'Spol - SKUPAJ')


grp <- group_by(vrtec, Leto, Regija)
vrtec_sum <- summarise(grp, Stevilo=sum(Stevilo))



#4. tabela
dijaki <- read.csv2(file = 'podatki/dijaki.csv', skip = 3, header = FALSE, 
                    encoding = 'Windows-1250', sep = ';', na = c(' ','-'),
                    col.names = c('Leto', 'Regija', 'krneki', 'Stevilo'))

dijaki <- dijaki[,-3]
dijaki <- dijaki %>% fill(1:2)%>% filter(complete.cases(.))



#5. tabela
terciarno <- read.csv2(file = 'podatki/terciarno.csv', skip = 2, header = FALSE,
                       encoding = 'Windows-1250', sep = ';', na = c(' ','-'),
                       col.names = c('Leto', 'Regija', 'Vrsta', 'Spol', 'Stevilo'))

terciarno <- terciarno %>% fill(1:3)%>% filter(complete.cases(.))

grp <- group_by(terciarno, Leto, Regija)
terciarno_sum <- summarise(grp, Stevilo=sum(Stevilo))

#6. tabela
bruto <- read.csv2(file = 'podatki/bruto_proizvod.csv', skip = 0, header = FALSE,
                   encoding = 'Windows-1250', sep = ';', na = c(' ','-'),
                   col.names = c('Leto', 'Regija', 'Krneki', 'BDP'))


bruto <- bruto %>% fill(1:2)%>% filter(complete.cases(.))
bruto <- bruto[,-3]


#shranjene tabele (tidy data):


write.csv(bruto, file = 'podatki/tidy_data/tidy_bruto.csv')
write.csv(dijaki, file = 'podatki/tidy_data/tidy_dijaki.csv')
write.csv(diplomanti, file = 'podatki/tidy_data/tidy_diplomanti.csv')
write.csv(osnovne_sole, file = 'podatki/tidy_data/tidy_osnovne_sole.csv')
write.csv(terciarno, file = 'podatki/tidy_data/tidy_terciarno.csv')
write.csv(vrtec, file = 'podatki/tidy_data/tidy_vrtec.csv')










