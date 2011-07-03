# ABSTRACT: Class to represent the URL metrics returned from the SEOmoz API.
package WWW::SEOmoz::URLMetrics;

use Moose;
use namespace::autoclean;

use Carp qw( croak );

=head1 DESCRIPTION

Class to represent the URL metrics data returned from the 'url-metrics' method
in the SEOmoz API.

=head1 ATTRIBUTES

=head2 title

=cut

has 'title' => (
    isa      => 'Str',
    is       => 'ro',
    required => 1,
);

=head2 url

=cut

has 'url' => (
    isa      => 'Str',
    is       => 'ro',
    required => 1,
);

=head2 external_links

=cut

has 'external_links' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

=head2 links

=cut

has 'links' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

=head2 mozrank

=cut

has 'mozrank' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

=head2 mozrank_raw

=cut

has 'mozrank_raw' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

=head2 subdomain_mozrank

=cut

has 'subdomain_mozrank' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

=head2 subdomain_mozrank_raw

=cut

has 'subdomain_mozrank_raw' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

=head2 http_status_code

=cut

has 'http_status_code' => (
    isa      => 'Int',
    is       => 'ro',
    required => 1,
);

=head2 page_authority

=cut

has 'page_authority' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

=head2 domain_authority

=cut

has 'domain_authority' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

__PACKAGE__->meta->make_immutable;

=head1 METHODS

=head2 new_from_data

    my $metrics = WWW::SEOmoz::URLMetrics->( $data );

Returns a new L<WWW::SEOmoz::URLMetrics> object from the data returned from the API
call.

=cut

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

=head1 SEE ALSO

L<WWW::SEOmoz>

=cut

1;
