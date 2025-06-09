% Exemplu de utilizare
% Definim o matrice simetrică pozitiv definită 3x3
A = [4 1 0; 1 5 2; 0 2 6];

% Calculăm inversa folosind rutina noastră
X = inverse_cholesky(A);
disp('Inversa calculată cu Cholesky:');
disp(X);