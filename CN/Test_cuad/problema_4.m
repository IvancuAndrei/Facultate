% Parametrii cunoscuți
i0 = 100;       % Amperi
R = 0.5;        % Ohmi
t0 = 0.01;      % Secunde

% Definirea funcției i(t)^2 * R
integrand = @(t) R * (i0 * exp(-t/t0) .* sin(2*t/t0)).^2;

% Calculul numeric al integralei de la 0 la infinit
E = integral(integrand, 0, Inf);

% Afișare rezultat
fprintf('Energia disipată E = %.4f Jouli\n', E);