#Juntar color de ojjos y pelo sin distinguir sexo

male <- HairEyeColor[, ,"Male"]
female <- HairEyeColor[, ,"Female"]
data <- as.table(male+female)
data

#Manipulacion de datos
dimnames(data)
dimnames(data) = list(
  Pelo = c("Negro", "Cafe", "Rojo", "Rubio"),
  Ojos = c("Cafes", "Azules", "Pardos", "Verde")
)
dimnames(data)

mosaicplot(data, col = c("PinK", "LightBlue"), main = "Diagrama de Mosaicos")

#Datos numericos

sum(data)

colSums(data)
rowSums(data)
round(prop.table(colSums(data)),3)
round(prop.table(rowSums(data)),3)


barplot(round(prop.table(colSums(data)),3), col = c("Brown","LightBlue","Gold", "LightGreen"), main = "Frecuencias Relativas de\n colores de ojos")
barplot(round(prop.table(rowSums(data)),3), col = c("Black","Brown","Red", "Yellow"), main = "Frecuencias Relativas de\n colores de cabello")
round(prop.table(data),3)
round(prop.table(data, margin = 1), 3)
round(prop.table(data, margin = 2), 3)

barplot(round(prop.table(data, margin = 1), 3), col = c("Black","Brown","Red", "Yellow"), beside = TRUE, legend.text = TRUE)
barplot(round(t(prop.table(data, margin = 2)), 3), col = c("Brown","LightBlue","Gold", "LightGreen"), beside = TRUE, legend.text = TRUE)

