# Math--FourierTransform [![Build Status](https://travis-ci.org/MattOates/Math--FourierTransform.svg?branch=master)](https://travis-ci.org/MattOates/Math--FourierTransform)

Discrete Fourier Transform for Perl 6

```perl6
use Math::FourierTransform;

@spectrum = discrete-fourier-transform(@data);

```

Here's how to get a spectrum (frequency domain) from the data - in this case six values, from 1 to 6 - and
convert it back to data (time domain).

```perl6
use Math::FourierTransform;

my Complex @data = (1..6)».Complex; # data in the time domain
say @data;
my Complex @spectrum = discrete-fourier-transform @data; #data in the frequency domain
say @spectrum;
my Complex @andback = (discrete-fourier-transform(@spectrum».conj)».conj) »/» @data.elems; # back to the time domain
say @andback;
# Let's cheat! - After two transformations there are rounding errors - and they show in the previous 'say'
say @andback».round(10⁻¹²);  # Let's round the result to 10⁻¹²
```

The Wikipedia page about the Discrete Fourier Transform L<https://en.wikipedia.org/wiki/Discrete_Fourier_transform>
lists three different reverse transformation. The one implemented in the example program is the second one.

There are two other ways to do it. This is the first listed:

```perl6
sub revallbut1 (Complex @a) {
  my Complex @b = @a.reverse;
  @b.unshift: @b.pop;
}

my Complex @andback = (discrete-fourier-transform(revallbut1(@spectrum))) »/» @data.elems;
```

and this is the third:

```perl6
sub swap (Complex $a) { $a.im + i * $a.re }

my Complex @andback = (discrete-fourier-transform(@spectrum».&swap)».&swap) »/» @data.elems;
```
