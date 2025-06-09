% Folosim aceeași cuadratură Gauss-Cebîșev ca în Problema 2
n = 10;
k = 1:n;
x_k = cos((2*k - 1) * pi / (2*n));
A_k = pi / n;

% Definirea funcției f(x) = x^2 e^{-x^2}
f = @(x) x.^2 .* exp(-x.^2);

% Calcularea integralei
integral_value = sum(A_k * f(x_k));

% Verificare: Calculul exact al integralei
exact_integral = integral(@(x) f(x) ./ sqrt(1 - x.^2), -1, 1);

fprintf('Valoarea aproximativă: %.8f\n', integral_value);
fprintf('Valoarea exactă (numerică): %.8f\n', exact_integral);
fprintf('Eroarea: %.8f\n', abs(integral_value - exact_integral));