import seaborn as sns
import numpy as np
import pandas as pd
titanic = sns.load_dataset("titanic")
titanic.head()

titanic['survived'] = pd.Categorical(titanic['survived'])
titanic['pclass'] = pd.Categorical(titanic['pclass'])

#Tablas de contingencia

tab = pd.crosstab(index = titanic['survived'], columns='pasajeros')
tab.head()
pd.crosstab(index=titanic['pclass'], columns='pasajeros')
pd.crosstab(index=titanic['sex'], columns='pasajeros')
tab_c = pd.crosstab(index=titanic['deck'], columns='count')
tab_c.sum()
tab_c.shape
tab_c/tab_c.sum() #Frecuencias Relativas
tab/tab.sum()

#Tablas de contigencias para dos variables

survived_sex = pd.crosstab(index=titanic['survived'], columns=titanic['sex'])
survived_sex.index = ["died", "survived"]
survived_sex

survived_class = pd.crosstab(index=titanic['survived'], columns=titanic['pclass'])
survived_class.index = ["murio", "sobrevivio"]
survived_class.columns = ["primera", "segunda", "tercera"]
survived_class

survived_class = pd.crosstab(index=titanic['survived'], columns=titanic['pclass'], margins = True)
survived_class.index = ["murio", "sobrevivio", "total"]
survived_class.columns = ["primera", "segunda", "tercera", "total"]
survived_class

#Relativas Globales

survived_class/survived_class.loc["total","total"]

#Relativas Marginales

survived_class/survived_class.loc['total']
survived_class.div(survived_class.loc['total'], axis = 1)
survived_class.T/survived_class.loc[:,'total'] #Usando la traspuesta
survived_class.div(survived_class['total'], axis = 0)



#Tablas multidimensionales

survived_sex_class = pd.crosstab(index=titanic['survived'], columns=[titanic['sex'], titanic['pclass']], margins = True)
survived_sex_class_2 = survived_sex_class['male']
survived_sex_class_2["All"] = survived_sex_class_2.sum(axis = 1)
survived_sex_class_2
#survived_sex_class.loc[:,['male'][0]][3]+survived_sex_class.loc[:,['female'][0]][3]
survived_sex_class.div(survived_sex_class['male']['All'], axis = 1)

#Frecuencias Relativas de hombres

survived_sex_class_2 = survived_sex_class['male']
survived_sex_class_2["All"] = survived_sex_class_2.sum(axis = 1)
survived_sex_class_2/survived_sex_class_2.loc['All','All']

#Frwecuencias Relativas de Mujeres

survived_sex_class_2 = survived_sex_class['female']
survived_sex_class_2["All"] = survived_sex_class_2.sum(axis = 1)
survived_sex_class_2/survived_sex_class_2.loc['All','All']

#Frecuencias de Muejres discriminadas por superivnecia

survived_sex_class_2.div(survived_sex_class_2['All'], axis = 0)

#Frecuencias de Mujeres discirminado por clase

survived_sex_class_2.div(survived_sex_class_2.loc['All'], axis = 1)
survived_sex_class_2/survived_sex_class_2.loc['All']