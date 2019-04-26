# Uvozimo funkcije za pobiranje in uvoz zemljevida.
source('lib/uvozi.zemljevid.r')


#========================================================================================================

# graf: prikaz BDP per capita glede na regijo in leto

graf_bruto_proizvod <- ggplot(data = bruto, mapping = aes(x=Regija, y=BDP, fill=Leto)) 
graf_bruto_proizvod <- graf_bruto_proizvod + geom_bar(stat = 'identity', position = 'dodge')
graf_bruto_proizvod <- graf_bruto_proizvod + theme(axis.text.x = element_text(colour = 'black', angle = 90, size = 8))
  


#========================================================================================================

# Graf: prikaz števila otrok vključenih v vrtec

graf_otroci_vrtci <- ggplot(data = vrtec, mapping = aes(x=Regija, y=Stevilo, Group = Leto, fill=Spol))
graf_otroci_vrtci <- graf_otroci_vrtci + geom_bar(stat = 'identity', position = 'dodge')
graf_otroci_vrtci <- graf_otroci_vrtci + theme(axis.text.x = element_text(colour = 'black', angle = 90, size = 8))



#========================================================================================================

# Graf: število študentov v terciarnih dejavnostih

graf_terciarno_solanje <- ggplot(data = terciarno_sum, mapping = aes(x=Regija, y=Stevilo, fill = Leto))
graf_terciarno_solanje <- graf_terciarno_solanje + geom_bar(stat = 'identity', position = 'dodge')
graf_terciarno_solanje <- graf_terciarno_solanje + theme(axis.text.x = element_text(colour = 'black', angle = 90, size = 8))



#========================================================================================================

# Graf: število diplomantov

graf_st_diplomantov <- ggplot(data = diplomanti, mapping = aes(x=Regija, y=Stevilo, fill=Leto))
graf_st_diplomantov <- graf_st_diplomantov + geom_bar(stat = 'identity', position = 'dodge')
graf_st_diplomantov <- graf_st_diplomantov + theme(axis.text.x = element_text(colour = 'black', angle = 90, size = 8))




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

bruto.2007 <- filter(bruto, Leto == '2007')
bruto.2010 <- filter(bruto, Leto == '2010')
bruto.2013 <- filter(bruto, Leto == '2013')
bruto.2017 <- filter(bruto, Leto == '2017')







#========================================================================================================
#BRUTO PROIZVOD 
zemljevid.bruto.2007 <- ggplot() +
  geom_polygon(data = right_join(bruto.2007,Slovenija, by = c("Regija")),
               aes(x = long, y = lat, group = group, fill = BDP)) + xlab("") + ylab("") + theme(axis.title=element_blank(), axis.text=element_blank(),
                axis.ticks=element_blank()) + ggtitle("BDP na prebivalca po regijah (2007)") + scale_fill_gradient(low = '#ffb3b3', high='#660000') 


zemljevid.bruto.2010 <- ggplot() +
  geom_polygon(data = right_join(bruto.2010,Slovenija, by = c("Regija")),
               aes(x = long, y = lat, group = group, fill = BDP)) + xlab("") + ylab("") + theme(axis.title=element_blank(), axis.text=element_blank(),
                axis.ticks=element_blank()) + ggtitle("BDP na prebivalca po regijah (2010)") + scale_fill_gradient(low = '#ffb3b3', high='#660000') 

zemljevid.bruto.2013 <- ggplot() +
  geom_polygon(data = right_join(bruto.2013,Slovenija, by = c("Regija")),
               aes(x = long, y = lat, group = group, fill = BDP)) + xlab("") + ylab("") + theme(axis.title=element_blank(), axis.text=element_blank(),
                axis.ticks=element_blank()) + ggtitle("BDP na prebivalca po regijah (2013)") + scale_fill_gradient(low = '#ffb3b3', high='#660000') 

zemljevid.bruto.2017 <- ggplot() +
  geom_polygon(data = right_join(bruto.2017,Slovenija, by = c("Regija")),
               aes(x = long, y = lat, group = group, fill = BDP)) + xlab("") + ylab("") + theme(axis.title=element_blank(), axis.text=element_blank(),
               axis.ticks=element_blank()) + ggtitle("BDP na prebivalca po regijah (2017)") + scale_fill_gradient(low = '#ffb3b3', high='#660000') 




#========================================================================================================
#OTROCI VKLJUČENI V VRTEC

zemljevid.vrtec <- ggplot() +
  geom_polygon(data = vrtec %>% right_join(Slovenija, by = c("Regija")),
               aes(x = long, y = lat, group = group, fill = Stevilo)) + theme(axis.title=element_blank(), axis.text=element_blank(),
                              axis.ticks=element_blank()) + ggtitle("Število otrok vključenih v vrtec") + scale_fill_gradient(low = '#ffb3b3', high='#660000')





