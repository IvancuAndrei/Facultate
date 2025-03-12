% Definirea functiei f(x) = exp(x)
syms x;
f = exp(x); 

% Definirea ordinului numaratorului si numitorului pentru Padé
m1 = 1; k1 = 1; % pentru R1,1
m2 = 2; k2 = 2; % pentru R2,2

% Apelarea functiei pade_sym pentru a obtine aproximarile Padé
R1_1 = pade_sym(f, m1, k1, x);
R2_2 = pade_sym(f, m2, k2, x);

% Afisarea aproximarilor Padé
disp('R1,1(x):');
disp(R1_1);

disp('R2,2(x):');
disp(R2_2);

% Definirea functiei ex pentru comparatie
f_exact = @(x) exp(x);

% Definirea valorilor pentru x pe intervalul [-1, 1]
x_vals = linspace(-1, 1, 400);

% Calcularea valorilor pentru fiecare functie
y_f_exact = f_exact(x_vals);
y_R1_1 = double(subs(R1_1, x, x_vals));
y_R2_2 = double(subs(R2_2, x, x_vals));

% Plotarea graficelor
figure;
hold on;
plot(x_vals, y_f_exact, 'LineWidth', 2, 'DisplayName', 'f(x) = e^x');
plot(x_vals, y_R1_1, '--', 'LineWidth', 2, 'DisplayName', 'R1,1(x)');
plot(x_vals, y_R2_2, '--', 'LineWidth', 2, 'DisplayName', 'R2,2(x)');
legend;
xlabel('x');
ylabel('y');
title('Comparatie grafica: f(x) = e^x, R1,1(x), R2,2(x)');
grid on;
