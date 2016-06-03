#!/usr/bin/python

import numpy as np
import sys,os,re
import string

TESTFILE = sys.argv[1]
sys.stderr.write("FILE 2 PREDICT: %s\n" % TESTFILE)
FIN = open(TESTFILE, 'r')
traincor = FIN.readlines()

N = len(traincor)
D = 55 # dimensionality
K = 2 # number of classes
#X = np.zeros((N*K,D)) # data matrix (each row = single example)
#y = np.zeros(N*K, dtype='uint8') # class labels

#for i in range(0,len(traincor)):
#		line = traincor[i].strip()
#		tmpp = []
#		tmp = line.split(" ")
#		for a in range(0,len(tmp)):
#				tmpp.append(string.atof(tmp[a]))
#		X[i] = tmpp;
#x -= np.mean(x,axis = 0)
#x /= 10000


# Read Model Parameters 
W = 0.01 * np.random.randn(D,K)
b = np.zeros((1,K))
MODELFILE = sys.argv[2]
sys.stdout.write("[INFO] Model File : %s\n" % MODELFILE)
MODELFIN = open(MODELFILE, 'r')
modelfin = MODELFIN.readlines()
print "[INFO] Begin to load model data"
feaix = 0
flag = ""
rex_ = re.compile("\[\s+|\s+\]|\[|\]")
for line in modelfin:
		line = line.strip()
		if line.find("[") == -1:
				continue
		(line,num) = rex_.subn("", line)
		if line == "weight:":
				flag = line
				continue
		if line == "b:":
				flag = line
				continue
		arr = line.split(" ")
		if len(arr) > 1 and flag == "weight:":
			W[feaix][0] = float(arr[0])
			W[feaix][1] = float(arr[len(arr)-1])
			feaix += 1
		if len(arr) > 1 and flag == "b:":
			b[0][0] = float(arr[0])
			b[0][1] = float(arr[len(arr)-1])


print "weight:"
print W
print "b:"
print b
# evaluate training set accuracy
#scores = np.dot(X, W) + b
#for score in scores:
#		print score
for i in range(0,len(traincor)):
		line = traincor[i].strip()
		tmpp = []
		tmp = line.split(" ")
		for a in range(0,len(tmp)):
				tmpp.append(string.atof(tmp[a]))
		scores = np.dot(tmpp, W) + b
		predicted_class = np.argmax(scores, axis=1)
		print predicted_class,scores

#print 'training accuracy: %.2f' % (np.mean(predicted_class == y))





