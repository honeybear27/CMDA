"""
HW 04
Ronald Lee
"""

import pandas as pd
import json

p1 = pd.read_csv('ch06/FinalProject.csv')

p1.describe()

print p1.describe()

"""
		GP			MIN			PTS			FGM			FGA			FG%
count	60			60			60			60			60			60
mean	75.85		2573.53		1422.10		516.28		1120.48		46.16
std		5.06		284.80		303.25		100.85		197.23		4.34
min		62			1810		1096		387			800			37.30
25%		72.75		2410.50		1237.50		446.50		991.50		42.975
50%		77			2554.50		1301		482.50		1067		45.45
75%		80			2786.50		1565.75		564			1262.50		49.1565
max		82			3122		2593		849			1688		59.10

"""


FGP = p1['FG%']
range = [35, 40, 45, 50, 55, 60]
categorical1 = pd.cut(FGP, range)

pd.value_counts(categorical1)

c1 = categorical1.labels
pref1 = {0:'too low',1:'low',2:'so so',3:'high', 4:'too high'}
p1['pref1'] = c1
p1['pref1'] = p1['pref1'].map(pref1)
import numpy as np

p2 = p1.rename(columns = {'GP':'Game Played','MIN':'Playing Minutes','PTS':'Points','FGM':'Field Goal Made','FGA':'Field Goal Attempted','FG%':'Field Goal Percentage','pref1':'Preference'})

print p2

"""
There is no missing value in the dataset.
"""

"""
There is data transformations such as renaming the columns and adding an evaluation column based on FG%.
"""

sampler = np.random.permutation(60)
sampler
train1 = sampler[:30]
train1
train_df1 = p2.take(train1)
train_df1

train2 = sampler[30:60]
train2
train_df2 = p2.take(train2)
train_df2

train_df3 = pd.merge(train_df1, train_df2, how = 'outer')
train_df3


"""
1. p2.describe()
	
	We can see the summary of the whole dataset like mean, standard deviation, minimum, 25%, median, 75%, and maximum.]
	
2. categorical1 = pd.cut(FGP, range)
	pd.value_counts(categorical1)
	
	We divide the Field Goad Percentage by 5 intervals so that we can see the distribution of the FG% of top 60 players.
	
3. p2.head()

	We can see the top 5 players especially on Points section among top 60 players.
	So, we can compare other sections each other.

"""
hw4_01 = p2.describe()
hw4_02 = pd.value_counts(categorical1)
hw4_03 = p2.head()

hw4_01.to_pickle('hw4_01frame_pickle')
hw4_02.to_pickle('hw4_02frame_pickle')
hw4_03.to_pickle('hw4_03frame_pickle')

pd.read_pickle('hw4_01frame_pickle')
pd.read_pickle('hw4_02frame_pickle')
pd.read_pickle('hw4_03frame_pickle')






