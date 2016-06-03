/*************************************************
 *
 * Author: 
 * Create time: 2015  5�� 04 23ʱ49��11��
 * E-Mail: @sogou-inc.com
 * version 1.0
 *
*************************************************/

#include <regex.h>
#include <boost/regex.hpp>
#include "include/gary_common/gary_string.h"
#include "word_gram.h"
using namespace naive_bayes_;



int main(int argc, char** argv)
{
	cerr << "argc = " << argc << endl;
	if(argc == 3)
	{
		string filename = argv[1];
		string model_file = argv[2];
		word_gram wd;
		wd.init();
		wd.load_wordDist_model(model_file);
		wd.predict_wordDist(filename.c_str(), model_file);
		wd.release();
		return 0;
	}else if(argc == 2)
	{

		InitRexPattern();
		string train_file = argv[1];
		word_gram wd;
		cerr << "begin to init()" << endl;
		wd.init();
		cerr << "end init()" << endl;
		wd.train_word_gram(train_file);
		wd.release();

		return 0;
	}
}
