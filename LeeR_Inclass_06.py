"""
Inclass 6
Ronald Lee
"""

"""
Inclass 6_1
"""

import pandas as pd
import json

a1 = pd.read_table('ch06/work_tab.txt', sep = '\s+')
a2 = pd.read_csv('ch06/work_comma.csv')
a3 = pd.read_table('ch06/stress2_1.txt', sep = '\s+')

JSON_object1 = """
		{"inclass6":[{"Name":"Murray, W", "a":38, "b":"D"},
					{"Name":"Almers, C", "a":5, "b":"I"},
					{"Name":"Bonaventure, T", "a":13, "b":"I"},
					{"Name":"Johnson, R", "a":42, "b":"S"},
					{"Name":"LaMance, K", "a":46, "b":"D"},
					{"Name":"Jones, M", "a":26, "b":"N"},
					{"Name":"Reberson, P", "a":41, "b":"D"},
					{"Name":"King, E", "a":13, "b":"I"},
					{"Name":"Pitts, D", "a":22, "b":"S"},
					{"Name":"Eberhardt, S", "a":49, "b":"N"},
					{"Name":"Nunnelly, A", "a":2, "b":"I"},
					{"Name":"Oberon, M", "a":11, "b":"D"},
					{"Name":"Peterson, V", "a":9, "b":"D"},
					{"Name":"Quigley, M", "a":26, "b":"I"},
					{"Name":"Cameron, L", "a":27, "b":"I"},
					{"Name":"Underwood, K", "a":19, "b":"S"},
					{"Name":"Takahashi, Y", "a":7, "b":"D"},
					{"Name":"Derber, B", "a":35, "b":"N"},
					{"Name":"Ivan, H", "a":41, "b":"N"},
					{"Name":"Wilcox, E", "a":57, "b":"I"},
					{"Name":"Warren, C", "a":10, "b":"S"}]
		}
				"""



data2 = json.loads(JSON_object1)
print data2

'''
json_ob3 = json.dumps(data2)
print json_ob3
'''

dataf2 = pd.DataFrame(data2['inclass6'], columns = ['Name', 'a', 'b'])
print dataf2

import requests
r = requests.get('https://api.github.com/events')
print r

'''
t = r.json()
print t
fields1 = ['created_at', 'public', 'type']
data_fr1 = pd.DataFrame(t, columns = fields1)
print data_fr1
'''


a1.to_pickle('a1frame_pickle')
a2.to_pickle('a2frame_pickle')
dataf2.to_pickle('a3frame_pickle')

pd.read_pickle('a1frame_pickle')
pd.read_pickle('a2frame_pickle')
pd.read_pickle('a3frame_pickle')

store1 = pd.HDFStore('mydata.h5')
store1['obj1'] = a1

store2 = pd.HDFStore('mydata.h6')
store2['obj2'] = a2

store3 = pd.HDFStore('mydata.h7')
store3['obj3'] = dataf2


"""
Inclass 6_2
"""


p1 = pd.read_csv('ch06/FinalProject.csv')

p1.describe()

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
There is no duplicate rows so there is no need to work on.
Therefore, I have left 100% of the rows in the new dataset
"""









