use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'          => 'CGI::Application::Plugin::QueryHash',
    'VERSION_FROM'  => 'lib/CGI/Application/Plugin/QueryHash.pm',
    'ABSTRACT'      => 'CGI-App plugin to retrieve query params as hash',
    'AUTHOR'        => 'Graham TerMarsch <cpan@howlingfrog.com>',
    'PREREQ_PM'     => { 'CGI::Application' => 4,
                       },
    'clean'         => { 'FILES' => '$(DISTVNAME).tar$(SUFFIX)' },
    );
