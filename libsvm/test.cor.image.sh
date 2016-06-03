tail -2000 ../liblinear/data/tmp/video.src.tmp.4svm.post > data/test/test.cor
tail -2000 ../liblinear/data/tmp/music.src.tmp.4svm.post >> data/test/test.cor     
tail -2000 ../liblinear/data/tmp/shop.src.tmp.4svm.post >> data/test/test.cor     
tail -2000 ../liblinear/data/tmp/novel.src.tmp.4svm.post >> data/test/test.cor    
tail -2000 ../liblinear/data/tmp/soft.src.tmp.4svm.post >> data/test/test.cor     
tail -2000 ../liblinear/data/tmp/fangchan.src.tmp.4svm.post >> data/test/test.cor    
tail -2000 ../liblinear/data/tmp/job.src.tmp.4svm.post >> data/test/test.cor        
tail -2000 ../liblinear/data/tmp/wenda.src.tmp.4svm.post >> data/test/test.cor   
tail -2000 ../liblinear/data/tmp/web.src.tmp.4svm.post >> data/test/test.cor     


cat data/test/test.cor  | sed -e "s/^[0-9]* /0 /" > data/test/test.cor.post
tail -18000 ../liblinear/data/tmp/image.src.tmp.4svm.post | sed -e "s/^[0-9]* /1 /" >> data/test/test.cor.post

mv data/test/test.cor.post data/test/test.cor
