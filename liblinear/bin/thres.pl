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
				if($vrtype eq "image" and ($q =~ /��ô|����|ʲô|����|����|�۸�|����|����|��Ƹ|�Ķ�|����|����|����|���İ�|Ӣ�İ�|��ɫ|��|���|����|������|����|�ۿ�|�ڿ�|�ٿ�|ޢޢ|ҽԺ|ѧԺ|ѧУ|��˾/ or $query =~ /��Ƶ/))
				{
					next;
				}
				print $query."\n";
			}
		}
}
close out;
close que;
