# ABSTRACT: Class to represent the URL metrics returned from the SEOmoz API.
package WWW::SEOmoz::URLMetrics;

use Moose;
use namespace::autoclean;

use Carp qw( croak );

# VERSION

=head1 DESCRIPTION

Class to represent the URL metrics data returned from the 'url-metrics' method
in the SEOmoz API.

=head1 ATTRIBUTES

=head2 title

=cut

has 'title' => (
    isa      => 'Str|Undef',
    is       => 'ro',
);

=head2 url

=cut

has 'url' => (
    isa      => 'Str|Undef',
    is       => 'ro',
);

=head2 external_links

=cut

has 'external_links' => (
    isa      => 'Num|Undef',
    is       => 'ro',
);

=head2 links

=cut

has 'links' => (
    isa      => 'Num|Undef',
    is       => 'ro',
);

=head2 mozrank

=cut

has 'mozrank' => (
    isa      => 'Num|Undef',
    is       => 'ro',
);

=head2 mozrank_raw

=cut

has 'mozrank_raw' => (
    isa      => 'Num|Undef',
    is       => 'ro',
);

=head2 subdomain_mozrank

=cut

has 'subdomain_mozrank' => (
    isa      => 'Num|Undef',
    is       => 'ro',
);

=head2 subdomain_mozrank_raw

=cut

has 'subdomain_mozrank_raw' => (
    isa      => 'Num|Undef',
    is       => 'ro',
);

=head2 http_status_code

=cut

has 'http_status_code' => (
    isa      => 'Int|Undef',
    is       => 'ro',
);

=head2 page_authority

=cut

has 'page_authority' => (
    isa      => 'Num|Undef',
    is       => 'ro',
);

=head2 domain_authority

=cut

has 'domain_authority' => (
    isa      => 'Num|Undef',
    is       => 'ro',
);

=head2 subdomain

=cut

has 'subdomain' => (
    isa     => 'Str|Undef',
    is      => 'ro',
);

=head2 rootdomain

=cut

has 'rootdomain' => (
    isa     => 'Str|Undef',
    is      => 'ro',
);

=head2 subdomain_external_links

=cut

has 'subdomain_external_links' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 rootdomain_external_links

=cut

has 'rootdomain_external_links' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 juicepassing_links

=cut

has 'juicepassing_links' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 subdomain_linking

=cut

has 'subdomain_linking' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 rootdomain_linking

=cut

has 'rootdomain_linking' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 subdomain_subdomains_linking

=cut

has 'subdomain_subdomains_linking' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 rootdomain_rootdomains_linking

=cut

has 'rootdomain_rootdomains_linking' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 rootdomain_mozrank

=cut

has 'rootdomain_mozrank' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 rootdomain_mozrank_raw

=cut

has 'rootdomain_mozrank_raw' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 moztrust

=cut

has 'moztrust' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 moztrust_raw

=cut

has 'moztrust_raw' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 subdomain_moztrust

=cut

has 'subdomain_moztrust' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 subdomain_moztrust_raw

=cut

has 'subdomain_moztrust_raw' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 rootdomain_moztrust

=cut

has 'rootdomain_moztrust' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 rootdomain_moztrust_raw

=cut

has 'rootdomain_moztrust_raw' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 external_mozrank

=cut

has 'external_mozrank' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 external_mozrank_raw

=cut

has 'external_mozrank_raw' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 subdomain_external_juice

=cut

has 'subdomain_external_juice' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 subdomain_external_juice_raw

=cut

has 'subdomain_external_juice_raw' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 rootdomain_external_juice

=cut

has 'rootdomain_external_juice' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 rootdomain_external_juice_raw

=cut
has 'rootdomain_external_juice_raw' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 subdomain_juice

=cut

has 'subdomain_juice' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 subdomain_juice_raw

=cut

has 'subdomain_juice_raw' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 rootdomain_juice

=cut

has 'rootdomain_juice' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 rootdomain_juice_raw

=cut

has 'rootdomain_juice_raw' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 links_subdomain

=cut

has 'links_subdomain' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 links_rootdomain

=cut

has 'links_rootdomain' => (
    isa     => 'Num|Undef',
    is      => 'ro',
);

=head2 rootdomains_links_subdomain

=cut

has 'rootdomains_links_subdomain' => (
    isa     => 'Num|Undef',
    is      => 'ro',
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
        mozrank_raw             => $data->{umrr},
        mozrank                 => $data->{umrp},
        subdomain_mozrank       => $data->{fmrp},
        subdomain_mozrank_raw   => $data->{fmrr},
        http_status_code        => $data->{us},
        page_authority          => $data->{upa},
        domain_authority        => $data->{pda},

        ## NON-FREE API VALUES
        subdomain                       => $data->{ufq},
        rootdomain                      => $data->{upl},
        subdomain_external_links        => $data->{feid},
        rootdomain_external_links       => $data->{peid},
        juicepassing_links              => $data->{ujid},
        subdomain_linking               => $data->{uifq},
        rootdomain_linking              => $data->{uipl},
        subdomain_subdomains_linking    => $data->{fid},
        rootdomain_rootdomains_linking  => $data->{pid},
        rootdomain_mozrank              => $data->{pmrp},
        rootdomain_mozrank_raw          => $data->{pmrr},
        moztrust                        => $data->{utrp},
        moztrust_raw                    => $data->{utrr},
        subdomain_moztrust              => $data->{ftrp},
        subdomain_moztrust_raw          => $data->{ftrr},
        rootdomain_moztrust             => $data->{ptrp},
        rootdomain_moztrust_raw         => $data->{ptrr},
        external_mozrank                => $data->{uemrp},
        external_mozrank_raw            => $data->{uemrr},
        subdomain_external_juice        => $data->{uemrp},
        subdomain_external_juice_raw    => $data->{uemrr},
        rootdomain_external_juice       => $data->{pejp},
        rootdomain_external_juice_raw   => $data->{pejr},
        subdomain_juice                 => $data->{fjp},
        subdomain_juice_raw             => $data->{fjr},
        rootdomain_juice                => $data->{pjp},
        rootdomain_juice_raw            => $data->{pjr},
        links_subdomain                 => $data->{fuid},
        links_rootdomain                => $data->{puid},
        rootdomains_links_subdomain     => $data->{fipl},
    });
}

=head1 SEE ALSO

L<WWW::SEOmoz>

=cut

1;
