# Uvozimo funkcije za pobiranje in uvoz zemljevida.
source('lib/uvozi.zemljevid.r')
source('lib/libraries.r', encoding = 'UTF-8')


#========================================================================================================

# graf: prikaz BDP per capita glede na Slovenijo in leto

graf_bdp_slo <- ggplot((data = bruto_slovenija), aes(x=Leto, y=BDP)) + geom_point() + geom_line(group = 1)


#========================================================================================================

# Graf: Razmerje med otroci vkljucenimi v vrtec in ljudmi, ki zivijo v doloceni reg

graf_otroci_indeks <- ggplot((data = razmerje), aes(x=Leto, y=Indeks, col=Regija)) + geom_point() + geom_line() +
  scale_x_continuous('Leto', breaks = seq(2007, 2017, 1), limits = c(2007,2017))


#========================================================================================================
# Graf: Zemljevid

Slovenija <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1") %>% fortify()
colnames(Slovenija)[12] <- 'Regija'
Slovenija$Regija <- gsub('GoriĹˇka', 'Goriška', Slovenija$Regija)
Slovenija$Regija <- gsub('KoroĹˇka', 'Koroška', Slovenija$Regija)
Slovenija$Regija <- gsub('Notranjsko-kraĹˇka', 'Primorsko-notranjska', Slovenija$Regija)
Slovenija$Regija <- gsub('Obalno-kraĹˇka', 'Obalno-kraška', Slovenija$Regija)
Slovenija$Regija <- gsub('Spodnjeposavska', 'Posavska', Slovenija$Regija)



graf_slovenija <- ggplot(Slovenija, aes(x=long, y=lat, group=group, fill=Regija)) +
  geom_polygon() +
  labs(title="Slovenija") +
  theme_classic()
#========================================================================================================
#Tabele za zemljevide

diplomanti.2007 <- filter(diplomanti, Leto == '2007')
diplomanti.2011 <- filter(diplomanti, Leto == '2011')
diplomanti.2016 <- filter(diplomanti, Leto == '2016')


#========================================================================================================
#Zemljevidi diplomantov na 1000 ljudi


zemljevid.2007.diplomanti <- ggplot() +
  geom_polygon(data = right_join(diplomanti.2007,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill = Stevilo))+
  xlab("") + ylab("") + ggtitle('Diplomanti v letu 2007 na 1000 prebivalcev') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#25511C', high='#2BFF00', limits = c(6,17))
zemljevid.2007.diplomanti$labels$fill <- 'Diplomanti na 1000 prebivalcev'



zemljevid.2011.diplomanti <- ggplot() +
  geom_polygon(data = right_join(diplomanti.2011,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill = Stevilo))+
  xlab("") + ylab("") + ggtitle('Diplomanti v letu 2011 na 1000 prebivalcev') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#25511C', high='#2BFF00', limits = c(6,17))
zemljevid.2011.diplomanti$labels$fill <- 'Diplomanti na 1000 prebivalcev'



zemljevid.2016.diplomanti <- ggplot() +
  geom_polygon(data = right_join(diplomanti.2016,Slovenija, by = c('Regija')),
               aes(x = long, y = lat, group = group, fill = Stevilo))+
  xlab("") + ylab("") + ggtitle('Diplomanti v letu 2016 na 1000 prebivalcev') + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank()) + 
  scale_fill_gradient(low = '#25511C', high='#2BFF00', limits = c(6,17))
zemljevid.2016.diplomanti$labels$fill <- 'Diplomanti na 1000 prebivalcev'


#========================================================================================================
#plotly

graf_indeks <- ggplot(data = indeks, aes(x=Studenti, y=Diplomanti, color=Regija)) + geom_point(aes(frame=Leto, ids=Regija)) + scale_x_log10()
graf_indeks <- graf_indeks + xlab('Terciarno šolanje') + ylab('Diplomanti')
graf_indeks <- ggplotly(graf_indeks)


#========================================================================================================
#Cluster

osnovne_sole1 <- dcast(osnovne_sole, Regija ~ Leto)
dijaki1 <- dcast(dijaki, Regija ~ Leto)

sole <- left_join(osnovne_sole1, dijaki1, by=c('Regija'))

sole1 <- sole[,-1]
fit<-hclust(dist(scale(sole1)))
skupine <- cutree(fit, 4)

cluster <- mutate(sole, skupine)

zemljevid_cluster <- ggplot() +
  geom_polygon(data = right_join(cluster[c(-2:-23)], Slovenija, by=c('Regija')), aes(x=long, y=lat, group = group, fill=factor(skupine))) +
  geom_line() + 
  theme(axis.title=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(), panel.background = element_blank(), legend.position = 'None') +
  ggtitle('Osnovnošolci in dijaki med letoma 2007 in 2017') 





