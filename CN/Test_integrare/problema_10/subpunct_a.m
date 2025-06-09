% Functia de integrat
f = @(x) log(x);
a = 1; b = 2;
exact = 2*log(2) - 1; % Valoarea exacta

% Initializare
max_level = 6;
h = (b-a)./(2.^(0:max_level-1));
R = zeros(max_level, max_level);

% 1. Calcul coloana 1 (regula trapezului)
for i = 1:max_level
    n = 2^(i-1);
    x = linspace(a, b, n+1);
    R(i,1) = h(i)/2 * (f(a) + 2*sum(f(x(2:end-1))) + f(b));
end

% 2. Calcul coloana 2 (extrapolare Romberg - echivalenta cu Simpson)
for i = 2:max_level
    R(i,2) = R(i,1) + (R(i,1) - R(i-1,1))/3;
end

% 3. Calcul direct cu regula Simpson pentru comparatie
simp_direct = zeros(max_level,1);
for i = 1:max_level
    n = 2^i; % Simpson necesita numar par de subintervale
    x = linspace(a, b, n+1);
    h_simp = (b-a)/n;
    simp_direct(i) = h_simp/3 * (f(a) + 4*sum(f(x(2:2:end-1))) + 2*sum(f(x(3:2:end-2))) + f(b));
end

% 4. Afisare comparatie
disp('Comparatie R(:,2) cu regula Simpson directa:');
comparison = [R(2:end,2) simp_direct(1:end-1) abs(R(2:end,2)-simp_direct(1:end-1))];
disp('   Romberg R_{i,2} | Simpson direct | Diferenta');
disp(comparison);

% 5. Grafic erori
figure;
loglog(h(1:end), abs(R(:,1)-exact), 'b-o', 'LineWidth', 2); hold on;
loglog(h(2:end), abs(R(2:end,2)-exact), 'r-s', 'LineWidth', 2);
xlabel('Pasul h');
ylabel('Eroarea absoluta');
legend('Regula trapezului (R_{i,1})', 'Regula Simpson (R_{i,2})', 'Location', 'best');
title('Verificare subpunct (a) - Convergenta metodelor');
grid on;