% Exemplu de utilizare pentru n = 3
a = [0; 1; 2];    % Subdiagonala (a1 = 0)
b = [4; 5; 6];    % Diagonala principală
c = [1; 2; 0];    % Supradiagonala (cn = 0)
d = [10; 22; 34]; % Termenii liberi

% Apelăm funcția și afișăm soluția
x = thomas_pivot(a, b, c, d);
disp('Soluția Thomas cu pivotare n=3:');
disp(x);