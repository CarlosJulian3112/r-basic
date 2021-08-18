#Frecuencias
edad = sample(15:70, 20, replace = TRUE)
table(edad)
round(prop.table(table(edad)), 3)
cumsum(table(edad))
round(cumsum(prop.table(table(edad))), 3)

#Ejercicio Frecuencia

dado = sample(1:6, 25, replace = TRUE)
Fr.abs <- table(dado)
Fr.rel <- round(prop.table(Fr.abs), 2)
Fr.abs.acum <- cumsum(Fr.abs)
Fr.rel.acum <- round(cumsum(Fr.rel), 2)

dados.df = data.frame(Pnutuacion = 1:6,
                      Fr.abs = as.vector(Fr.abs),
                      Fr.rel = as.vector(Fr.rel),
                      Fr.abs.acum = as.vector(Fr.abs.acum),
                      Fr.rel.acum = as.vector(Fr.rel.acum))
dados.df

#Medidas de Centralizacion

sort(dado)
mean(dado)
median(dado)
as.numeric(names(which(table(dado) == max(table(dado)))))

#Distintas Medias en Matematicas


x = c(32,45,67,43,28,17,48,95)
n = length(x)


#Media Aritemtica

sum(x)/n

#Media Ponderada

w = c(1,2,2,3,3,2,2,1)
sum(w*x)/sum(w)

#Media Geometrica

prod(x)^(1/n)
prod(x^(1/n))

#Media Armonica

n/sum(1/x)

#Minimo y Maximo

min(x)
max(x)

#Medidas de Posicion

set.seed(260798)
dado = sample(1:4, 50, replace = TRUE)
length(dado)
dado = sort(dado)

Fr.abs <- table(dado)
Fr.rel <- round(prop.table(Fr.abs), 2)
Fr.abs.acum <- cumsum(Fr.abs)
Fr.rel.acum <- round(cumsum(Fr.rel), 2)

dados.df = data.frame(Pnutuacion = 1:4,
                      Fr.abs = as.vector(Fr.abs),
                      Fr.rel = as.vector(Fr.rel),
                      Fr.abs.acum = as.vector(Fr.abs.acum),
                      Fr.rel.acum = as.vector(Fr.rel.acum))

dados.df

quantile(dado, 0.1)

#Medidas de Dispersion

max(dado)-min(dado)
range(dado)
diff(range(dado))
IQR(dado)
quantile(dado, 0.75) - quantile(dado, 0.25)
var(dado)
sd(dado)
var(dado) * (length(dado)-1)/length(dado)
sd(dado)*sqrt((length(x)-1)/length(x))

#Diagramas de Caja y Bigotes

datos = sample(1:1000, 10000000, replace = TRUE)
datos2 = sample(1:1000, 10, replace = FALSE)
boxplot(datos, datos2)

body = read.table("data/bodyfat.txt", header = TRUE)
boxplot(body)

boxplot(circumference~Tree, data = Orange,notch = TRUE, col = c("orange", "orange2", "orange3", "orange4", "red"))
boxplot(Sepal.Width~Species, data = iris, ylab = "Anchura del sétalo (cm)",
        notch = TRUE, col = c("cyan","cyan2","cyan4"),
        main = "Boxplot de iris")

#Ejercicio

data = InsectSprays
str(data)
head(data)

by(data$count, data$spray, FUN = summary)

aggregate(count~spray, data = data, FUN = sd)

boxplot(count~spray, data = data, col = c("lightgreen", "lightblue"))

#Ejercicio

notas = read.table("data/grades.txt", header = TRUE)
str(notas)
head(notas)

#Medias
mode <- function(x){
  as.numeric(names(which(table(x) == max(table(x)))))
}
mean(notas$nota)
medias = as.vector(by(notas$nota, notas$estudio, FUN = mean))
median(notas$nota)
by(notas$nota, notas$estudio, FUN = median)
mode(notas$estudio)
by(notas$nota, notas$estudio, FUN = mode)


by(notas$nota, notas$estudio, FUN = sd)

boxplot(nota~estudio, data = notas, col = c("orange3", "lightblue", "lightgreen", "yellow3"))
points(medias, col="black", pch=20)
