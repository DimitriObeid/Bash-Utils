#!/usr/bin/env perl

use strict;
use warnings;

# -----------------------------------------------

## EXIT CODES :

# 2 : The system cannot find the file specified.
$__BU_SML__NO_FILE_SPECIFIED = 2;

# 


# 10022 : An invalid argument was supplied.
$__BU_SML__INVALID_ARG = 10022;

# -----------------------------------------------

## VARIABLES

my ($file_extension) = $file =~ /(\.[^.]+)$/;
my $output_file = ""

# -----------------------------------------------

# ARGUMENTS :
#	- $arg_file_path	--> MANDATORY	: Path of the translations CSV file to process.
#	- $arg_target_col	--> MANDATORY	: Targeted language's column.
#	- $arg_output_file	--> MANDATORY	: Targeted output file for the translations.
#	- $arg_print		--> OPTIONAL	: Print the error messages or not (choose to not print these messages if you already process the exit codes in another program, like the Bash Utils framework).

my ($arg_file_path; $arg_target_col $arg_output_file $arg_print) = @ARGV;

# -----------------------------------------------

# If no file is passed to the "$arg_file_path" parameter.
if (-z $arg_file_path) {
	if (defined($arg_print)) { print "ERROR : No CSV file given as first argument for the SetModuleLang.pl Perl script\n"; }

	exit $__BU_SML__INVALID_ARG;
}

# If a path is passed as first argument, but it's a directory path.
elsif (-f $arg_file_path) && (-d $arg_file_path) {
	if (defined($arg_print)) { print "ERROR : The path passed as first argument for the SetModuleLang.pl Perl script is a directory path, and not a CSV file path\n"; }

	exit ;
}

# If the filepath passed as first argument is a file, but not a CSV formatted file.
elsif (-f $arg_file_path) && ($file_extension != 'csv') {
	if (defined($arg_print)) { print "ERROR :  \n"; }

	exit ;
}

# If the column's index is not passed as second argument.
elsif (-z $arg_target_col) {
	if (defined($arg_print)) { print "ERROR :  \n"; }

	exit ;
}

# If the column's index passed as second argument is not an integer.
elsif (-n $arg_target_col) && ( ! $arg_target_col =~ /^[+-]?\d+$/ ) {
	if (defined($arg_print)) { print "ERROR :  \n"; }

	exit ;
}

open(FH, '>', "$arg_file_path") or die $!;

while (<FH>) {
	
}

# If the CSV file cannot be read by the Perl script.
# open FILE, "<", $arg_file_path or die "$!:$arg_file_path";

# The output file cannot be created by the Perl script.
# if (-e "$arg_output_file") {
	
# }
#}

close(FH);