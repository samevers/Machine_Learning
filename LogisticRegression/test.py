#!/usr/bin/python


import numpy as np

N = 200000 # number of points per class
D = 20 # dimensionality
K = 2 # number of classes
X = np.zeros((N*K,D)) # data matrix (each row = single example)
y = np.zeros(N*K, dtype='uint8') # class labels


TRAINFILE = "train.cor"
FIN = open(TRAINFILE, 'r')
traincor = FIN.readlines()
## read train.cor
for j in xrange(K):
	ix = range(N*j,N*(j+1))
	#r = np.linspace(0.0,1,N) # radius
	#t = np.linspace(j*4,(j+1)*4,N) + np.random.randn(N)*0.2 # theta
	#X[ix] = np.c_[r*np.sin(t), r*np.cos(t)]
	for i in ix:
		line = traincor[i].strip()
		print line
	#print X[ix]
	y[ix] = j
# lets visualize the data:
#plt.scatter(X[:, 0], X[:, 1], c=y, s=40, cmap=plt.cm.Spectral)



