# ABSTRACT: Class to represent a link returned from the SEOmoz API.
package WWW::SEOmoz::Link;

use Moose;
use namespace::autoclean;

use Carp qw( croak );

# VERSION

=head1 DESCRIPTION

Class to represent an individual link returned from the 'links' method in the
SEOmoz API.

=head1 ATTRIBUTES

=head2 target_url

=cut

has 'target_url' => (
    isa         => 'Str',
    is          => 'ro',
    required    => 1,
);

=head2 source_url

=cut

has 'source_url' => (
    isa         => 'Str',
    is          => 'ro',
    required    => 1,
);

=head2 link_id

=cut

has 'link_id' => (
    isa         => 'Int',
    is          => 'ro',
    required    => 1,
);

=head2 source_url_id

=cut

has 'source_url_id' => (
    isa         => 'Int',
    is          => 'ro',
    required    => 1,
);

=head2 target_url_id

=cut

has 'target_url_id' => (
    isa         => 'Int',
    is          => 'ro',
    required    => 1,
);

__PACKAGE__->meta->make_immutable;

=head1 METHODS

=head2 new_from_data

    my $link = WWW::SEOmoz::Link->( $data );

Returns a new L<WWW::SEOmoz::Link> object from the data returned from the API call.

=cut

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

=head1 SEE ALSO

L<WWW::SEOmoz>
L<WWW::SEOmoz::Links>

=cut

1;
