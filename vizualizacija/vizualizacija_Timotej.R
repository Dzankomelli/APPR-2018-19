# Uvozimo funkcije za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r", encoding="UTF-8")


# Uvozimo zemljevid.
# zemljevid <- uvozi.zemljevid('https://gadm.org/maps/SVN_1.html', "Zemljevid",
#                              pot.zemljevida="", encoding="Windows-1250")
# levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
# { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
# zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels=levels(obcine$obcina))
# zemljevid <- fortify(zemljevid)



# graf: prikaz BDP per capita glede na regijo in leto

graf_bruto_proizvod <- ggplot(data = bruto, mapping = aes(x=Leto, y=BDP, fill=Regija)) 
graf_bruto_proizvod <- graf_bruto_proizvod + geom_bar(stat = 'identity', position = 'dodge')
graf_bruto_proizvod <- graf_bruto_proizvod + theme(axis.text.x = element_text(colour = 'blue', angle = 90, size = 8))
  

# Graf: prikaz števila otrok v vrtcih

otroci_vrtci <- ggplot(data = vrtec, mapping = aes(x=Regija, y=Stevilo, Group = Leto, fill=Spol))
otroci_vrtci <- otroci_vrtci + geom_bar(stat = 'identity', position = 'dodge')
otroci_vrtci <- otroci_vrtci + theme(axis.text.x = element_text(colour = 'red', angle = 90, size = 8))


# Graf: stevilo Studentov v terciarnih dejavnostih

terciarno_solanje <- ggplot(data = terciarno, mapping = aes(x=Regija, y=Stevilo, fill=Vrsta, Group=Leto))
terciarno_solanje <- terciarno_solanje + geom_bar(stat = 'identity', position = 'dodge')
terciarno_solanje <- terciarno_solanje + theme(axis.text.x = element_text(colour = 'red', angle = 90, size = 8))


# Graf: tevilo diplomantov

st_diplomantov <- ggplot(data = diplomanti, mapping = aes(x=Regija, y=Stevilo, fill=Leto))
st_diplomantov <- st_diplomantov + geom_bar(stat = 'identity', position = 'dodge')
st_diplomantov <- st_diplomantov + theme(axis.text.x = element_text(colour = 'red', angle = 90, size = 8))