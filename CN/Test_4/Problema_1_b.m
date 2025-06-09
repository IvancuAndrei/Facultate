% Definim polinomul pentru analiza conditionarii
syms x
f = (x-1)*(x-2)*(x-3)*(x-4)*(x-5)*(x-6);  % Polinomul initial
g = -x^7;                                  % Termenul de perturbatie
epsilon = 10^-6;                           % Marimea perturbatiei
P = f + epsilon * g;                       % Polinomul perturbat

% Convertim in coeficienti pentru a calcula radacinile
p = expand(P);
coeffs_p = sym2poly(p);

% Calculam radacinile polinomului perturbat
r = roots(coeffs_p);

% Estimam radacina cea mai apropiata de 6
[~, idx] = min(abs(r - 6));
closest_to_6 = r(idx);
disp(['Radacina cea mai apropiata de 6: ', num2str(closest_to_6)]);

% Estimam cea mai mare radacina
max_root = max(r);
disp(['Cea mai mare radacina: ', num2str(max_root)]);

% Analiza conditionarii: Delta r teoretic pentru r = 6
f_prime = diff(f, x);
f_prime_6 = double(subs(f_prime, x, 6));  % f'(6) = 120
g_6 = double(subs(g, x, 6));              % g(6) = -6^7
Delta_r_teoretic = -epsilon * g_6 / f_prime_6;
disp(['Estimare teoretica Delta r pentru r = 6: ', num2str(Delta_r_teoretic)]);
disp(['Radacina estimata teoretic langa 6: ', num2str(6 + Delta_r_teoretic)]);

