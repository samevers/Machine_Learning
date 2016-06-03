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
		if($line =~ /怎么|怎样|哪些|多少|吗|什么|神马|什麽/) # 图片和问答类互斥
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
