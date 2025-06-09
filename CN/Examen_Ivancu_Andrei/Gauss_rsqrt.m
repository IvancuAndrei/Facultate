function [gn, gc] = Gauss_rsqrt(n)
%formula Gauss pentru w(t) = t ^(-1/2)
%foloseste polinoame Legendre
[nds, coeffs] = Gauss_Legendre(2*n);
gn = nds(1:n).^2;
gc = 2 * coeffs(1:n);
end