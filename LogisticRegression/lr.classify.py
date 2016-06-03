#!/usr/bin/python

import numpy as np
import sys,os,re
import string

#iter_num = sys.argv[1]
def abs_(pre,cur):
		if pre > cur:
				return (pre-cur)
		else:
				return (cur-pre)

N = 18000 # number of points per class
D = 55 # dimensionality
K = 2 # number of classes
X = np.zeros((N*K,D)) # data matrix (each row = single example)
y = np.zeros(N*K, dtype='uint8') # class labels

TRAINFILE = "../libsvm/data/train/train.cor.cut.lr"
sys.stderr.write("TRAIN FILE: %s\n" % TRAINFILE)
FIN = open(TRAINFILE, 'r')
traincor = FIN.readlines()
## read train.cor
for j in xrange(K):
	ix = range(N*j,N*(j+1))
	for i in ix:
		line = traincor[i].strip()
		tmpp = []
		tmp = line.split(" ")
		#if len(tmp) != 48:
		#		continue
		for a in range(0,len(tmp)):
				tmpp.append(string.atof(tmp[a]))
		X[i] = tmpp;
	y[ix] = j
X -= np.mean(X,axis = 0)
#X /= 100000
#X /= np.std(X, axis = 0)

#Train a Linear Classifier
# initialize parameters randomly
W = 0.01 * np.random.randn(D,K)
b = np.zeros((1,K))
# some hyperparameters
step_size = 1e-0
#step_size =2 
print "step_size: ",step_size
#step_size = 0.001
reg = 1e-3 # regularization strength
# gradient descent loop
loss_sta = 0.0000001
num_examples = X.shape[0]
#for i in xrange(5000):
#for i in xrange(iter_num):
loss_pre = 1000
for i in xrange(10000):
	# evaluate class scores, [N x K]
	scores = np.dot(X, W) + b
	#print "scores = ",scores
	# compute the class probabilities
	exp_scores = np.exp(scores)
	#print "exp_scores = ",exp_scores
	probs = exp_scores / np.sum(exp_scores, axis=1, keepdims=True) # [N x K]
	#print "probs = ",probs
	# compute the loss: average cross-entropy loss and regularization
	corect_logprobs = -np.log(probs[range(num_examples),y])
	data_loss = np.sum(corect_logprobs)/num_examples
	reg_loss = 0.5*reg*np.sum(W*W)
	loss = data_loss + reg_loss
	#print "loss = ",loss
	if i % 10 == 0:
		print "iteration %d: loss %f" % (i, loss)
	print "loss dis:",loss_pre- loss
	if abs_(loss_pre,loss) <= loss_sta:
			break
	loss_pre = loss
	# compute the gradient on scores
	dscores = probs
	dscores[range(num_examples),y] -= 1
	dscores /= num_examples
	
	
	# backpropate the gradient to the parameters (W,b)
	dW = np.dot(X.T, dscores)
	db = np.sum(dscores, axis=0, keepdims=True)
	dW += reg*W # regularization gradient
	# perform a parameter update
	W += -step_size * dW
	b += -step_size * db
print "[weight:]"
for w in W:
		print w
print "[b:]"
for b_ in b:
		print b_

# evaluate training set accuracy
scores = np.dot(X, W) + b
#for score in scores:
#		print score
predicted_class = np.argmax(scores, axis=1)
for s in predicted_class:
	print s
print 'training accuracy: %.2f' % (np.mean(predicted_class == y))
