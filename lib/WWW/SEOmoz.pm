package WWW::SEOmoz;

use Moose;
use LWP::UserAgent;
use DateTime;
use URI::Escape;
use Digest::SHA qw( hmac_sha1_base64 );

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

    return $API_BASE . 'linkscape/';
}

sub _generate_authentication {
    my $self = shift;

    my $epoch = DateTime->now->add( seconds => 60 )->epoch; # A bit in the future
    my $sig = hmac_sha1_base64(
        $self->access_id . "\n" . $epoch, $self->secret_key
    );

    # Pad the base_64 encoding, if required
    while (length($sig) % 4) {
        $sig .= '=';
    }

    $sig = uri_escape( $sig );

    warn $sig;

    return '?AccessID='.$self->access_id.'&Expires='.$epoch.'&Signature='.$sig;
}

sub url_metrics {
    my $self = shift;
    my ( $url ) = @_;

    my $api_call = $self->api_url
        . 'url-metrics/'
        . uri_escape($url)
        . $self->_generate_authentication;

    my $res = $self->ua->get( $api_call );

    warn pp $res->content;

    if ( $res->is_success ) {
        return $res->content;
    }
}

1;
