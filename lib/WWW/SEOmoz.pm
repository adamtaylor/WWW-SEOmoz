package WWW::SEOmoz;

use Moose;
use LWP::UserAgent;
use DateTime;
use Digest::SHA qw( hmac_sha1 );

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
    is  => 'ro',
    isa => 'LWP::UserAgent',
    lazy_build => 1,
);

sub _build_ua {
    my $self = shift;

    return LWP::UserAgent->new;
}

sub _generate_authentication {
    my $self = shift;

    my $epoch = DateTime->now->add( seconds => 30 )->epoch;

    return 'AccessID='.$self->access_id.'&Expires='.localtime
}

1;
