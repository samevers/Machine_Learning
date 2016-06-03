#!/usr/bin/perl
#
#
while(my $line = <>)
{
	chomp $line;
	my @arr = split /\s+/,$line;
	foreach my $chunk(@arr)
	{
		if($chunk =~ /novel/)
		{
			next;
		}else
		{
			print $chunk." ";
		}
	}
	print "\n";
}
