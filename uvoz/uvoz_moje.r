source('lib/libraries.r', encoding = 'UTF-8')

#=======================================================================================================

#1. tabela
osnovne_sole <- read.csv2(file = 'podatki/osnovnesole.csv', skip = 3, na = c(' ','-'),
                          header = FALSE, fileEncoding = 'Windows-1250', sep = ';', dec = '.',
                          col.names = c('Leto', 'brezveze', 'Regija', 'Spol', 'Stevilo'))

osnovne_sole <- osnovne_sole[,-2]
osnovne_sole <- osnovne_sole %>% fill(1:2) %>% filter(complete.cases(.))
osnovne_sole <- osnovne_sole %>% filter(Spol != 'Dečki')
osnovne_sole <- osnovne_sole %>% filter(Spol != 'Deklice')
osnovne_sole <- osnovne_sole %>% filter(Regija != 'SLOVENIJA')
osnovne_sole <- osnovne_sole[,-3]




#========================================================================================================

#2. tabela
diplomanti <- read_delim('podatki/diplomanti.csv', ';', skip=3, na=c(' ', '-'),
                         
                         locale=locale(encoding='Windows-1250', decimal_mark='.'),
                         
                         col_names=c('Leto', 'Regija', 'Meritev', 'Stevilo'))
diplomanti <- diplomanti %>% fill(1:2)%>% filter(complete.cases(.))
diplomanti <- diplomanti %>% filter(Meritev != 'Število diplomantk na 100 diplomantov (moški)')
diplomanti <- diplomanti %>% filter(Regija != 'SLOVENIJA')
diplomanti <- diplomanti[,-3]

diplomanti$Leto <- as.integer(diplomanti$Leto)

#========================================================================================================

#3. tabela
vrtec <- read.csv2(file = 'podatki/vrtec.csv', skip = 1, header = FALSE, 
                   fileEncoding = 'Windows-1250', sep = ';', na = c(' ','-'),
                   col.names = c('Leto', 'Regija', 'Spol', 'Stevilo'))

vrtec <- vrtec %>% fill(1:2)%>% filter(complete.cases(.))
vrtec <- vrtec %>% filter(Spol != 'Spol - SKUPAJ')
vrtec <- vrtec %>% filter(Regija!= 'SLOVENIJA')


grp1 <- group_by(vrtec, Leto, Regija)
vrtec_sum <- summarise(grp1, Stevilo=sum(Stevilo))

vrtec_sum$Leto <- gsub('2007/08', '2007', vrtec_sum$Leto)
vrtec_sum$Leto <- gsub('2008/09', '2008', vrtec_sum$Leto)
vrtec_sum$Leto <- gsub('2009/10', '2009', vrtec_sum$Leto)
vrtec_sum$Leto <- gsub('2010/11', '2010', vrtec_sum$Leto)
vrtec_sum$Leto <- gsub('2011/12', '2011', vrtec_sum$Leto)
vrtec_sum$Leto <- gsub('2012/13', '2012', vrtec_sum$Leto)
vrtec_sum$Leto <- gsub('2013/14', '2013', vrtec_sum$Leto)
vrtec_sum$Leto <- gsub('2014/15', '2014', vrtec_sum$Leto)
vrtec_sum$Leto <- gsub('2015/16', '2015', vrtec_sum$Leto)
vrtec_sum$Leto <- gsub('2016/17', '2016', vrtec_sum$Leto)
vrtec_sum$Leto <- gsub('2017/18', '2017', vrtec_sum$Leto)

vrtec_sum$Leto <- as.integer(vrtec_sum$Leto)

#========================================================================================================

#4. tabela
dijaki <- read.csv2(file = 'podatki/dijaki.csv', skip = 3, header = FALSE, 
                    fileEncoding = 'Windows-1250', sep = ';', na = c(' ','-'),
                    col.names = c('Leto', 'Regija', 'krneki', 'Stevilo'))

dijaki <- dijaki[,-3]
dijaki <- dijaki %>% fill(1:2)%>% filter(complete.cases(.))
dijaki <- dijaki %>% filter(Regija != 'stalno bivališče neznano ali v tujini')
dijaki <- dijaki %>% filter(Regija != 'SLOVENIJA')


#========================================================================================================

#5. tabela
terciarno <- read.csv2(file = 'podatki/terciarno.csv', skip = 2, header = FALSE,
                       fileEncoding = 'Windows-1250', sep = ';', na = c(' ','-'),
                       col.names = c('Leto', 'Regija', 'Vrsta', 'Spol', 'Stevilo'))

terciarno <- terciarno %>% fill(1:3)%>% filter(complete.cases(.))

grp2 <- group_by(terciarno, Leto, Regija)

