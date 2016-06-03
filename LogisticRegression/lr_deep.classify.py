#!/usr/bin/python

import numpy as np
import sys,os,re
import string


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
#TRAINFILE = "data/train.lr"
#TRAINFILE = "../liblinear/data/train/train.image.video.lr"
#TRAINFILE = "train.cor.sam"
#TRAINFILE = "sample.txt"
#TRAINFILE = sys.argv[1]
sys.stderr.write("TRAIN FILE: %s\n" % TRAINFILE)
FIN = open(TRAINFILE, 'r')
traincor = FIN.readlines()
## read train.cor
#X = []
for j in xrange(K):
	ix = range(N*j,N*(j+1))
	#r = np.linspace(0.0,1,N) # radius
	#t = np.linspace(j*4,(j+1)*4,N) + np.random.randn(N)*0.2 # theta
	#X[ix] = np.c_[r*np.sin(t), r*np.cos(t)]
	for i in ix:
		line = traincor[i].strip()
		#sys.stderr.write("%s\n" % line)
		tmpp = []
		tmp = line.split(" ")
		for a in range(0,len(tmp)):
				tmpp.append(string.atof(tmp[a]))
		X[i] = tmpp;
		#print X[i]
	y[ix] = j
	#print X[j]
#print "Before np.std Operation ..."
#X /= np.std(X, axis = 0)
X -= np.mean(X)
#X /= 100
#X /= 1000000
#X /= 7000

# initialize parameters randomly
h = 100 # size of hidden layer
W = 0.01 * np.random.randn(D,h)
b = np.zeros((1,h))
W2 = 0.01 * np.random.randn(h,K)
b2 = np.zeros((1,K))
# some hyperparameters
step_size = 1e-0
reg = 1e-3 # regularization strength
# gradient descent loop
num_examples = X.shape[0]
pre_loss = 0
#for i in xrange(10000):
for i in xrange(800):
	#print "iteration ......................................",i
	# evaluate class scores, [N x K]
	hidden_layer = np.maximum(0, np.dot(X, W) + b) # note, ReLU activation
	scores = np.dot(hidden_layer, W2) + b2
	print "scores = ",scores
	# compute the class probabilities
	exp_scores = np.exp(scores)
	print "exp_scores = ",exp_scores
	#print "shape: ",np.sum(exp_scores, axis=1, keepdims=True).shape
	probs = exp_scores / (np.sum(exp_scores, axis=1, keepdims=True) )
	print "probs = ",probs
	# compute the loss: average cross-entropy loss and regularization
	corect_logprobs = -np.log(probs[range(num_examples),y])
	data_loss = np.sum(corect_logprobs)/num_examples
	reg_loss = 0.5*reg*np.sum(W*W) + 0.5*reg*np.sum(W2*W2)
	loss = data_loss + reg_loss
	loss_ = abs_(loss, pre_loss)
	print "loss_ = ",loss_
	#if loss_ < 0.0001:
	#	break
	pre_loss = loss
	#if i % 10 == 0:
	sys.stderr.write("----------------------------iteration %d\tloss %f\n" % (i,loss))
	#if loss > 10000:
	#		break
	#print "iteration %d: loss %f" % (i, loss)
	# compute the gradient on scores
	dscores = probs
	dscores[range(num_examples),y] -= 1
	dscores /= num_examples
	# backpropate the gradient to the parameters
	# first backprop into parameters W2 and b2
	dW2 = np.dot(hidden_layer.T, dscores)
	db2 = np.sum(dscores, axis=0, keepdims=True)
	# next backprop into hidden layer
	dhidden = np.dot(dscores, W2.T)
	# backprop the ReLU non-linearity
	dhidden[hidden_layer <= 0] = 0
	# finally into W,b
	dW = np.dot(X.T, dhidden)
	db = np.sum(dhidden, axis=0, keepdims=True)
	# add regularization gradient contribution
	dW2 += reg * W2
	dW += reg * W
	# perform a parameter update
	W += -step_size * dW
	b += -step_size * db
	W2 += -step_size * dW2
	b2 += -step_size * db2
	#print "W = ",W
	#print "b = ",b
	#print "W2 = ",W2
	#print "b2 = ",b2

	#print "--------------------------------------------------------"

print "[INFO] Write the model patameters file ...."
PARAFILE=file("model.lr",'w')
print "[weight:]"
for w in W:
	for ww in w:
		PARAFILE.write("%f " % ww)
	PARAFILE.write("\n")
	
print "[b:]"
for b_ in b:
	for bb in b_:
		PARAFILE.write("%f " % bb)
	PARAFILE.write("\n")
print "[weight2:]"
for w in W2:
	for ww in w:
		PARAFILE.write("%f " % ww)
	PARAFILE.write("\n")
print "[b2:]"
for b_ in b2:
	for bb in b_:
		PARAFILE.write("%f " % bb)
	PARAFILE.write("\n")
PARAFILE.close()

"""
print "W = ",W
print "b = ",b
print "W2 = ",W2
print "b2 = ",b2

"""

# evaluate training set accuracy
hidden_layer = np.maximum(0, np.dot(X, W) + b)
scores = np.dot(hidden_layer, W2) + b2
#print "scores:"
#print scores
predicted_class = np.argmax(scores, axis=1)
#print "predicted_class:"
#print predicted_class
#print 'training accuracy: %.2f' % (np.mean(predicted_class == y))
accuracy = np.mean(predicted_class == y)
sys.stderr.write("[training accuracy]: %f\n" % accuracy)




################################ predict test corpus #####################################
"""
N = 18000 # number of points per class
D = 55 # dimensionality
K = 2 # number of classes
X = np.zeros((N*K,D)) # data matrix (each row = single example)
y = np.zeros(N*K, dtype='uint8') # class labels


#TESTFILE = "../libsvm/data/test/test.cor.cut.lr"
#TESTFILE = "/search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut.lr"
TESTFILE=sys.argv[1]
sys.stderr.write("TEST FILE: %s\n" % TESTFILE)
FIN = open(TESTFILE, 'r')
testcor = FIN.readlines()
## read test.cor
for j in xrange(K):
	ix = range(N*j,N*(j+1))
	for i in ix:
		line = testcor[i].strip()
		tmpp = []
		tmp = line.split(" ")
		for a in range(0,len(tmp)):
				tmpp.append(string.atof(tmp[a]))
		X[i] = tmpp;
	y[ix] = j
X -= np.mean(X)
# evaluate testing set accuracy
hidden_layer = np.maximum(0, np.dot(X, W) + b)
scores = np.dot(hidden_layer, W2) + b2
predicted_class = np.argmax(scores, axis=1)
outfile = TESTFILE + ".lrout"
FILEOUT=file(outfile, 'w')
for cla in predicted_class:
	FILEOUT.write("%d\n" % cla)
FILEOUT.close()
accuracy = np.mean(predicted_class == y)
sys.stderr.write("[testing in open eara Accuracy]: %f\n" % accuracy)

"""


