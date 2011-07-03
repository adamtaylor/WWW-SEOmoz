package WWW::SEOmoz::Links;

use Moose;
use namespace::autoclean;

use Carp qw( croak );

use WWW::SEOmoz::Link;

has 'links' => (
    isa         => 'ArrayRef[WWW::SEOmoz::Link]',
    is          => 'rw',
    required    => 1,
    default     => sub { [] },
    traits      => ['Array'],
    handles     => {
        add_link        => 'push',
        all_links       => 'elements',
        number_of_links => 'count',
    },

);

__PACKAGE__->meta->make_immutable;

sub new_from_data {
    my $class = shift;
    my $data  = shift || croak 'Requires an array ref of data from the API';

    my $self = $class->new;
    foreach ( @{$data} ) {
        $self->add_link( WWW::SEOmoz::Link->new_from_data( $_ ) );
    }

    return $self;
}

1;
