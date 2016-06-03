## cut
cat /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post | perl ../libsvm/data/bin/cut.pl > /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut
## predict
./predict.score /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut train.cor.image.cut.model /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut.liblinear.image
./predict.score /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut train.cor.video.cut.model /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut.liblinear.video
./predict.score /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut train.cor.music.cut.model /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut.liblinear.music
./predict.score /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut train.cor.shop.cut.model /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut.liblinear.shop
./predict.score /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut train.cor.novel.cut.model /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut.liblinear.novel
./predict.score /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut train.cor.soft.cut.model /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut.liblinear.soft
./predict.score /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut train.cor.wenda.cut.model /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut.liblinear.wenda
./predict.score /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut train.cor.web.cut.model /search/yonghuahu/dm_/classify/svmmodel/src/tmp/test.10w.4svm.post.cut.liblinear.web
