#!/usr/bin/perl
#
#
my $queryfile = $ARGV[0];
open(finquery, $queryfile)|| die "[ERROR] Fail to open file $queryfile\n";
my $outfile = $ARGV[1];
open(finout, $outfile)|| die "[ERROR] Fail to open file $outfile\n";

my $thres = $ARGV[2];
my $vrtype = $ARGV[3];

while(my $line = <finquery>)
{
	chomp $line;
	if($vrtype eq "image")
	{
		if($line =~ /��ô|����|��Щ|����|��|ʲô|����|ʲ��/) # ͼƬ���ʴ��໥��
		{
			next;
		}
	}
	my $score = <finout>;
	chomp $score;
	if($score > $thres)
	{
		print $line."\t".$score."\n";
	}
}
close finquery;
close finout;
