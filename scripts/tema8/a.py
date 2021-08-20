import seaborn as sb
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
planets = sb.load_dataset('planets')
planets.shape
planets.head()
planets.describe()

planets.distance.sum()
planets.distance.prod()
planets.distance.mad()
planets.distance.var()
planets.distance.std()

planets.groupby('method')['orbital_period'].median()

for (method, group) in planets.groupby('method'):
  print("{0:30s} shape = {1}".format(method, group.shape))

planets.groupby('method')['year'].describe()

decade = 10*(planets['year']//10)
decade = decade.astype(str)+'s'
decade.name = 'decade'
planets.groupby(['method', decade])['number'].sum().unstack().fillna(0)

#Diagrama de Caja y Bigotes

np.random.seed(19880519)
dist1 = 100*np.random.rand(50)
dist2 = 50*np.ones(25)
dist3 = 100+100*np.random.rand(10)
dist4 = -100*np.random.rand(10)
data = np.concatenate((dist1, dist2, dist3, dist4))

fig1, ax1 = plt.subplots()
ax1.set_title('Basic Plot')
ax1.boxplot(data)

fig1, ax1 = plt.subplots()
ax1.set_title('Basic Plot con muescas')
ax1.boxplot(data, notch = True)

green_diamond = dict(markerfacecolor = "g", marker = "D")
fig1, ax1 = plt.subplots()
ax1.set_title('Basic Plot con muescas')
ax1.boxplot(data, flierprops = green_diamond)

fig1, ax1 = plt.subplots()
ax1.set_title('Basic Plot Sin outliers')
ax1.boxplot(data, showfliers = False)


fig1, ax1 = plt.subplots()
ax1.set_title('Basic Plot Horizontal')
ax1.boxplot(data, vert = False)


fig1, ax1 = plt.subplots()
ax1.set_title('Basic Plot Con Bigotes mas cortos')
ax1.boxplot(data, whis = 0.75)

dist1 = 100*np.random.rand(50)
dist2 = 40*np.ones(25)
dist3 = 100+100*np.random.rand(10)
dist4 = -100*np.random.rand(10)
data2 = np.concatenate((dist1, dist2, dist3, dist4))
fulldata = [data, data2, data2[::2]]

fig1, ax1 = plt.subplots()
ax1.set_title('Multiples Muestras')
ax1.boxplot(fulldata)

fulldata
