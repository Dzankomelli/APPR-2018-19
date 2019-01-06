# Uvozimo funkcije za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r", encoding="UTF-8")


# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("https://gadm.org/maps/SVN_1.html.zip", "OB",
                             pot.zemljevida="OB", encoding="Windows-1250")
levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
{ gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels=levels(obcine$obcina))
zemljevid <- fortify(zemljevid)




# Prikaz BDP per capita glede na regijo in leto

graf_bruto_proizvod <- ggplot(data = bruto, mapping = aes(x=Leto, y=BDP, fill=Regija)) 
graf_bruto_proizvod <- graf_bruto_proizvod + geom_bar(stat = 'identity', position = 'dodge')
graf_bruto_proizvod <- graf_bruto_proizvod + theme(axis.text.x = element_text(colour = 'blue', angle = 90, size = 8))
  

# Prikaz števila otrok v vrtcih




