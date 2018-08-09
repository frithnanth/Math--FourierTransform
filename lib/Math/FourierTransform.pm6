unit module Math::FourierTransform;

sub discrete-fourier-transform(Complex @input) returns Array[Complex] is export {
    my Int $n = @input.elems;
    my Complex @output = 0i xx $n;
    for ^$n -> $k {
        my Complex $s = 0i;
        for ^$n -> $t {
            $s += @input[$t] * exp(-2i * pi * $t * $k / $n);
        }
        @output[$k] = $s;
    }
    return @output;
}

# This sub uses the second method showed in this Wikipedia page:
# https://en.wikipedia.org/wiki/Discrete_Fourier_transform#Expressing_the_inverse_DFT_in_terms_of_the_DFT

sub discrete-inverse-transform(Complex @input) returns Array[Complex] is export {
    sub revallbut1 (Complex @a) { my Complex @b = @a.reverse; @b.unshift: @b.pop }
    (discrete-fourier-transform(revallbut1(@input))) »/» @input.elems;
}
