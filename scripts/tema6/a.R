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
