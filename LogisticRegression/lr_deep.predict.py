#!/usr/bin/python

################################ predict test corpus #####################################
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


#### read model parameters #############
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
#
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




