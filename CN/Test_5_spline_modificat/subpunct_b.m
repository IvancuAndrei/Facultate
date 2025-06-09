% Puncte echidistante pentru MCM
x_mcm = linspace(a, b, num_points);
y_mcm = f(x_mcm);

% Construire matrice Vandermonde
V = zeros(num_points, m+1);
for i = 0:m
    V(:,i+1) = x_mcm'.^i;
end

% Rezolvare sistem liniar (V'*V)*c = V'*y_mcm' (metoda normală)
c = (V' * V) \ (V' * y_mcm');

% Evaluare polinom MCM (fără polyval, folosind for)
x_mcm_fine = linspace(a, b, 1000);
p_mcm = zeros(size(x_mcm_fine));
for i = 0:m
    p_mcm = p_mcm + c(i+1) * x_mcm_fine.^i;
end

% Grafic pentru MCM
figure('Name', 'Metoda Celor Mai Mici Patrate');
plot(x_fine, y_fine, 'b-', 'DisplayName', 'f(x)'); hold on;
plot(x_mcm_fine, p_mcm, 'r--', 'DisplayName', 'MCM Polinom');
plot(x_mcm, y_mcm, 'ko', 'DisplayName', 'Puncte MCM');
title('Aproximare MCM (n=11, 25 puncte)'); 
legend; 
grid on;