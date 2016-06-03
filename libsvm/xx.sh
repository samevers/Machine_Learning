## web
echo "web ....."
cat data/train/train.cor.web | perl data/bin/cut.pl > data/train/train.cor.web.cut
./svm-train data/train/train.cor.web.cut 

cat data/test/test.cor.web | perl data/bin/cut.pl > data/test/test.cor.web.cut
./svm-predict data/test/test.cor.web.cut train.cor.web.cut.model tmp/out.web

