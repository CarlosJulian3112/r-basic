crabs = read.table("data/datacrab.txt", header = TRUE)
str(crabs)
cw = crabs$width

n = length(cw)
k1 = ceiling(sqrt(n))
k1
k2 = ceiling(1+log(n,2))
k2
As = 3.5*sd(cw)*n^(-1/3)
k3 = ceiling(diff(range(cw))/As)
k3
Afd = 2*(quantile(cw,0.75,names=FALSE)-quantile(cw,0.25,names = FALSE))*n^(-1/3)
k4 = ceiling(diff(range(cw))/Afd)
k4


nclass.Sturges(cw)
nclass.scott(cw)
nclass.FD(cw)

A = diff(range(cw)) / 10
A
A = 1.3

L1 = min(cw)-1/2*0.1
L2 = L1+A
L3 = L2+A
L4 = L3+A
L5 = L4+A
L6 = L5+A
L7 = L6+A
L8 = L7+A
L9 = L8+A
L10 = L9+A
L11 = L10+A
L = c(L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11)
L

L = L1+A*(0:10)
L

X1 = (L[1]+L[2])/2
X = X1+A*(0:9)
X

X = (L[1:length(L)-1]+L[2:length(L)])/2
X

##Funcion cut

petals = iris$Petal.Length

cut(petals, breaks = 50, right = FALSE)
cut(petals, breaks = ceiling(sqrt(length(petals))), rigth = FALSE)
cut(petals, breaks = c(1,2,3,4,5,6,7), rigth = FALSE)
cut(petals, breaks = 5, rigth = FALSE, labels = FALSE)
cut(petals, breaks = 5, rigth = FALSE, labels = c("Peq","Norm", "Gran", "Xgran","Gigan"))

#Ejemplo

TablaFrecs = function(x,k,A,p){ 
  L = min(x)-p/2+A*(0:k)
  x_cut = cut(x, breaks = L, right=FALSE)
  intervals = levels(x_cut)
  mc = (L[1]+L[2])/2+A*(0:(k-1))
  Fr.abs = as.vector(table(x_cut)) 
  Fr.rel = round(Fr.abs/length(x),4) 
  Fr.cum.abs = cumsum(Fr.abs) 
  Fr.cum.rel = cumsum(Fr.rel)
  tabla = data.frame(intervals, mc, Fr.abs, Fr.cum.abs, Fr.rel, Fr.cum.rel)
  tabla
}

TablaFrecs.L = function(x,L,V){
  x_cut = cut(x, breaks=L, right=FALSE, include.lowest=V)
  intervals = levels(x_cut)
  mc = (L[1:(length(L)-1)]+L[2:length(L)])/2
  Fr.abs = as.vector(table(x_cut)) 
  Fr.rel = round(Fr.abs/length(x),4)
  Fr.cum.abs = cumsum(Fr.abs)
  Fr.cum.rel = cumsum(Fr.rel)
  tabla = data.frame(intervals, mc, Fr.abs, Fr.cum.abs, Fr.rel, Fr.cum.rel)
  tabla
}

TF <- TablaFrecs(cw,10,1.3,0.1)
TF
TF2 <- TablaFrecs.L(cw,L,FALSE)
TF2

#Ejercicio

notas = sample(0:10, 10000, replace = TRUE)
notas
L = c(0,5,7,9,10)
notas1 = cut(notas, breaks = L, right = FALSE, include.lowest = TRUE)
notas1
MC = (L[1:length(L)-1]+L[2:length(L)])/2
notas2 = cut(notas, breaks = L, labels = MC, right = FALSE, include.lowest = TRUE)
notas2
notas3 = cut(notas, breaks = L, labels = FALSE, right = FALSE, include.lowest = TRUE)
notas3
notas4 = cut(notas, breaks = L, labels = c("Susp", "Aprob", "Not", "Exc"), right = FALSE, include.lowest = TRUE)
notas4
table(notas4)
prop.table(table(notas4))
cumsum(table(notas4))
cumsum(prop.table(table(notas4)))


notasHist = hist(notas, breaks = L, right = FALSE, include.lowest = TRUE, plot = FALSE)
FAbs = notasHist$counts
FAbs
FRel = prop.table(FAbs)
FRel
FAbsCum = cumsum(FAbs)
FAbsCum
FRelCum = cumsum(FRel)
FRelCum
intervalos = c("[0,5)","[5,7)","[7,9)","[9,10]")
calificacion = c("Suspenso", "Aprobado", "Notable", "Excelente")
marcas = notasHist$mids
tabla.Fr = data.frame(intervalos, calificacion, marcas, FAbs, FAbsCum, FRel, FRelCum)
tabla.Fr

TablaFrecs.L(notas, L , TRUE)
