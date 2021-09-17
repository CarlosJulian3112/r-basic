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