% Definirea funcției de integrat
f = @(x) 1 ./ sqrt(sin(x));

% Limitele de integrare
a = 0;
b = pi/2;

% Parametrii pentru Gauss-Jacobi (α = -0.5, β = -0.5)
alpha = -0.5;
beta = -0.5;
n = 20; % Număr de noduri pentru precizie ridicată

% Calculul nodurilor și ponderilor Gauss-Jacobi
[x_jacobi, w_jacobi] = jacobi_quadrature(n, alpha, beta);

% Transformarea nodurilor de la [-1, 1] la [0, π/2]
x_transformed = ((b - a) / 2) * x_jacobi + ((b + a) / 2);

% Aproximarea integralei
integral_approx = sum(w_jacobi .* f(x_transformed)) * ((b - a) / 2);

% Afișarea rezultatului cu 9 zecimale
fprintf('Valoarea aproximativă a integralei: %.9f\n', integral_approx);

