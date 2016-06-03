## image
head -2000 ../liblinear/data/tmp/video.src.tmp.4svm.post > data/train/train.cor
head -2000 ../liblinear/data/tmp/music.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/shop.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/novel.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/soft.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/fangchan.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/job.src.tmp.4svm.post >> data/train/train.cor        
head -2000 ../liblinear/data/tmp/wenda.src.tmp.4svm.post >> data/train/train.cor   
head -2000 ../liblinear/data/tmp/web.query.sort.100w.4svm.post >> data/train/train.cor     


cat data/train/train.cor  | sed -e "s/^[0-9]* /0 /" > data/train/train.cor.post
head -18000 ../liblinear/data/tmp/image.src.tmp.4svm.post | sed -e "s/^[0-9]* /1 /" >> data/train/train.cor.post

mv data/train/train.cor.post data/train/train.cor.image

## video
head -2000 ../liblinear/data/tmp/image.src.tmp.4svm.post > data/train/train.cor
head -2000 ../liblinear/data/tmp/music.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/shop.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/novel.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/soft.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/fangchan.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/job.src.tmp.4svm.post >> data/train/train.cor        
head -2000 ../liblinear/data/tmp/wenda.src.tmp.4svm.post >> data/train/train.cor   
head -2000 ../liblinear/data/tmp/web.query.sort.100w.4svm.post >> data/train/train.cor     


cat data/train/train.cor  | sed -e "s/^[0-9]* /0 /" > data/train/train.cor.post
head -18000 ../liblinear/data/tmp/video.src.tmp.4svm.post | sed -e "s/^[0-9]* /1 /" >> data/train/train.cor.post

mv data/train/train.cor.post data/train/train.cor.video

## music
head -2000 ../liblinear/data/tmp/image.src.tmp.4svm.post > data/train/train.cor
head -2000 ../liblinear/data/tmp/video.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/shop.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/novel.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/soft.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/fangchan.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/job.src.tmp.4svm.post >> data/train/train.cor        
head -2000 ../liblinear/data/tmp/wenda.src.tmp.4svm.post >> data/train/train.cor   
head -2000 ../liblinear/data/tmp/web.query.sort.100w.4svm.post >> data/train/train.cor     


cat data/train/train.cor  | sed -e "s/^[0-9]* /0 /" > data/train/train.cor.post
head -18000 ../liblinear/data/tmp/music.src.tmp.4svm.post | sed -e "s/^[0-9]* /1 /" >> data/train/train.cor.post

mv data/train/train.cor.post data/train/train.cor.music

## shop
head -2000 ../liblinear/data/tmp/image.src.tmp.4svm.post > data/train/train.cor
head -2000 ../liblinear/data/tmp/video.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/music.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/novel.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/soft.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/fangchan.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/job.src.tmp.4svm.post >> data/train/train.cor        
head -2000 ../liblinear/data/tmp/wenda.src.tmp.4svm.post >> data/train/train.cor   
head -2000 ../liblinear/data/tmp/web.query.sort.100w.4svm.post >> data/train/train.cor     


cat data/train/train.cor  | sed -e "s/^[0-9]* /0 /" > data/train/train.cor.post
head -18000 ../liblinear/data/tmp/shop.src.tmp.4svm.post | sed -e "s/^[0-9]* /1 /" >> data/train/train.cor.post

mv data/train/train.cor.post data/train/train.cor.shop

## novel
head -2000 ../liblinear/data/tmp/image.src.tmp.4svm.post > data/train/train.cor
head -2000 ../liblinear/data/tmp/video.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/music.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/shop.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/soft.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/fangchan.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/job.src.tmp.4svm.post >> data/train/train.cor        
head -2000 ../liblinear/data/tmp/wenda.src.tmp.4svm.post >> data/train/train.cor   
head -2000 ../liblinear/data/tmp/web.query.sort.100w.4svm.post >> data/train/train.cor     


cat data/train/train.cor  | sed -e "s/^[0-9]* /0 /" > data/train/train.cor.post
head -18000 ../liblinear/data/tmp/novel.src.tmp.4svm.post | sed -e "s/^[0-9]* /1 /" >> data/train/train.cor.post

mv data/train/train.cor.post data/train/train.cor.novel

## wenda
head -2000 ../liblinear/data/tmp/image.src.tmp.4svm.post > data/train/train.cor
head -2000 ../liblinear/data/tmp/video.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/music.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/shop.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/soft.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/fangchan.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/job.src.tmp.4svm.post >> data/train/train.cor        
head -2000 ../liblinear/data/tmp/novel.src.tmp.4svm.post >> data/train/train.cor   
head -2000 ../liblinear/data/tmp/web.query.sort.100w.4svm.post >> data/train/train.cor     


cat data/train/train.cor  | sed -e "s/^[0-9]* /0 /" > data/train/train.cor.post
head -18000 ../liblinear/data/tmp/wenda.src.tmp.4svm.post | sed -e "s/^[0-9]* /1 /" >> data/train/train.cor.post

mv data/train/train.cor.post data/train/train.cor.wenda

## web
head -2000 ../liblinear/data/tmp/image.src.tmp.4svm.post > data/train/train.cor
head -2000 ../liblinear/data/tmp/video.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/music.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/shop.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/soft.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/fangchan.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/job.src.tmp.4svm.post >> data/train/train.cor        
head -2000 ../liblinear/data/tmp/wenda.src.tmp.4svm.post >> data/train/train.cor   
head -2000 ../liblinear/data/tmp/novel.src.tmp.4svm.post >> data/train/train.cor     


cat data/train/train.cor  | sed -e "s/^[0-9]* /0 /" > data/train/train.cor.post
#head -18000 ../liblinear/data/tmp/web.query.sort.100w.4svm.post | sed -e "s/^[0-9]* /1 /" >> data/train/train.cor.post
head -18000 ../liblinear/data/tmp/web.query.sort.100w.4svm.post | sed -e "s/^[0-9]* /1 /" >> data/train/train.cor.post

mv data/train/train.cor.post data/train/train.cor.web

## soft
head -2000 ../liblinear/data/tmp/image.src.tmp.4svm.post > data/train/train.cor
head -2000 ../liblinear/data/tmp/video.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/music.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/shop.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/novel.src.tmp.4svm.post >> data/train/train.cor     
head -2000 ../liblinear/data/tmp/fangchan.src.tmp.4svm.post >> data/train/train.cor    
head -2000 ../liblinear/data/tmp/job.src.tmp.4svm.post >> data/train/train.cor        
head -2000 ../liblinear/data/tmp/wenda.src.tmp.4svm.post >> data/train/train.cor   
head -2000 ../liblinear/data/tmp/web.query.sort.100w.4svm.post >> data/train/train.cor     


cat data/train/train.cor  | sed -e "s/^[0-9]* /0 /" > data/train/train.cor.post
head -18000 ../liblinear/data/tmp/soft.src.tmp.4svm.post | sed -e "s/^[0-9]* /1 /" >> data/train/train.cor.post

mv data/train/train.cor.post data/train/train.cor.soft



