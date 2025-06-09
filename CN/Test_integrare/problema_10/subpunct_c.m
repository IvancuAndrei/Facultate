% Functia de integrat
f = @(x) log(x);
a = 1; b = 2;
exact = 2*log(2) - 1;

% Initializare
max_level = 8;
h = (b-a)./(2.^(0:max_level-1));
methods = {'Trapez', 'Simpson', 'Boole'};
colors = {'b', 'r', 'g'};
markers = {'o', 's', 'd'};

% Calcul erori pentru toate metodele
errors = zeros(max_level, 3);

% 1. Calcul regula trapezului
for i = 1:max_level
    n = 2^(i-1);
    x = linspace(a, b, n+1);
    errors(i,1) = abs(h(i)/2 * (f(a) + 2*sum(f(x(2:end-1))) + f(b)) - exact);
end

% 2. Calcul regula Simpson
for i = 2:max_level
    n = 2^i;
    x = linspace(a, b, n+1);
    h_simp = (b-a)/n;
    errors(i,2) = abs(h_simp/3 * (f(a) + 4*sum(f(x(2:2:end-1))) + 2*sum(f(x(3:2:end-2))) + f(b)) - exact);
end

% 3. Calcul regula Boole
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
    errors(i,3) = abs(h_boole/90 * sum_part - exact);
end

% 4. Grafic log-log
figure;
hold on;
for method = 1:3
    valid_levels = method:max_level;
    loglog(h(valid_levels), errors(valid_levels,method), ...
        [colors{method} '-' markers{method}], ...
        'LineWidth', 2, 'DisplayName', methods{method});
end

% 5. Linii teoretice de referinta
loglog(h, h.^2, 'k--', 'DisplayName', 'O(h^2)');
loglog(h, h.^4, 'k-.', 'DisplayName', 'O(h^4)');
loglog(h, h.^6, 'k:', 'DisplayName', 'O(h^6)');

xlabel('Pasul h');
ylabel('Eroarea absoluta');
legend('Location', 'best');
title('Verificare subpunct (c) - Rate de convergenta');
grid on;
set(gca, 'XDir', 'reverse'); % Pentru h descrescator