#!/bin/bash


testfile=$1
queryfile=$2
vrtype=$3
modelfile=$4

./svm-predict $testfile $modelfile $testfile".svmlabel"

cd /search/yonghuahu/dm_/classify/svmmodel/src
perl  bin/abstractVRQuery.pl $testfile".svmlabel" $queryfile > $testfile".svmlabel.query"
perl bin/filterByVr.pl $vrtype $testfile".svmlabel.query" > $testfile".svmlabel.query.mutex"
cat $testfile".svmlabel.query.mutex" | awk '{print $2}' > /search/yonghuahu/dm_/classify/svmmodel/src/tmp/$vrtype".out.query"

########### qo_test #######################
cd /search/yonghuahu/vrqo/qo_test
sh yanzheng.online.sh /search/yonghuahu/dm_/classify/svmmodel/src/tmp/$vrtype".out.query" machines.2 | grep -v $vrtype > /search/yonghuahu/dm_/classify/svmmodel/src/tmp/$vrtype".out.query.vrqo"
cd /search/yonghuahu/dm_/classify/svmmodel/src
cat tmp/$vrtype".out.query.vrqo" | awk -F"termList=\"" '{print $2}' | awk -F"\"" '{print $1}' | sed -e "s/,[0-9]*;//g" > tmp/$vrtype".addRecall"

cd /search/yonghuahu/tools/libsvm
