    % Definim polinomul
syms x
f = (x-1)*(x-2)*(x-3)*(x-4)*(x-5)*(x-6);
P = x^20 - f;

% Convertim in coeficienti
p = expand(P);
coeffs = sym2poly(p);  % Coeficientii polinomului initial
n = length(coeffs) - 1;  % Gradul polinomului (20)

% Calculam radacinile initiale
r = roots(coeffs);

% Calculam numerele de conditionare
P_prime = diff(P, x);  % Derivata polinomului
norm_a = norm(coeffs, 2);  % Norma L2 a coeficientilor
kappa = zeros(size(r));
for i = 1:length(r)
    kappa(i) = norm_a / abs(double(subs(P_prime, x, r(i))));
end

disp('Radacinile polinomului:');
disp(r);
disp('Numerele de conditionare ale radacinilor:');
disp(kappa);

% Experiment grafic cu perturbatii
n_trials = 100;  % Numarul de experimente
perturbed_roots = zeros(length(r), n_trials);

for trial = 1:n_trials
    % Generam perturbatii aleatoare
    delta = 0.1 * randn(1, n+1);  
    coeffs_perturbed = coeffs .* (1 + delta);
    % Calculam radacinile perturbate
    r_perturbed = roots(coeffs_perturbed);
    perturbed_roots(:, trial) = r_perturbed(1:length(r));  % Stocam primele length(r) radacini
end

% Grafic: Scatter plot al radacinilor perturbate
figure;
plot(real(r), imag(r), 'ro', 'MarkerSize', 10, 'LineWidth', 2);  % Radacinile initiale
hold on;
plot(real(perturbed_roots(:)), imag(perturbed_roots(:)), 'b.', 'MarkerSize', 2);  % Radacinile perturbate
xlabel('Partea reala');
ylabel('Partea imaginara');
title('Radacinile initiale (rosu) si perturbate (albastru)');
grid on;
legend('Radacinile initiale', 'Radacinile perturbate');

