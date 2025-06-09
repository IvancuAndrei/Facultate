% Definirea functiei
f = @(x) 1./(1+x.^2);

% Parametri
a = -5; b = 5; % Intervalul
n = 12; % Numar de noduri pentru spline
m = 11; % Grad polinom pentru MCM
num_points = 25; % Numar de puncte pentru MCM

% Generare puncte pentru reprezentare grafica
x_fine = linspace(a, b, 1000);
y_fine = f(x_fine);

% Noduri echidistante
x_eq = linspace(a, b, n);
y_eq = f(x_eq);

% Noduri Cebisev de speta a doua
k = 0:n-1;
x_ceb = (b-a)/2 * cos((2*k+1)*pi/(2*n)) + (a+b)/2;
x_ceb = sort(x_ceb); % Sortare pentru corectitudine
y_ceb = f(x_ceb);

% Spline liniare 
s_linear_eq = linear_spline(x_eq, y_eq, x_fine);
s_linear_ceb = linear_spline(x_ceb, y_ceb, x_fine);

% Spline cubice naturale 
s_cubic_eq = natural_cubic_spline(x_eq, y_eq, x_fine);
s_cubic_ceb = natural_cubic_spline(x_ceb, y_ceb, x_fine);

% Spline complete 
df = @(x) -2*x./(1+x.^2).^2; % Derivata exacta
fprime_a = df(a); fprime_b = df(b);
s_complete_eq = complete_cubic_spline(x_eq, y_eq, x_fine, fprime_a, fprime_b);
s_complete_ceb = complete_cubic_spline(x_ceb, y_ceb, x_fine, fprime_a, fprime_b);

% Spline naturale (folosim natural_cubic_spline)
s_natural_eq = natural_cubic_spline(x_eq, y_eq, x_fine);
s_natural_ceb = natural_cubic_spline(x_ceb, y_ceb, x_fine);

% Grafice pentru spline 
figure('Name', 'Aproximari cu Spline');
subplot(2,2,1);
plot(x_fine, y_fine, 'b-', 'DisplayName', 'f(x)'); hold on;
plot(x_fine, s_linear_eq, 'r--', 'DisplayName', 'S. Linear Echid.');
plot(x_fine, s_linear_ceb, 'g--', 'DisplayName', 'S. Linear Ceb.');
title('Spline Liniare'); legend; grid on;

subplot(2,2,2);
plot(x_fine, y_fine, 'b-', 'DisplayName', 'f(x)'); hold on;
plot(x_fine, s_cubic_eq, 'r--', 'DisplayName', 'S. Cubic Echid.');
plot(x_fine, s_cubic_ceb, 'g--', 'DisplayName', 'S. Cubic Ceb.');
title('Spline Cubice'); legend; grid on;

subplot(2,2,3);
plot(x_fine, y_fine, 'b-', 'DisplayName', 'f(x)'); hold on;
plot(x_fine, s_complete_eq, 'r--', 'DisplayName', 'S. Complet Echid.');
plot(x_fine, s_complete_ceb, 'g--', 'DisplayName', 'S. Complet Ceb.');
title('Spline Complete'); legend; grid on;

subplot(2,2,4);
plot(x_fine, y_fine, 'b-', 'DisplayName', 'f(x)'); hold on;
plot(x_fine, s_natural_eq, 'r--', 'DisplayName', 'S. Natural Echid.');
plot(x_fine, s_natural_ceb, 'g--', 'DisplayName', 'S. Natural Ceb.');
title('Spline Naturale'); legend; grid on;