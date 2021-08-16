#Funcion Table(Tabal de Frecuencias Absolutas)

x = sample(1:10, size = 12, replace = TRUE)
x
table(x) #Tabla de Contigencia
names(table(x))
table(x)[3]
table(x)["3"]
z = factor(x, levels = 1:10)
z
table(z)
Respuestas = factor(sample(c("Si", "No"), size = 12, replace = TRUE))
Respuestas
table(Respuestas)
sum(table(Respuestas))
sqrt(table(Respuestas))

#/////////////////////////////////////////////////////////

#Funcion prop.table(Tabla de Frecuencias Relativas)

prop.table(table(x)) #Primero se debe hacer table y despues el prop.table
prop.table(table(Respuestas))
table(x)/length(x) #Definicion de frecuencia relativa
names(which(table(x) == 1)) #Niveles de x con frecuencia absoluta = 1

#Ejercicio

e = c(rep("H", 6), rep("M", 14))
table(e)
prop.table(table(e))
moda <- function(d){
  m <- names(which(table(d) == max(table(d))))
  print(m)
  print(table(d)[m])
  print(prop.table(table(d)[m]))
}
moda(e)

#Tablas de Frecuencias Bidimensionales

Sexo = sample(c("H", "M"), size = length(Respuestas), replace = TRUE)
table(Respuestas, Sexo)
table(Sexo, Respuestas)
t(table(Respuestas, Sexo)) #t = Transpuesta de una Matriz

table(Sexo, Respuestas)[1,2]
table(Sexo, Respuestas)["M", "No"]
prop.table(table(Sexo, Respuestas)) #Relativas globales
prop.table(table(Sexo, Respuestas), margin = 1) #Relativas Por fila(Sexo)
prop.table(table(Sexo, Respuestas), margin = 2) #Relativas por columna(Respuestas)

#Funcion CrossTable

install.packages("gmodels")

library(gmodels)
sex = factor(c(sample(c("H", "M"), size = 10, replace = TRUE)))
ans = factor(c(sample(c("Si", "No"), size = 10, replace = TRUE)))
CrossTable(sex, ans, prop.chisq = FALSE)

tt <- table(sex, ans)
tt
prop.table(tt)
prop.table(tt, margin = 1)
prop.table(tt, margin = 2)

colSums(tt)
rowSums(tt)
colSums(prop.table(tt))
rowSums(prop.table(tt))

apply(tt, FUN = sum, MARGIN = 1)
apply(tt, FUN = sqrt, MARGIN = c(1,2))

#Tablas de Frecuencias Multivariables(Multidimensional)

ans = sample(c("Si", "No"), size = 1000, replace = TRUE)
sex = sample(c("H", "M"), size = 1000, replace = TRUE)
place = sample(c("Bogota", "Cali", "Medellin", "Barranquilla", "San Andres"), size = 1000, replace = TRUE)

table(sex, ans, place)
ftable(sex,ans,place)
ftable(sex, ans, place, col.vars = c("sex", "ans"))

table(sex, ans, place)["H","Si", "Bogota"]
table(sex, ans, place)[,"Si", "Bogota"]
table(sex, ans, place)[,, "Bogota"]

#Frecuencias Relativas

prop.table(table(sex, ans, place))#Frec Relativas Globales
prop.table(table(sex, ans, place), margin = 3) #Frexc Relativa Marginal por lugar
prop.table(table(sex, ans, place), margin = c(1,3))#Frec Relativa Marginal por lugar y por genero





#Ejemplo de color de ojos y pelo

HairEyeColor
sum(HairEyeColor) -> total
prop.table(HairEyeColor, margin = 3)
prop.table(HairEyeColor, margin = c(1,2))

aperm(HairEyeColor, perm = c("Sex", "Hair", "Eye"))#Cambiar el orden de las variables



#Tablas a partir de dataframes

Beb_Energ = read.table("data/EnergyDrink", header = TRUE)
str(Beb_Energ)
head(Beb_Energ)
summary(Beb_Energ)
apply(Beb_Energ, MARGIN = 2, FUN = table)
apply(Beb_Energ, MARGIN = 2, FUN = table)$sexo
table(Beb_Energ$sexo)
table(Beb_Energ)
table(Beb_Energ[c(1,3)])


#Diagrama de Barras

barplot(table(Beb_Energ$sex), col = c("blue", "pink"), main= "Diagrama de Barras")
barplot(table(Beb_Energ$sex), col = c("blue", "pink"), main= "Diagrama de Barras", horiz = TRUE)
barplot(table(Beb_Energ$sex, Beb_Energ$estudio), col = c("blue", "pink"), main= "Diagrama de Barras", legend.text = TRUE)
barplot(table(Beb_Energ$estudio, Beb_Energ$sex), col = c("blue", "yellow", "orange", "green"), main= "Diagrama de Barras", legend.text = TRUE, beside = TRUE)

#Diagrama Circulares

pie(table(Beb_Energ$estudio), legend.text = TRUE)

#Diagrama de Mosaico

mosaicplot(table(Beb_Energ$sexo, Beb_Energ$estudio, Beb_Energ$bebe), col = c("pink", "lightblue"))
