% Functia de integrat
f = @(x) log(x);
a = 1; b = 2;
exact = 2*log(2) - 1; % Valoarea exacta

% Initializare
max_level = 6;
h = (b-a)./(2.^(0:max_level-1));
R = zeros(max_level, max_level);

% 1. Calcul matrice Romberg pana la coloana 3
for i = 1:max_level
    % Coloana 1 (trapez)
    n = 2^(i-1);
    x = linspace(a, b, n+1);
    R(i,1) = h(i)/2 * (f(a) + 2*sum(f(x(2:end-1))) + f(b));
end

for j = 2:3
    for i = j:max_level
        R(i,j) = R(i,j-1) + (R(i,j-1) - R(i-1,j-1))/(4^(j-1)-1);
    end
end

% 2. Calcul direct cu regula Boole-Villarceau
boole_direct = zeros(max_level-2,1);
for i = 3:max_level
    n = 2^(i-1);
    x = linspace(a, b, n+1);
    h_boole = h(i);
    sum_part = 0;
    for k = 1:n
        x1 = x(k); x5 = x(k+1);
        x2 = (3*x1+x5)/4; x3 = (x1+x5)/2; x4 = (x1+3*x5)/4;
        sum_part = sum_part + 7*f(x1) + 32*f(x2) + 12*f(x3) + 32*f(x4) + 7*f(x5);
    end
    boole_direct(i-2) = h_boole/90 * sum_part;
end

% 3. Afisare comparatie
disp('Comparatie R(:,3) cu regula Boole directa:');
comparison = [R(3:end,3) boole_direct abs(R(3:end,3)-boole_direct)];
disp('   Romberg R_{i,3} | Boole direct | Diferenta');
disp(comparison);

% 4. Grafic erori
figure;
loglog(h(1:end), abs(R(:,1)-exact), 'b-o', 'LineWidth', 2); hold on;
loglog(h(2:end), abs(R(2:end,2)-exact), 'r-s', 'LineWidth', 2);
loglog(h(3:end), abs(R(3:end,3)-exact), 'g-d', 'LineWidth', 2);
xlabel('Pasul h');
ylabel('Eroarea absoluta');
legend('Trapez (R_{i,1})', 'Simpson (R_{i,2})', 'Boole (R_{i,3})', 'Location', 'best');
title('Verificare subpunct (b) - Convergenta metodelor');
grid on;