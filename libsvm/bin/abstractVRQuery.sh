#!/bin/bash

svmoutfile=$1
extendfile=$2
perl /search/yonghuahu/dm_/classify/svmmodel/src/bin/abstractVRQuery.pl $svmoutfile $extendfile  
