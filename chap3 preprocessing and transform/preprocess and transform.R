summary(iris)
summary(airquality)

library('ISLR')
data(Caravan)
summary(Caravan)
sm.Caravan <- lapply(Caravan, summary)

#calc. correlations
cor(subset(iris, select = -Species)) #calc. correlations for iris data set except for Species
pairs(iris)

library('GGally')
ggpairs(iris, colour = "Species", shape = "Species", pointsize = 10)

library(tabplot)
tableplot(iris)