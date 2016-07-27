#!/usr/bin/perl

if ($#ARGV != 0) {
	print "Usage: $0 <search term>";
	exit;
}

my $term = $ARGV[0];
my @matches = `git branch | grep $term | cut -c3-`;
die "No matches" if $#matches == -1;

for my $i (0 .. $#matches) {
	print "$i @matches[$i]";
}
print ">>> ";

my $choice = <STDIN>;
chomp $choice;
my $branch = @matches[$choice];
exec "git checkout $branch" if $branch;
