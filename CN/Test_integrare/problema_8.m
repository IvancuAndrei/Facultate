% Calculul integralei exponentiale E1(t)

% Valori pentru t
t_values = [1.0, 2.0, 3.0];

% Constanta Euler-Mascheroni
gamma = 0.5772156649015329;

% Calculam E1(t) pentru fiecare valoare a lui t
for t = t_values
    % Calculam integrala din formula
    integral_part = integral(@(x) (1 - exp(-x))./x, 0, t);
    
    % Calculam E1(t)
    E1 = -gamma - log(t) + integral_part;
    
    % Afisam rezultatul
    fprintf('E1(%.1f) = %.6f\n', t, E1);
end

% Verificare comportament la x=0
x = logspace(-15, 0, 100); % valori de la 1e-15 la 1
y = (1 - exp(-x))./x;

figure;
loglog(x, y);
xlabel('x');
ylabel('(1 - e^{-x})/x');
title('Comportamentul integrandului la x apropiindu-se de 0');
grid on;