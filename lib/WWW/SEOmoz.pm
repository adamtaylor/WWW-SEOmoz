package WWW::SEOmoz;

use Moose;
use namespace::autoclean;

use LWP::UserAgent;
use DateTime;
use URI::Escape;
use JSON;
use Carp        qw( croak );
use Digest::SHA qw( hmac_sha1_base64 );
use Data::Dump  qw( pp );

use WWW::SEOmoz::URLMetrics;

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

__PACKAGE__->meta->make_immutable;

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

    return '?AccessID='.$self->access_id.'&Expires='.$epoch.'&Signature='.$sig;
}

sub _make_api_call {
    my $self = shift;
    my $url  = shift || croak 'API URL required';

    my $res = $self->ua->get( $url );

    if ( $res->is_success ) {
        return from_json $res->content;
    }

    croak $res->content;

}

sub url_metrics {
    my $self = shift;
    my $url  = shift || croak 'URL required';

    my $api_url = $self->api_url
        . 'url-metrics/'
        . uri_escape($url)
        . $self->_generate_authentication;

    my $url_metrics = WWW::SEOmoz::URLMetrics->new_from_data(
        $self->_make_api_call( $api_url )
    );

    warn pp $url_metrics;

    return $url_metrics;
}

sub links {
    my $self = shift;
    my $url  = shift || croak 'URL required';

    my $api_url = $self->api_url
        . 'links/'
        . uri_escape($url)
        . $self->_generate_authentication
        .'&SourceCols=4&TargetCols=4&Scope=page_to_page&Sort=page_authority&Limit=1';

    my $data = $self->_make_api_call( $api_url );

    warn pp $data;

}

1;
