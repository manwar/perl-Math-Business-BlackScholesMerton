package Math::Business::BlackScholes::Vanillas;

use strict;
use warnings;

use Math::CDF qw(pnorm);

=head2 vanilla_call

    USAGE
    my $price = vanilla_call($S, $K, $t, $r_q, $mu, $sigma)

    DESCRIPTION
    Price of a Vanilla Call

=cut

sub vanilla_call {
    my ($S, $K, $t, $r_q, $mu, $sigma) = @_;

    my $d1 = (log($S / $K) + ($mu + $sigma * $sigma / 2.0) * $t) / ($sigma * sqrt($t));
    my $d2 = $d1 - ($sigma * sqrt($t));

    return exp(-$r_q * $t) * ($S * exp($mu * $t) * pnorm($d1) - $K * pnorm($d2));
}

=head2 vanilla_put

    USAGE
    my $price = vanilla_put($S, $K, $t, $r_q, $mu, sigma)

    DESCRIPTION
    Price a standard Vanilla Put

=cut

sub vanilla_put {
    my ($S, $K, $t, $r_q, $mu, $sigma) = @_;

    my $d1 = (log($S / $K) + ($mu + $sigma * $sigma / 2.0) * $t) / ($sigma * sqrt($t));
    my $d2 = $d1 - ($sigma * sqrt($t));

    return -1 * exp(-$r_q * $t) * ($S * exp($mu * $t) * pnorm(-$d1) - $K * pnorm(-$d2));
}

1;
