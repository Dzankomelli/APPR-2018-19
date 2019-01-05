# Uvozimo funkcije za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r", encoding="UTF-8")

graf_bruto_proizvod <- ggplot((data = bruto), aes(x=Leto, y=BDP, col=Regija)) + geom_point()
plot(graf_bruto_proizvod)