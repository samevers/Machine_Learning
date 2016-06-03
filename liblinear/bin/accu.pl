#!/usr/bin/perl
#
my $tagfile = $ARGV[0];
my $outfile = $ARGV[1];
my $thres = $ARGV[2];

open(tag, $tagfile) || die "[ERROR] Fail to open file $tagfile\n";
open(out, $outfile) || die "[ERROR] Fail to open file $outfile\n";

my $total_1 = 0;
my $total_0 = 0;
my %positive = ();
my %negtive = ();
while(my $line = <out>)
{
		chomp $line;
		my $tagline = <tag>;
		chomp $tagline;

		if( $tagline =~ /^1/)
		{
			$total_1++;
			if($line > $thres )
			{
					$positive{"1"} ++;
			}elsif($line < $thres )
			{
					$negtive{"1"} ++;
			}
		}

		if( $tagline =~ /^0/)
		{
			$total_0++;
			if($line < $thres )
			{
					$positive{"0"}++;
			}elsif($line > $thres )
			{
					$negtive{"0"}++;
			}
		}
}
print "Thres = ".$thres."\n";
my $pos_total = $positive{"1"} + $positive{"0"};
my $total_tag1 = $positive{"1"} + $negtive{"0"};
print "recall num = ".$positive{"1"}."\n";
print "Accu = ".$positive{"1"}/$total_tag1."\n";
print "Recall = ".$positive{"1"}/$total_1."\n";

#print "Accu of 1' = ".$positive{"1"}/$total_1."\n";
#print "Accu of 0' = ".$positive{"0"}/$total_0."\n";

