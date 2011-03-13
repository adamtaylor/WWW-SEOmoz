package WWW::SEOmoz;

use Moose;
use LWP::UserAgent;
use DateTime;
use URI::Escape;
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

has api_url => (
    is  => 'ro',
    isa => 'Str',
    lazy_build => 1,
);

has ua => (
    is  => 'ro',
    isa => 'LWP::UserAgent',
    lazy_build => 1,
);

my $API_BASE = 'http://lsapi.seomoz.com/';

sub _build_ua {
    my $self = shift;

    return LWP::UserAgent->new;
}

sub _build_api_url {
    my $self = shift;

    return $API_BASE . 'linkscape';
}

sub _generate_authentication {
    my $self = shift;

    my $epoch = DateTime->now->add( seconds => 30 )->epoch; # A bit in the future
    my $sig = uri_escape(hmac_sha1_base64(
        $self->access_id . "\n" . $epoch, $self->secret_key
    ));
    return 'AccessID='.$self->access_id.'&Expires='.$epoch.'&Signature='.$sig;
}

1;
