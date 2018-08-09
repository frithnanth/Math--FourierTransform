use v6;

use Test;
use lib 'lib';
use Math::FourierTransform;

my Complex @data = (1..6)».Complex;
my Complex @spectrum = discrete-fourier-transform @data;
is-deeply @spectrum».round(10⁻¹²),
          Array[Complex].new(<21+0i>,
           <-3.000000000000001+5.19615242270663i>,
           <-2.999999999999996+1.7320508075688754i>,
           <-3-1.286250527486674e-14i>,
           <-3.0000000000000084-1.7320508075688812i>,
           <-3.000000000000009-5.196152422706646i>)».round(10⁻¹²),
           'direct transform';

done-testing;
