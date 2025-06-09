f_t = f(t);
L_t = L(t);
H_t = hermite_interp(x_nodes, y_nodes, y_prime_nodes, t);

fprintf('f(1/2) = %.10f\n', f_t);
fprintf('Lagrange L(1/2) = %.10f\n', L_t);
fprintf('Hermite H(1/2) = %.10f\n', H_t);