terciarno_sum <- summarise(grp2, Stevilo=sum(Stevilo))
terciarno_sum <- terciarno_sum %>% filter(Regija !='SLOVENIJA')
terciarno_sum <- terciarno_sum %>% filter(Regija !='stalno bivališče neznano ali v tujini')


terciarno_sum$Leto <- gsub('2007/08', '2007', terciarno_sum$Leto)
terciarno_sum$Leto <- gsub('2008/09', '2008', terciarno_sum$Leto)
terciarno_sum$Leto <- gsub('2009/10', '2009', terciarno_sum$Leto)
terciarno_sum$Leto <- gsub('2010/11', '2010', terciarno_sum$Leto)
terciarno_sum$Leto <- gsub('2011/12', '2011', terciarno_sum$Leto)
terciarno_sum$Leto <- gsub('2012/13', '2012', terciarno_sum$Leto)
terciarno_sum$Leto <- gsub('2013/14', '2013', terciarno_sum$Leto)
terciarno_sum$Leto <- gsub('2014/15', '2014', terciarno_sum$Leto)
terciarno_sum$Leto <- gsub('2015/16', '2015', terciarno_sum$Leto)
terciarno_sum$Leto <- gsub('2016/17', '2016', terciarno_sum$Leto)
terciarno_sum$Leto <- gsub('2017/18', '2017', terciarno_sum$Leto)

terciarno_sum$Leto <- as.integer(terciarno_sum$Leto)
#========================================================================================================

#6. tabela
bruto <- read.csv2(file = 'podatki/bruto_proizvod.csv', skip = 0, header = FALSE,
                   fileEncoding = 'Windows-1250', sep = ';', na = c(' ','-'),
                   col.names = c('Leto', 'Regija', 'Krneki', 'BDP'))


bruto <- bruto %>% fill(1:2)%>% filter(complete.cases(.))

bruto_slovenija <- bruto %>% filter(Regija== 'SLOVENIJA')
bruto_slovenija <- bruto_slovenija[,-3]
bruto_slovenija <- bruto_slovenija[,-2]


bruto_slovenija1 <- bruto_slovenija
bruto_slovenija1$BDP <- as.factor(bruto_slovenija$BDP)



bruto <- bruto %>% filter(Regija!= 'SLOVENIJA')
bruto <- bruto[,-3]

#========================================================================================================


#7. tabela

prebivalstvo <- read.csv(file = 'podatki/prebivalci.csv', skip = 3, header = FALSE,
                          fileEncoding = 'Windows-1250', sep = ';', na = c(' ','-'), nrows = 170,
                          col.names = c('Regija', 'Leto', 'Stevilo'))


prebivalstvo <- prebivalstvo %>% fill(1)%>% filter(complete.cases(.))%>% filter(Regija != 'SLOVENIJA')
prebivalstvo <- prebivalstvo %>% filter(Leto != '2018')
prebivalstvo$Stevilo <- as.numeric(paste(prebivalstvo$Stevilo))

#========================================================================================================


#shranjene tabele (skoraj tidy data):

write.csv(prebivalstvo, file = 'podatki/tidy_data/tidy_prebivalstvo.csv', fileEncoding = 'UTF-8')
write.csv(bruto, file = 'podatki/tidy_data/tidy_bruto.csv', fileEncoding = 'UTF-8')
write.csv(dijaki, file = 'podatki/tidy_data/tidy_dijaki.csv', fileEncoding = 'UTF-8')
write.csv(diplomanti, file = 'podatki/tidy_data/tidy_diplomanti.csv', fileEncoding = 'UTF-8')
write.csv(osnovne_sole, file = 'podatki/tidy_data/tidy_osnovne_sole.csv', fileEncoding = 'UTF-8')
write.csv(terciarno, file = 'podatki/tidy_data/tidy_terciarno.csv', fileEncoding = 'UTF-8')
write.csv(vrtec, file = 'podatki/tidy_data/tidy_vrtec.csv', fileEncoding = 'UTF-8')


#========================================================================================================
#Razmerje med otroci vkljucenimi v vrtec in ljudmi, ki zivijo v doloceni regiji

razmerje <- left_join(prebivalstvo, vrtec_sum, by=c('Regija','Leto'))
colnames(razmerje) <- c('Regija', 'Leto', 'Prebivalstvo', 'Otroci')
razmerje <- transform(razmerje, Indeks=(Otroci/Prebivalstvo)*100)

#========================================================================================================
#Razmerje med ljudmi vključenimi v terciarno šolanje in diplomanti na 1000 prebivalcev

indeks <- left_join(diplomanti, terciarno_sum, by=c('Regija','Leto'))
colnames(indeks) <- c('Leto', 'Regija', 'Diplomanti', 'Studenti')
indeks <- transform(indeks, Indeks=(Studenti/Diplomanti))








