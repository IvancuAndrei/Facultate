% Eroare practică
err_lagrange = abs(f_t - L_t);
err_hermite = abs(f_t - H_t);
fprintf('Eroare practică Lagrange: %.10e\n', err_lagrange);
fprintf('Eroare practică Hermite: %.10e\n', err_hermite);

% Eroare teoretică
prod_term = prod(abs(t - x_nodes));
max_f16 = 6817; % |f^(16)(x)| <= 3^8 + 2^8
max_f32 = 4.3e7; % |f^(32)(x)| <= 3^16 + 2^16
err_theory_lagrange = (max_f16 / factorial(16)) * prod_term;
err_theory_hermite = (max_f32 / factorial(32)) * prod_term^2;
fprintf('Eroare teoretică Lagrange: %.10e\n', err_theory_lagrange);
fprintf('Eroare teoretică Hermite: %.10e\n', err_theory_hermite);