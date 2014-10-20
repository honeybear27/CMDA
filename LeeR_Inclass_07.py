"""
Inclass 7
Ronald Lee
"""

"""
Inclass 7_1
"""

import pandas as pd

import matplotlib.pyplot as plt

import numpy as np


'''
c1 = {	'MIN' : [.3783, .3987, .4081, .4067, .4167],
		'PTS' : [.3142, .2824, .2938, .2922, .2809],
		'FGM' : [.1029, .0993, .1079, .0945, .1045],
		'FGA' : [.2046, .2197, .1903, .2066, .1978]
		}
c2 = pd.DataFrame(c1)
'''

a1 = pd.read_csv('ch06/FinalProject.csv')
a2 = pd.DataFrame(a1)

del a2['Team']
del a2['Player']
del a2['GP']
del a2['FG%']

a3 = a2[:5]
a4 = a3["PTS"]

plot1 = a3.plot()
plot2 = a4.hist(bins=7)
plot3 = a3.plot(kind = 'kde')
plot4 = a3.plot(kind = 'bar')
plot5 = a3.plot(kind = 'barh')
plot6 = a3.plot(kind = 'barh', stacked = True)

a3_rel = a3.div(a3.sum(1).astype(float), axis = 0)

plot7 = a3_rel.plot(kind = 'bar', stacked = True)

a6 = a3_rel[:5]

plot8 = plt.scatter(a6.PTS, a6.FGM)
plt.title("Scatterplot")

'''
fig, axes = plt.subplots(2,1)
a3.plot(kind = 'barh', ax = axes[1], stacked = True)
a3_rel.plot(kind = 'bar', ax = axes[0], stacked = True)
'''

fig1 = plot1.get_figure()
fig2 = plot2.get_figure()
fig3 = plot3.get_figure()
fig4 = plot4.get_figure()
fig5 = plot5.get_figure()
fig6 = plot6.get_figure()
fig7 = plot7.get_figure()
fig8 = plot8.get_figure()


fig1.savefig("output1.png")
fig2.savefig("output2.png")
fig3.savefig("output3.png")
fig4.savefig("output4.png")
fig5.savefig("output5.png")
fig6.savefig("output6.png")
fig7.savefig("output7.png")
fig8.savefig("output8.png")


"""
Inclass 7_2
"""

import scipy as sp
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

import sklearn as sk
''' I can't import sklearn. It says there is no module named sklearn'''

m1 = pd.read_csv('Medical.csv')

a = np.array(m1[['Age','HgA1C']])

b = np.array(m1.)

'''5'''
from sklearn.cross_validation import train_test_split
a_train, a_test, b_train, b_test =
	train_test_split(a, b, test_size = 0.25, random_state = 33)
	
'''6'''
from sklearn.preprocessing import StandardScaler
scaler = StandardScaler().fit(a_train)
a_train = scaler.transform(a_train)
a_test = scaler.transform(a_test)

color = ['red', 'blue']
for i in xrange(len(colors)):
	pa = a_train[:, 0][b_train==i]
	pb = a_train[:, 1][b_train==i]
	plt.scatter(pa, pb, c=colors[i])
	
'''7'''
from sklearn.linear_model import SGDClassifier
clf = SGDClassifier()
clf.fit(a_train, b_train)

clf.coef_
clf.intercept_

'''
equation is that
	intercept + (coefficient1)*x1 + (coefficient2)*x2 = 0
'''

'''8'''
from sklearn import metrics
b_train_pred = clf.predict(a_train)
metrics.accuracy_score(b_train, b_train_pred)

'''9'''
b_pred = clf.predict(a_test)
print metrics.accuracy_score(b_test, b_pred)

'''10'''
metrics.confusion_matrix(b_test, b_pred)




'''
Inclass 7_3
'''

from sklearn.decomposition import PCA

estimator = PCA(n_components = 10)
X_pca = estimator.fit_transform(X_digits)










