x = linspace(-2*pi, 2*pi, 1000);
f = cosh(x).^2 - sinh(x).^2; % Fără simplificare

% Reprezentare normală
figure;
plot(x, f, 'b', 'LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('Reprezentarea funcției f(x) fără restricții');
grid on;

% Reprezentare restrânsă pe Oy
figure;
plot(x, f, 'r', 'LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('Reprezentare cu plaja restrânsă pe axa Oy');
ylim([1 - 2*exp(1) - 12, 1 + 2*exp(1) - 12]); % Interval restrâns
grid on;

%Fenomenul apare din cauza erorilor de precizie numerică din MATLAB, deoarece funcțiile 
%hiperbolice implică exponențiali.
%Remediul este să folosim direct ones(size(x)) ( cosh2(x)−sinh2(x)=1 )