# ABSTRACT: Class to represent the links returned from the SEOmoz API
package WWW::SEOmoz::Links;

use Moose;
use namespace::autoclean;

use Carp qw( croak );

use WWW::SEOmoz::Link;

# VERSION

=head1 DESCRIPTION

Class to hold the links returned from the 'links' method in the SEOmoz API.

=head1 ATTRIBUTES

=head2 links

ArrayRef of L<WWW::SEOmoz::Link> objects that were returned from the API.

=cut

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

=head1 METHODS

=head2 new_from_data

    my $links = WWW::SEOmoz::Links->( $data );

Returns a new L<WWW::SEOmoz::Links> object from the data returned from the API call.

=head2 all_links

    warn $links->all_links;

Returns all the links returned from the API.

=head2 number_of_links

    $links->number_of_links;

Returns a count of the number of links returned from the API.

=cut

sub new_from_data {
    my $class = shift;
    my $data  = shift || croak 'Requires an array ref of data from the API';

    my $self = $class->new;
    foreach ( @{$data} ) {
        $self->add_link( WWW::SEOmoz::Link->new_from_data( $_ ) );
    }

    return $self;
}

=head1 SEE ALSO

L<WWW::SEOmoz>

=cut

1;
