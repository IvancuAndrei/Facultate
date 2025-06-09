function [x, w] = lgwt(n, a, b)
    % Această funcție calculează nodurile și ponderile pentru Gauss-Legendre
    % pe intervalul [a, b] cu n puncte.
    beta = 0.5 ./ sqrt(1 - (2*(1:n-1)).^(-2));
    T = diag(beta, 1) + diag(beta, -1);
    [V, D] = eig(T);
    x = diag(D);
    [x, i] = sort(x);
    w = 2 * V(1, i).^2;
    x = 0.5 * ((b - a) * x + a + b);
    w = 0.5 * (b - a) * w';
end