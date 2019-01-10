# Uvozimo funkcije za pobiranje in uvoz zemljevida.
source('lib/uvozi.zemljevid.r')



# graf: prikaz BDP per capita glede na regijo in leto

graf_bruto_proizvod <- ggplot(data = bruto, mapping = aes(x=Regija, y=BDP, fill=Leto)) 
graf_bruto_proizvod <- graf_bruto_proizvod + geom_bar(stat = 'identity', position = 'dodge')
graf_bruto_proizvod <- graf_bruto_proizvod + theme(axis.text.x = element_text(colour = 'black', angle = 90, size = 8))
  

# Graf: prikaz števila otrok v vrtcih

graf_otroci_vrtci <- ggplot(data = vrtec, mapping = aes(x=Regija, y=Stevilo, Group = Leto, fill=Spol))
graf_otroci_vrtci <- graf_otroci_vrtci + geom_bar(stat = 'identity', position = 'dodge')
graf_otroci_vrtci <- graf_otroci_vrtci + theme(axis.text.x = element_text(colour = 'black', angle = 90, size = 8))


# Graf: stevilo Studentov v terciarnih dejavnostih

graf_terciarno_solanje <- ggplot(data = terciarno_sum, mapping = aes(x=Regija, y=Stevilo, fill=Leto))
graf_terciarno_solanje <- graf_terciarno_solanje + geom_bar(stat = 'identity', position = 'dodge')
graf_terciarno_solanje <- graf_terciarno_solanje + theme(axis.text.x = element_text(colour = 'black', angle = 90, size = 8))


# Graf: tevilo diplomantov

graf_st_diplomantov <- ggplot(data = diplomanti, mapping = aes(x=Regija, y=Stevilo, fill=Leto))
graf_st_diplomantov <- graf_st_diplomantov + geom_bar(stat = 'identity', position = 'dodge')
graf_st_diplomantov <- graf_st_diplomantov + theme(axis.text.x = element_text(colour = 'black', angle = 90, size = 8))



# Graf: Zemljevid

Slovenija <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1") %>% fortify()


ggplot(Slovenija, aes(x=long, y=lat, group=group, fill=NAME_1)) +
  geom_polygon() +
  labs(title="Slovenija - brez podatkov") +
  theme(legend.position="none")











