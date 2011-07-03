package WWW::SEOmoz::Link;

use Moose;
use namespace::autoclean;

use Carp qw( croak );

has 'target_url' => (
    isa         => 'Str',
    is          => 'ro',
    required    => 1,
);

has 'source_url' => (
    isa         => 'Str',
    is          => 'ro',
    required    => 1,
);

has 'link_id' => (
    isa         => 'Int',
    is          => 'ro',
    required    => 1,
);

has 'source_url_id' => (
    isa         => 'Int',
    is          => 'ro',
    required    => 1,
);

has 'target_url_id' => (
    isa         => 'Int',
    is          => 'ro',
    required    => 1,
);

__PACKAGE__->meta->make_immutable;

sub new_from_data {
    my $class = shift;
    my $data  = shift || croak 'Requires a hash ref of data returned from the API';

    return $class->new({
        target_url      => $data->{luuu},
        source_url      => $data->{uu},
        link_id         => $data->{lrid},
        source_url_id   => $data->{lsrc},
        target_url_id   => $data->{ltgt},
    });
}

1;
