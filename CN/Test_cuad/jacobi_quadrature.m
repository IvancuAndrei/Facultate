function [x, w] = jacobi_quadrature(n, alpha, beta)
    if alpha <= -1 || beta <= -1
        error('Alpha si beta trebuie sa fie > -1 pentru cuadratura Gauss-Jacobi.');
    end
    
    % Calculeaza coeficienții de recurență
    a = zeros(n, 1);
    b = zeros(n, 1);
    for k = 1:n
        a(k) = (beta^2 - alpha^2) / ((2*k + alpha + beta - 2) * (2*k + alpha + beta));
        if k == 1
            b(k) = sqrt(4 * (1 + alpha) * (1 + beta) / ((2 + alpha + beta)^2 * (3 + alpha + beta)));
        else
            b(k) = sqrt(4 * (k + alpha) * (k + beta) * (k + alpha + beta) / ...
                   ((2*k + alpha + beta)^2 * (2*k + alpha + beta + 1) * (2*k + alpha + beta - 1)));
        end
    end
    
    % Construieste matricea Jacobi
    J = diag(a) + diag(b(1:n-1), 1) + diag(b(1:n-1), -1);
    
    % Calculeaza valorile proprii și vectorii proprii
    [V, D] = eig(J);
    x = diag(D);
    w = (V(1, :).^2)' * 2^(alpha + beta + 1) * gamma(alpha + 1) * gamma(beta + 1) / gamma(alpha + beta + 2);
end