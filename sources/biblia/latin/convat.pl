#!/usr/bin/perl

use Roman;
use IO::File;
use 5.016;
use feature 'unicode_strings';

my ($arg1, $arg2, $arg3) = @ARGV;

our $fichier = IO::File->new( "$arg1", '< :crlf :encoding(cp1252)' )
  or die "ne peut ouvrir '$fichier' : $!\n";
our $fichierout = IO::File->new( "$arg3", '> :encoding(utf-8)' )
  or die "ne peut ouvrir '$fichier' : $!\n";

while ( defined (my $ligne = $fichier->getline )) {
  $ligne =~ s/\///g;
  $ligne =~ s/\\//g;
  $ligne =~ s/\[//g;
  $ligne =~ s/\]//g;
  given($ligne) {
    when( /(\d*):(\d*)(.*$)/ ) {
      my $titre  = $arg2;
      my $sep	= "v";
      my $roman1 = Roman($1);
      my $roman2 = Roman($2);
      my $reste  = $3;
      $fichierout->say("\\newcommand\{\\$titre$roman1$sep$roman2\}\{\\VERSE $3 \\EVERSE}");
    }
    default {
	#$fichierout->print($ligne);
	}
  }
}
