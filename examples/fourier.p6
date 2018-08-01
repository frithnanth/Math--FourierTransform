#!/usr/bin/env perl6

# https://en.wikipedia.org/wiki/Discrete_Fourier_transform#Expressing_the_inverse_DFT_in_terms_of_the_DFT

use Math::FourierTransform;

my Complex @data = (1..6)».Complex;
say @data;
my Complex @spectrum = discrete-fourier-transform @data;
say @spectrum;
my Complex @andback = (discrete-fourier-transform(@spectrum».conj)».conj) »/» @data.elems;
say @andback;
# Let's cheat!
say @andback».round(10⁻¹²);
