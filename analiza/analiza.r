source('lib/libraries.r', encoding = 'UTF-8')

# 
# bruto_slovenija1$Leto <- factor(paste(bruto_slovenija1$Leto))
# bruto_slovenija1$BDP <- factor(paste(bruto_slovenija1$BDP))


prileganje <- lm(BDP ~ Leto, data = bruto_slovenija1)
leta <- factor(data.frame(Leto=seq(2018,2020,1)))
predict(prileganje, data.frame(Leto=leta))
napoved <- mutate(leta, bruto_slovenija1 = predict(prileganje,leta))



# graf.napoved <- ggplot(bruto_slovenija1, aes(x=Leto, y=BDP))+
#   geom_point() + geom_smooth(method=lm, fullrange=TRUE, color='red') + geom_point(data=napoved, inherit.aes = TRUE)+
#   labs(title='Krneki') +
#   scale_x_continuous('Leto', breaks = seq(2007, 2020, 1), limits = c(2007,2019))
# 


