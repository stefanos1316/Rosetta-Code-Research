package SampleObject;

use strict;
use warnings;

sub new {
    my ($class, %args) = @_;
    return bless { %args }, $class;
}

sub sample_method {
    my ($self) = @_;
}

	my $obj = SampleObject->new( sample_data => 'Variable value is ', more_data   => "1\n" );

	for( $a=0; $a < 1000000000; $a = $a + 1) {
		$obj->sample_method();
	}

