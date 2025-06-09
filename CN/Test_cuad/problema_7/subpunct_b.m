% Schimbare de variabilă x = t^2
f_cos_transformed = @(t) 2 * cos(t.^2);
f_sin_transformed = @(t) 2 * sin(t.^2);

% Număr de noduri pentru Gauss-Legendre
n = 20;

% Calculul nodurilor și ponderilor Gauss-Legendre pe [0, 1]
[x_leg, w_leg] = lgwt(n, 0, 1);

% Aproximarea integralelor
I_c_leg = sum(w_leg .* f_cos_transformed(x_leg));
I_s_leg = sum(w_leg .* f_sin_transformed(x_leg));

% Afișare rezultate
fprintf('(b) Gauss-Legendre cu x = t^2:\n');
fprintf('I_c = %.10f\n', I_c_leg);
fprintf('I_s = %.10f\n', I_s_leg);