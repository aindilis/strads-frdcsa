#!/usr/bin/perl -w

use BOSS::Config;
use PerlLib::SwissArmyKnife;

$specification = q(
	-d		Debug on
	-s		Security on
);

my $config =
  BOSS::Config->new
  (Spec => $specification);
my $conf = $config->CLIConfig;
# $UNIVERSAL::systemdir = "/var/lib/myfrdcsa/codebases/minor/system";

my ($debug,$security) = ('off','off');

if (exists $conf->{'-d'}) { $debug = 'on' }
if (exists $conf->{'-s'}) { $security = 'on' }

my $command = "swipl -s strads.pl -g 'start([flag(debug,$debug),flag(security,$security)]),halt'";
print "$command\n";
system $command;
