package WWW::SEOmoz;

use strict;
use warnings;

use Moose;

has access_id => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has secret_key => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has ua => (
    is => 'ro',
    isa => 'LWP::UserAgent',
    lazy_build => 1,
);

sub _build_ua {
    my $self = shift;

    return LWP::UserAgent->new;
}

1;
