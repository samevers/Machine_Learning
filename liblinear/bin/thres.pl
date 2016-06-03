#!/usr/bin/perl

my $outfile = $ARGV[0];
my $thres = $ARGV[1];
my $queryfile = $ARGV[2];
my $vrtype = $ARGV[3];

open(out, $outfile) || die "[ERROR] Fail to open file $outfile\n";
open(que, $queryfile) || die "[ERROR] Fail to open file $queryfile\n";

my $total_1 = 0;
my $total_0 = 0;
my %positive = ();
my %negtive = ();
while(my $line = <out>)
{
		chomp $line;
		my $q = <que>;
		chomp $q;
		
		if($line > $thres)
		{
			if($q =~ /extend = (.*?):/) 
			{
				my $query = $1;
				if($vrtype eq "image" and ($q =~ /怎么|怎样|什么|多少|怎麽|价格|报价|降价|招聘|阅读|播放|音乐|下载|中文版|英文版|绿色|网|ｑｑ|贴吧|ｗｗｗ|ｃｏｍ|扣扣|口口|抠抠|蔻蔻|医院|学院|学校|公司/ or $query =~ /视频/))
				{
					next;
				}
				print $query."\n";
			}
		}
}
close out;
close que;
