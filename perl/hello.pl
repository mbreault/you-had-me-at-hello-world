#! /usr/bin/perl

# 1. HTTP GET example.com
# 2. Regex title out of HTML
# 3. Reverse string
# 4. Write to a text file.

use strict;
use LWP::Simple;

# 1. HTTP GET example.com
my $response = get("http://example.com");

# 2. Regex title out of HTML
$response =~ m|<title>(.*)</title>|;
my $title = $1;

# 3. Reverse string
$title = reverse($title);

# 4. Write to a text file.
my $filename = 'output.txt';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh $title;
close $fh;
