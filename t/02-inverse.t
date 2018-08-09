use v6;

use Test;
use lib 'lib';
use Math::FourierTransform;

my Complex @data = (1..6)».Complex;
my Complex @spectrum = discrete-fourier-transform @data;
my Complex @andback  = discrete-inverse-transform @spectrum;
is-deeply  @andback».round(10⁻¹²), @data».round(10⁻¹²), 'inverse transform';

done-testing;
