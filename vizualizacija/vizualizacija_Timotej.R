# Uvozimo funkcije za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r", encoding="UTF-8")

map <- get_map(location = 'Slovenia', zoom = 4)
ggmap(map)



# Prikaz BDP per capita glede na regijo in leto

graf_bruto_proizvod <- ggplot(data = bruto, mapping = aes(x=Leto, y=BDP, fill=Regija)) 
graf_bruto_proizvod <- graf_bruto_proizvod + geom_bar(stat = 'identity', position = 'dodge')
graf_bruto_proizvod <- graf_bruto_proizvod + theme(axis.text.x = element_text(colour = 'blue', angle = 90, size = 8))
  




