#!/usr/bin/perl

$file = shift @ARGV;

$count=1;
open(FH, "$file");
while(<FH>) {
    my $line = $_;
    if ($line =~ /\s*STAGE\d+\s+/) {
	my $num = sprintf("%02d", $count);
	$count++;
	$line =~ s/STAGE\d+/STAGE$num/;
	print "$line";
    } else {
	print "$line";
    }
}
close(FH);
exit(0);
