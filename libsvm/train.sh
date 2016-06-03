#!/bin/bash

## image
echo "image ....."
cat data/train/train.cor.image | perl data/bin/cut.pl > data/train/train.cor.image.cut
./svm-train data/train/train.cor.image.cut 

cat data/test/test.cor.image | perl data/bin/cut.pl > data/test/test.cor.image.cut
./svm-predict data/test/test.cor.image.cut train.cor.image.cut.model tmp/out.image

## video
echo "video ....."
cat data/train/train.cor.video | perl data/bin/cut.pl > data/train/train.cor.video.cut
./svm-train data/train/train.cor.video.cut 

cat data/test/test.cor.video | perl data/bin/cut.pl > data/test/test.cor.video.cut
./svm-predict data/test/test.cor.video.cut train.cor.video.cut.model tmp/out.video

## music
echo "music ....."
cat data/train/train.cor.music| perl data/bin/cut.pl > data/train/train.cor.music.cut
./svm-train data/train/train.cor.music.cut 

cat data/test/test.cor.music | perl data/bin/cut.pl > data/test/test.cor.music.cut
./svm-predict data/test/test.cor.music.cut train.cor.music.cut.model tmp/out.music

## shop
echo "shop ....."
cat data/train/train.cor.shop | perl data/bin/cut.pl > data/train/train.cor.shop.cut
./svm-train data/train/train.cor.shop.cut 

cat data/test/test.cor.shop | perl data/bin/cut.pl > data/test/test.cor.shop.cut
./svm-predict data/test/test.cor.shop.cut train.cor.shop.cut.model tmp/out.shop

## novel
echo "novel ....."
cat data/train/train.cor.novel | perl data/bin/cut.pl > data/train/train.cor.novel.cut
./svm-train data/train/train.cor.novel.cut 

cat data/test/test.cor.novel | perl data/bin/cut.pl > data/test/test.cor.novel.cut
./svm-predict data/test/test.cor.novel.cut train.cor.novel.cut.model tmp/out.novel

## soft
echo "soft ....."
cat data/train/train.cor.soft | perl data/bin/cut.pl > data/train/train.cor.soft.cut
./svm-train data/train/train.cor.soft.cut 

cat data/test/test.cor.soft | perl data/bin/cut.pl > data/test/test.cor.soft.cut
./svm-predict data/test/test.cor.soft.cut train.cor.soft.cut.model tmp/out.soft

## wenda
echo "wenda ....."
cat data/train/train.cor.wenda | perl data/bin/cut.pl > data/train/train.cor.wenda.cut
./svm-train data/train/train.cor.wenda.cut 

cat data/test/test.cor.wenda | perl data/bin/cut.pl > data/test/test.cor.wenda.cut
./svm-predict data/test/test.cor.wenda.cut train.cor.wenda.cut.model tmp/out.wenda

## web
echo "web ....."
cat data/train/train.cor.web | perl data/bin/cut.pl > data/train/train.cor.web.cut
./svm-train data/train/train.cor.web.cut 

cat data/test/test.cor.web | perl data/bin/cut.pl > data/test/test.cor.web.cut
./svm-predict data/test/test.cor.web.cut train.cor.web.cut.model tmp/out.web

