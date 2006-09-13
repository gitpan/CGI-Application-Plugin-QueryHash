use strict;
use CGI;
use Test::More tests => 5;
BEGIN {
    use_ok( 'CGI::Application::Plugin::QueryHash' );
}

# Test application package.
{
    package TestApp;
    use base qw(CGI::Application);
    use CGI::Application::Plugin::QueryHash;
    1;
};

# Test data
my %data = (
    'firstname' => 'Graham',
    'lastname'  => 'TerMarsch',
    'pets' => [
        'Sheba',
        'Martini',
        'Jane Pond',
        ],
    );

# Create a CGI object based on our test data
my $cgi = CGI->new( \%data );
isa_ok( $cgi, 'CGI' );

# Instantiate the test app with our CGI data
my $app = TestApp->new( QUERY => $cgi );
isa_ok( $app, 'TestApp' );

# Test as hash
my %hash = $app->query_hash();
is_deeply( \%data, \%hash, 'query params as hash' );

# Test as hash-ref
my $hashref = $app->query_hash();
is_deeply( \%data, $hashref, 'query params as hashref' );
