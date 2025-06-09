% Determinarea nodurilor și ponderilor pentru cuadratura Gauss-Cebîșev
n = 10; % Numărul de noduri
k = 1:n;
x_k = cos((2*k - 1) * pi / (2*n)); % Nodurile Cebîșev
A_k = pi / n; % Ponderile (toate egale pentru Cebîșev)

% Definirea funcției f(x) = x e^{-x^2}
f = @(x) x .* exp(-x.^2);

% Calcularea integralei folosind cuadratura Gauss-Cebîșev
integral_value = sum(A_k * f(x_k));

% Verificare: Calculul exact al integralei (dacă este posibil)
% Integrala exactă poate fi calculată numeric pentru comparație
exact_integral = integral(@(x) f(x) ./ sqrt(1 - x.^2), -1, 1);

fprintf('Valoarea aproximativă: %.8f\n', integral_value);
fprintf('Valoarea exactă (numerică): %.8f\n', exact_integral);
fprintf('Eroarea: %.8f\n', abs(integral_value - exact_integral));