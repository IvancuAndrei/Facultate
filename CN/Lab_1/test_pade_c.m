% Definirea functiei g(x) = ln(1 + x)
g = log(1 + x);

% Definirea ordinului numaratorului si numitorului pentru Padé
m2_g = 2; k2_g = 2; % pentru R2,2
m3_g = 3; k3_g = 1; % pentru R3,1

% Apelarea functiei pade_sym pentru a obtine aproximarile Padé
R2_2_g = pade_sym(g, m2_g, k2_g, x);
R3_1_g = pade_sym(g, m3_g, k3_g, x);

% Afisarea aproximarilor Padé
disp('R2,2(x):');
disp(R2_2_g);

disp('R3,1(x):');
disp(R3_1_g);

% Definirea functiei ln(1 + x) pentru comparatie
g_exact = @(x) log(1 + x);

% Calcularea valorilor pentru fiecare functie pe intervalul [-1, 1]
y_g_exact = g_exact(x_vals);
y_R2_2_g = double(subs(R2_2_g, x, x_vals));
y_R3_1_g = double(subs(R3_1_g, x, x_vals));

% Plotarea graficelor
figure;
hold on;
plot(x_vals, y_g_exact, 'LineWidth', 2, 'DisplayName', 'g(x) = ln(1 + x)');
plot(x_vals, y_R2_2_g, '--', 'LineWidth', 2, 'DisplayName', 'R2,2(x)');
plot(x_vals, y_R3_1_g, '--', 'LineWidth', 2, 'DisplayName', 'R3,1(x)');
legend;
xlabel('x');
ylabel('y');
title('Comparatie grafica: g(x) = ln(1 + x), R2,2(x), R3,1(x)');
grid on;
