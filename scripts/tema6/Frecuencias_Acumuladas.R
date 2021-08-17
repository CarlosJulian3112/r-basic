set.seed(2018)
notas = sample(1:5, 5000, replace = TRUE)
notas
ordered(x = notas, labels = c(1,2,3,4,5))

fAbs = table(notas) #Absolutas
fAbs
cumsum(fAbs) #Absolutas acumuladas
prop.table(fAbs) #Relativas 
cumsum(fAbs) #Relativas acumuladas


#Ejemplo

cuellos = sample(c("Muy Corto", "Corto", "Normal", "Largo", "Muy Largo"), 100000, replace = TRUE)
cuellos = ordered(x = cuellos, labels = c("Muy Corto", "Corto", "Normal", "Largo", "Muy Largo"))
Fr.Abs = table(cuellos)
Fr.Abs
Fr.Rel = prop.table(Fr.Abs)
Fr.Rel
cumsum(Fr.Abs)
cumsum(Fr.Rel)
barplot(cumsum(Fr.Rel))


#Multidimensionales

zonas = rep(c("A","B","C","D"), c(30000,25000,35000,10000))
jirafas = data.frame(zonas, cuellos)
str(jirafas)
head(jirafas)
apply(table(jirafas), MARGIN = 1, FUN = cumsum)
apply(prop.table(table(jirafas), margin = 1), MARGIN = 1, FUN = cumsum)
barplot(apply(prop.table(table(jirafas), margin = 1), MARGIN = 1, FUN = cumsum), beside = TRUE, legend.text = TRUE, args.legend = list(x = "topleft", cex = 0.55))

#Convertir datos cuantitativos en factores ordinales

crabs = read.table("data/datacrab.txt", header = TRUE)
crabs = crabs[,-1]
str(crabs)
table(crabs$width)
intervalos = cut(crabs$width, breaks =  c(21,25,29,33,Inf), right = FALSE, labels = c("21-25","25-29","29-33","33-..."))
crabs$widht.rank = ordered(intervalos)
Tabla = table(crabs[,c(1,6)])
Tabla
Fr.Rel = round(prop.table(Tabla, margin = 1), 3)
Fr.Rel.Acu = round(apply(prop.table(Tabla, margin = 1), MARGIN = 1, FUN = cumsum),3)
t(Fr.Rel.Acu)
azul = c("cyan", "cyan4", "cyan1", "cyan3")
barplot((Fr.Rel.Acu), col = azul, beside = TRUE, legend = TRUE, args.legend = list(x = "topleft", cex = 0.55))
