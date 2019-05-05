source('lib/libraries.r', encoding = 'UTF-8')


bruto_slovenija1$Leto <- as.character(bruto_slovenija1$Leto)
bruto_slovenija1$BDP <- as.character(bruto_slovenija1$BDP)


bruto_slovenija1 <- bruto_slovenija1 %>% mutate(Leto = parse_integer(Leto), BDP = parse_number(BDP))
prileganje <- lm(BDP ~ poly(Leto,3), data = bruto_slovenija1)
predict(prileganje, data.frame(Leto=seq(2017,2020,1)))
napoved <- mutate(data.frame(Leto=seq(2017,2020,1)), bruto_slovenija1 = predict(prileganje,newdata=data.frame(Leto=seq(2017,2020,1))))


graf_napoved <- ggplot(bruto_slovenija1, aes(x=Leto, y=BDP)) + geom_point() + 
  geom_smooth(method='lm', formula=y ~ x, fullrange=TRUE, color='green') + scale_x_continuous('Leto', breaks = seq(2007, 2020, 1), limits = c(2007,2020))
 



