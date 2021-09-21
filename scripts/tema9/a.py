# -*- coding: utf-8 -*-
"""
Created on Thu Sep 16 16:33:04 2021

@author: user
"""

import numpy as np
import pandas as pd
import seaborn as sb

titanic = sb.load_dataset("titanic")
titanic.head()

titanic.groupby('sex').mean()
titanic.groupby('sex')[["survived"]].mean()

titanic.groupby(["sex","pclass"])[["survived"]].aggregate('mean').unstack()

titanic.pivot_table(['survived'], index = ["sex"], columns = "pclass")

age = pd.cut(titanic['age'], bins = [0,18,25,35,50,65,100], right = False, precision = 1, include_lowest = True)
age


titanic.pivot_table('survived', index = ['sex', age], columns = 'class')

fare = pd.qcut(titanic['fare'], q  = 4, precision = 1, labels = ["Q1","Q2","Q3","Q4"])
fare
titanic.pivot_table('survived', index = ['sex', age], columns = [fare, 'pclass'])

titanic.pivot_table(values = 'survived', index = "sex", columns = "pclass", aggfunc = "sum", fill_value = None, margins = True,dropna = True,  margins_name = "All")

titanic.pivot_table(index = "sex", columns = "pclass", aggfunc = {"survived":sum, "fare":"mean"})


#Histogramas

x = (0,1,1,1,2,2,3,7,7,7,25)
def count_elements(seq) -> dict:
  """
  Funcion que cuenta las frecuencias de aparicion 
  de cada elemento de la secuencia, creando un diccionario
  como si fuese una tabla de frecuencias
  """
  hist = {}
  for i in seq:
    hist[i] = hist.get(i,0)+1
  return hist

fAbs = count_elements(x)
fAbs

#Version 2.0

from collections import Counter
fAbs2 = Counter(x)

fAbs.items() == fAbs2.items()

def ascii_histogram(seq) -> None:
  """
  Un histograma de frecuencias absolutas 
  colocado en horizontal y con caracterres ASCII
  """
  fAbs = count_elements(seq)
  for k in sorted(fAbs):
    print('{0:5d} {1}'.format(k, '+'*fAbs[k]))

ascii_histogram(x)


import random
random.seed(2019)
vals=[1,2,3,4,5,6,7,8,9,10]
freqs = (random.randint(5,20) for _ in vals)
data  = []
for k, v in zip(vals, freqs):
  data.extend([k]*v)
data
ascii_histogram(data)

#Histogramas con Numpy

np.random.seed(2019)
np.set_printoptions(precision = 3)
x = np.random.laplace(loc= 10, scale = 3, size = 1000)
x[:10]

hist, bin_edges = np.histogram(x)
hist
bin_edges
dict(zip(bin_edges[hist.nonzero()], hist[hist.nonzero()]))

#Histogramas con Matplotlib y pandas

import matplotlib.pyplot as plt
n, bins, patches = plt.hist(x = x, bins = "auto", color = "#0505a5", alpha = 0.75, rwidth = 0.85)
plt.grid(axis = "y", alpha = 0.5)
plt.xlabel("Valor")
plt.ylabel("Frecuencia")
plt.title("Un histograma de frecuencias")
plt.text(-10, 80, r'$\mu = 10, b = 3$')
plt.ylim(ymax = np.ceil(n.max()/10)*10 if n.max()%10 else n.max()+1)

n
bins
patches

size, scale = 1000, 10
data = pd.Series(np.random.gamma(scale, size = size))
data.plot.hist(grid = True, bins = 20, rwidth = 0.9, color = "#d52675")
plt.title("Distribucion Gamma")
plt.xlabel("Valores")
plt.ylabel("Frecuencias")
plt.grid(axis = "x", alpha = 0.75)

titanic["age"].plot.hist(grid = True, bins = 10, rwidth = 0.9, color = "#d50000")
plt.title("Distribucion Gamma")
plt.xlabel("Valores")
plt.ylabel("Frecuencias")
plt.grid(axis = "x", alpha = 0.75)

mu = 10, 20
sigma = 5, 2
dist = pd.DataFrame(np.random.normal(loc = mu, scale = sigma, size = (1000,2)), columns = ["x1","x2"])
dist.agg(["min", "max", "mean", "std"]).round(decimals=2)

fig, ax = plt.subplots()
dist.plot.kde(ax = ax, legend = False, title = "histograma de dos normales")
dist.plot.hist(density=True, ax = ax )
ax.set_ylabel("Probabilidad")
ax.grid(axis = "y", alpha = 0.75)
ax.set_facecolor("#d5d5d5")

from scipy import stats
dist = stats.norm()

sample = dist.rvs(size = 1000)
x = np.linspace(start=stats.norm.ppf(0.01), stop = stats.norm.ppf(0.99), num = 250)
gkde = stats.gaussian_kde(dataset=sample)

fig, ax = plt.subplots()
ax.plot(x, dist.pdf(x), linestyle= "solid", c = "red", lw = 3, alpha = 0.8, label = "Distribucion normal")
ax.plot(x, gkde.evaluate(x), linestyle= "dashed", c = "green", lw = 2, alpha = 0.8, label = "PDF estimado con KDE")
ax.legend(loc = "best", frameon = False)
ax.set_title("Normal analitica vs estimada")
ax.set_ylabel("Probabilidad")
ax.text(-2., 0.35, r'$f(x) = \frac{e^{-x^2/2}}{\sqrt{2\pi}}$', fontsize = 14)

import seaborn as sb
sb.distplot(data)
np.random.seed(2019)
x = np.random.laplace(loc = 10, scale = 3, size = 1000)
sb.set_style("darkgrid")
sb.distplot(x)

sb.distplot(data, fit = stats.laplace)

sb.distplot(data, fit = stats.laplace, kde = False)



data2 = np.random.choice(np.arange(10), size = 10000, p = np.linspace(1, 11, 10)/60)
s = pd.Series(data2)

s.value_counts()
s.value_counts(normalize = True)


age = pd.Series([1,1,3,5,6,8,9,10,12,15,18,18,18,20,25,30,40,51,52])
bins = (0,10,15,18,21,np.inf)
labels = ("infancia", "preadolescencia", "adolescencia", "universitario", "adulto")

groups = pd.cut(age, bins = bins, labels = labels)
groups.value_counts()
groups

pd.concat((age, groups), axis = 1).rename(columns = {0 : "ages", 1 : "groups"})
