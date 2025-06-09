function [x, w] = hermite_quadrature(n)
     beta = sqrt(1:n-1)/2;
     T = diag(beta,1) + diag(beta,-1);
     [V,D] = eig(T);
     x = diag(D); w = sqrt(pi) * V(1,:).^2;
end