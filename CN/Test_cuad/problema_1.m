% Definirea funcției de integrat
f = @(x) log(x) ./ (x.^2 - 2*x + 2);

% Limitele de integrare
a = 1;
b = pi;

% Numărul de puncte pentru cuadratura Gauss-Legendre 
n = 10;

% Calcularea integralei folosind cuadratura Gauss-Legendre
[gauss_nodes, gauss_weights] = lgwt(n, a, b);
integral_value = sum(gauss_weights .* f(gauss_nodes));

% Afișarea rezultatului cu 8 zecimale exacte
fprintf('Valoarea aproximativă a integralei: %.8f\n', integral_value);

