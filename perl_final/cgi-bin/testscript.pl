#!/usr/bin/perl
use DBI;
use CGI qw(:standard);
use DBD::mysql;

my $dbh = DBI->connect ("DBI:mysql:database=school;host=localhost", "root", "password") or die ("Couldn't make connection to database: $DBI::errstr");

my $sth = $dbh->prepare (q { SELECT * FROM tblclasses} ) or die ("Cannot prepare statement: ", $dbh->errstr(), "\n");

$sth->execute() or die ("Cannot execute statement: ", $sth->errstr(), "\n");

my @array;

print "ID Name       State\n";
while (@array = $sth->fetchrow_array() ) 
{
   printf "%2d %-10s %2s\n", @array;
}

$dbh->disconnect();
$sth->finish();
