#!/usr/bin/perl

use Roman;
use IO::File;
use 5.016;
use feature 'unicode_strings';
use RTF::TEXT::Converter;
#use open IN  => ":encoding(utf8)", OUT => ":encoding(utf8)";

my ($arg1, $arg2, $arg3) = @ARGV;

our $fichier = IO::File->new( "$arg1", '<' )
  or die "ne peut ouvrir '$fichier' : $!\n";
our $fichierout = IO::File->new( "$arg3", '>' )
  or die "ne peut ouvrir '$fichierout' : $!\n";
  
while ( defined (my $line = $fichier->getline )) {
	my $ligne;
	my $object = RTF::TEXT::Converter->new(
                output => \$ligne
	);
	$object->parse_string( $line );
	$ligne =~ s/\&#201;/É/g;
	$ligne =~ s/\&#224;/à/g;
	$ligne =~ s/\&#226;/â/g;
	$ligne =~ s/\&#231;/ç/g;
	$ligne =~ s/\&#232;/è/g;
  $ligne =~ s/\&#233;/é/g;
  $ligne =~ s/\&#234;/ê/g;
  $ligne =~ s/\&#235;/ë/g;
  $ligne =~ s/\&#238;/î/g;
  $ligne =~ s/\&#239;/ï/g;
  $ligne =~ s/\&#244;/ô/g;
  $ligne =~ s/\&#249;/ù/g;
  $ligne =~ s/\&#251;/û/g;
  $ligne =~ s/\&#252;/ü/g;
  given($ligne) {
    when( /^\D*\s(\d*),(\d*)\.(.*$)/ ) {
      my $titre  = $arg2;
      my $sep	= "v";
      my $roman1 = Roman($1);
      my $roman2 = Roman($2);
	  my $langue = "fr";
      my $reste  = $3;
      $fichierout->say("\\newcommand\{\\$titre$roman1$sep$roman2$langue\}\{\\VERSE $3 \\EVERSE}");
    }
    default {
	#$fichierout->print($ligne);
	}
  }
}

#our $fichier2 = IO::File->new( "$arg3", '> :encoding(utf-8)' )
#  or die "ne peut ouvrir '$fichier2' : $!\n";
  
#while ( defined (my $line = $fichier2->getline )) {
#		my $line =~ s/&/\&/g;
#}