% Definirea funcției și a derivatei
f = @(x) sin(sqrt(3)*x) + cos(sqrt(2)*x);
f_prime = @(x) sqrt(3)*cos(sqrt(3)*x) - sqrt(2)*sin(sqrt(2)*x);

% Parametri
a = -2*pi; b = 2*pi; m = 15; t = 1/2;
h = (b - a) / m;
x_nodes = a:h:b; % Noduri echidistante (16 noduri)

% Valori în noduri
y_nodes = f(x_nodes);
y_prime_nodes = f_prime(x_nodes);

% Puncte pentru plotare
x_fine = linspace(a, b, 1000);
y_true = f(x_fine);

% Interpolare Lagrange
L = @(x) 0;
for i = 1:length(x_nodes)
    l_k = @(x) prod((x - x_nodes([1:i-1, i+1:end])) ./ (x_nodes(i) - x_nodes([1:i-1, i+1:end])), 2);
    L = @(x) L(x) + y_nodes(i) * l_k(x);
end
y_lagrange = arrayfun(L, x_fine);

% Interpolare Hermite folosind funcția dedicată
y_hermite = hermite_interp(x_nodes, y_nodes, y_prime_nodes, x_fine);

% Grafice
figure;
plot(x_fine, y_true, 'b-', 'LineWidth', 2, 'DisplayName', 'f(x)');
hold on;
plot(x_fine, y_lagrange, 'r--', 'LineWidth', 2, 'DisplayName', 'Lagrange');
plot(x_fine, y_hermite, 'g-.', 'LineWidth', 2, 'DisplayName', 'Hermite');
plot(x_nodes, y_nodes, 'ko', 'MarkerSize', 8, 'DisplayName', 'Noduri');
plot(t, f(t), 'm*', 'MarkerSize', 10, 'DisplayName', 't = 1/2');
xlabel('x'); ylabel('y');
title('Interpolare Lagrange și Hermite');
legend('show');
grid on;