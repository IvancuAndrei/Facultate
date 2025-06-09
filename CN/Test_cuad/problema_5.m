% Număr de noduri (pentru precizie ridicată, alegem n=10)
n = 10;

% Obținere noduri și ponderi Gauss-Hermite
[x_k, A_k] = hermite_quadrature(n);

% Funcții de integrat
f_sin = @(x) sin(x);
f_cos = @(x) cos(x);

% Calculul integralelor
I_sin = sum(A_k .* f_sin(x_k));
I_cos = sum(A_k .* f_cos(x_k));

% Afișare rezultate
fprintf('Integrala e^{-x^2} sin(x): %.10f\n', I_sin);
fprintf('Integrala e^{-x^2} cos(x): %.10f\n', I_cos);

% Verificare
exact_cos = sqrt(pi) * exp(-1/4);
fprintf('Valoare exactă cos(x): %.10f\n', exact_cos);
fprintf('Eroare: %.10f\n', abs(I_cos - exact_cos));