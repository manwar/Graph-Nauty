use strict;
use warnings;
use Graph::Nauty qw( are_isomorphic automorphism_group_size orbits );
use Graph::Undirected;
use Test::More tests => 3;

my %atoms = (
    C  => { name => 'C',  type => 'C' },
    O  => { name => 'O',  type => 'O' },
    HA => { name => 'HA', type => 'H' },
    HB => { name => 'HB', type => 'H' },
    HC => { name => 'HC', type => 'H' },
    HO => { name => 'HO', type => 'H' },
);

my $g = Graph::Undirected->new;

$g->add_edge( $atoms{C}, $atoms{O}  );
$g->add_edge( $atoms{C}, $atoms{HA} );
$g->add_edge( $atoms{C}, $atoms{HB} );
$g->add_edge( $atoms{C}, $atoms{HC} );
$g->add_edge( $atoms{O}, $atoms{HO} );

is( automorphism_group_size( $g, sub { return $_[0]->{type} } ), 6 );

my $orbits = join '',
             map { '[' . join( ',', map { $_->{name} } @$_ ) . ']' }
                 orbits( $g, sub { return $_[0]->{type} } );
is( $orbits, '[C][HA,HB,HC][HO][O]' );
ok( are_isomorphic( $g, $g, sub { return $_[0]->{type} } ) );
