% Definirea funcțiilor de integrat
f_cos = @(x) cos(x) ./ sqrt(x);
f_sin = @(x) sin(x) ./ sqrt(x);

% Calculul numeric cu cuadratură adaptivă
I_c_adaptive = integral(f_cos, 0, 1, 'AbsTol', 1e-10);
I_s_adaptive = integral(f_sin, 0, 1, 'AbsTol', 1e-10);

% Afișare rezultate
fprintf('(a) Cuadratura adaptivă:\n');
fprintf('I_c = %.10f\n', I_c_adaptive);
fprintf('I_s = %.10f\n', I_s_adaptive);