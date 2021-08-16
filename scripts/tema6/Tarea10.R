install.packages("MASS")
library("MASS")
str(birthwt)
help(birthwt)
head(birthwt)
race_low <- birthwt[c("low", "race")]
race_low
prop.table(table(race_low), margin = 2)
mosaicplot(prop.table(table(race_low), margin = 2), col = c("lightblue", "pink"), main = "Race vs low")
barplot(prop.table(table(race_low), margin = 2), col = c("lightblue", "pink"), main = "Race vs low", beside = TRUE, legend.text = c("Peso Normal", "Bajo Peso"), names = c("White", "Black", "Other"))

#La conclusion que podemos obtener es que las mujeres de raza blanca son menos propensas a tener un bebe que este bajo de peso al momento de nacer comparado con las mujeres de otra raza cualquiera

smoke_low <- birthwt[c("low", "smoke")]
smoke_low
prop.table(table(smoke_low), margin = 2)
mosaicplot(prop.table(table(smoke_low), margin = 2), col = c("lightblue", "pink"), main = "Smoke vs low")
barplot(prop.table(table(smoke_low), margin = 2), col = c("lightblue", "pink"), main = "Smoke vs low", beside = TRUE, legend.text = c("Peso Normal", "Bajo Peso"), names = c("No Fuma", "Fuma"))

#La conclusion que podemos obtener es que las mujeres que no fumaron durante el embarazo son menos propensas a tener un bebe que este bajo de peso al momento de nacer comparado con las mujeres que fumaron durante el embarazo

ht_low <- birthwt[c("low", "ht")]
ht_low
prop.table(table(ht_low), margin = 2)
mosaicplot(prop.table(table(ht_low), margin = 2), col = c("lightblue", "pink"), main = "Ht vs low")
barplot(prop.table(table(ht_low), margin = 2), col = c("lightblue", "pink"), main = "Ht vs low", beside = TRUE, legend.text = c("Peso Normal", "Bajo Peso"), names = c("No Hipertension", "Hipertension"))

#La conclusion que podemos obtener es que las mujeres que no sufren de hipertension son menos propensas a tener un bebe que este bajo de peso al momento de nacer comparado con las mujeres que tienen hipertension

race_smoke_low <- birthwt[c("race", "smoke","low")]
prop.table(table(race_smoke_low), margin = c(1,2))
mosaicplot(prop.table(table(race_smoke_low)), col = c("lightblue", "pink"))
