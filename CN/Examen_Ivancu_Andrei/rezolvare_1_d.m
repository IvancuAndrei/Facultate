%Calculeza \int_0^1 1/sqrt(x)f(x)dx
%cu ajutorul polinoamelor Legendre
format long
f=@(x) sin(x);
[gn,gc]=Gauss_rsqrt(20);
vi=vquad(gn,gc,f);
[gn2,gc2]=Gauss_Jacobi_ab(20,0,-1/2,0,1);
vi2=vquad(gn2,gc2,f);
fprintf("Rezultat cu Legendre: %.8f\n", vi)
fprintf("Rezultat cu Jacobi:   %.8f\n", vi2)