# Math--FourierTransform [![Build Status](https://travis-ci.org/MattOates/Math--FourierTransform.svg?branch=master)](https://travis-ci.org/MattOates/Math--FourierTransform)

Discrete Fourier Transform for Perl 6

```perl6
use Math::FourierTransform;

my Complex @data = ...;
my Complex @spectrum = discrete-fourier-transform(@data);
my Complex @back = discrete-inverse-transform(@spectrum);

```
