#!/bin/bash


vrtype=$1
classtag=$2
thres=$3
modelfile=$4

./predict.score /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post $modelfile "out."$vrtype
cat /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.extend | sed -e "s/:[.0-9]*//g" |sed -e "s/\$\#\(.*\)//" > tmp/test.10w.4svm.extend.post
perl bin/outcome.pl tmp/test.10w.4svm.extend.post out.score $thres > out/$vrtype".out"

############################ yanzheng
cat out/$vrtype".out" | sed -e "s/^extend = \^ //" | sed -e "s/\t[.0-9]*//" | sed -e "s/ //g" > out/$vrtype".out.query"
cd /search/yonghuahu/vrqo/qo_test
sh yanzheng.online.sh /search/yonghuahu/tools/liblinear/out/$vrtype".out.query" machines.yanzheng | grep -v $classtag > /search/yonghuahu/tools/liblinear/out/$vrtype".out.query.vrqo.add"
