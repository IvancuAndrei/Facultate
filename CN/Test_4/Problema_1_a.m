% Definim funcțiile simbolic
syms x
f = x^2 - 4;          % f(x)
g = x;                % g(x)
epsilon = 10^-4;      % perturbație mică
r = 2;                % rădăcina inițială a lui f(x)

% Calculăm derivata f'(x)
f_prime = diff(f, x);
f_prime_r = double(subs(f_prime, x, r));  % f'(r) = 4

% Calculăm g(r)
g_r = double(subs(g, x, r));  % g(r) = 2

% Aproximăm Delta r
Delta_r_aprox = -epsilon * g_r / f_prime_r;
disp(['Delta r aproximat: ', num2str(Delta_r_aprox)]);

% Definim funcția perturbată
f_perturbed = f + epsilon * g;

% Găsim rădăcina exactă a funcției perturbate numeric
r_perturbed = double(solve(f_perturbed == 0, x));
r_perturbed = r_perturbed(r_perturbed > 0);  % Alegem rădăcina pozitivă
Delta_r_exact = r_perturbed - r;
disp(['Delta r exact: ', num2str(Delta_r_exact)]);

% Eroarea relativă între aproximare și exact
error = abs(Delta_r_aprox - Delta_r_exact) / abs(Delta_r_exact);
disp(['Eroare relativă: ', num2str(error)]);

% Concluzie: Aproximarea Delta r = -epsilon * g(r) / f'(r) este validata numeric.
% Eroarea relativa mica (1.25e-05) confirma precizia formulei pentru epsilon mic,
% demonstrand ca deplasarea radacinii este proportionala cu perturbatia aplicata.