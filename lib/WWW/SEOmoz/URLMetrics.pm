package WWW::SEOmoz::URLMetrics;

use Moose;
use namespace::autoclean;

use Carp qw( croak );

has 'title' => (
    isa      => 'Str',
    is       => 'ro',
    required => 1,
);

has 'url' => (
    isa      => 'Str',
    is       => 'ro',
    required => 1,
);

has 'external_links' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

has 'links' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

has 'mozrank_raw' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

has 'mozrank' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

has 'subdomain_mozrank' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

has 'subdomain_mozrank_raw' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

has 'http_status_code' => (
    isa      => 'Int',
    is       => 'ro',
    required => 1,
);

has 'page_authority' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

has 'domain_authority' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

__PACKAGE__->meta->make_immutable;

sub new_from_data {
    my $class = shift;
    my $data  = shift || croak 'Requires a hash ref of data returned from the API';

    return $class->new({
        title                   => $data->{ut},
        url                     => $data->{uu},
        external_links          => $data->{ueid},
        links                   => $data->{uid},
        mozrank_raw             => $data->{umrp},
        mozrank                 => $data->{umrr},
        subdomain_mozrank       => $data->{fmrp},
        subdomain_mozrank_raw   => $data->{fmrr},
        http_status_code        => $data->{us},
        page_authority          => $data->{upa},
        domain_authority        => $data->{pda},
    });
}

1;
