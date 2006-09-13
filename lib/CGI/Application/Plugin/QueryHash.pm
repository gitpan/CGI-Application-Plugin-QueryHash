package CGI::Application::Plugin::QueryHash;

# Required inclusions
use strict;
use warnings;
use base qw( Exporter );

# Export our methods
our @EXPORT = qw(
    query_hash
    );

# Version number.
our $VERSION = '1.00';

# Returns query parameters as a hash(ref).
sub query_hash {
    my $self = shift;
    my $q = $self->query();

    my %hash;
    foreach my $param ($q->param()) {
        my @val = $q->param( $param );
        if (scalar(@val) > 1) {
            $hash{$param} = \@val;
        }
        else {
            $hash{$param} = $val[0];
        }
    }
    return wantarray ? %hash : \%hash;
}

1;

=head1 NAME

CGI::Application::Plugin::QueryHash - Get back query params as hash(ref)

=head1 SYNOPSIS

  use CGI::Application::Plugin::QueryHash;

  # get query params as hash
  %params = $self->query_hash();

  # get query params as hash-ref
  $params = $self->query_hash();

=head1 DESCRIPTION

C<CGI::Application::Plugin::QueryHash> helps make it easier to get access to
the CGI query parameters as a hash, as opposed to having to query each
parameter directly.

=head1 METHODS

=over

=item C<query_hash()>

Returns to the caller the CGI query parameters as a hash/hash-ref, depending on
whether called in a list or scalar context.  Repeating form parameters are
handled by turning them into list-refs inside the results.

=back

=head1 AUTHOR

Graham TerMarsch <cpan@howlingfrog.com>

=head1 COPYRIGHT

Copyright (C) 2006, Graham TerMarsch.  All rights reserved.

This is free software; you can redistribute it and/or modify it under the same
terms as Perl itself.

=head1 SEE ALSO

L<CGI::Application>.

=cut
