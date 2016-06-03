#!/bin/bash



echo "¡¾image¡¿"
./train ../libsvm/data/train/train.cor.image.cut
./predict ../libsvm/data/test/test.cor.image.cut train.cor.image.cut.model tmp/out.image

echo "¡¾video¡¿"
./train ../libsvm/data/train/train.cor.video.cut
./predict ../libsvm/data/test/test.cor.video.cut  train.cor.video.cut.model tmp/out.video


echo "¡¾music¡¿"
./train ../libsvm/data/train/train.cor.music.cut
./predict ../libsvm/data/test/test.cor.music.cut  train.cor.music.cut.model tmp/out.music


echo "¡¾novel¡¿"
./train ../libsvm/data/train/train.cor.novel.cut
./predict ../libsvm/data/test/test.cor.novel.cut  train.cor.novel.cut.model tmp/out.novel


echo "¡¾shop¡¿"
./train ../libsvm/data/train/train.cor.shop.cut
./predict ../libsvm/data/test/test.cor.shop.cut  train.cor.shop.cut.model tmp/out.shop


echo "¡¾soft¡¿"
./train ../libsvm/data/train/train.cor.soft.cut
./predict ../libsvm/data/test/test.cor.soft.cut  train.cor.soft.cut.model tmp/out.soft


echo "¡¾wenda¡¿"
./train ../libsvm/data/train/train.cor.wenda.cut
./predict ../libsvm/data/test/test.cor.wenda.cut  train.cor.wenda.cut.model tmp/out.wenda


echo "¡¾web¡¿"
./train ../libsvm/data/train/train.cor.web.cut
./predict ../libsvm/data/test/test.cor.web.cut  train.cor.web.cut.model tmp/out.web

