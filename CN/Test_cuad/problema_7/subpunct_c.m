% Parametrii Gauss-Jacobi
alpha = -0.5;
beta = 0;
n = 20;

% Calculul nodurilor și ponderilor Gauss-Jacobi pe [0, 1]
[x_jacobi, w_jacobi] = jacobi_quadrature(n, alpha, beta);

% Aproximarea integralelor
I_c_jacobi = sum(w_jacobi .* cos(x_jacobi));
I_s_jacobi = sum(w_jacobi .* sin(x_jacobi));

% Afișare rezultate
fprintf('(c) Gauss-Jacobi:\n');
fprintf('I_c = %.10f\n', I_c_jacobi);
fprintf('I_s = %.10f\n', I_s_jacobi);