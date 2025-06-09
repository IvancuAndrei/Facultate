% Exemplu sistem 2x2: 2x + 3y = 1, 4x + 5y = 2
A = [2 3; 4 5];
b = [1; 2];
Ab = [A b]; % Matrice augmentată

% Eliminare: pivot a11 = 2
% m21 = a21/a11 = 4/2, 1 împărțire = 1 flop
m21 = Ab(2,1) / Ab(1,1);
% Linia 2: a22' = a22 - m21*a12, b2' = b2 - m21*b1
% 2 înmulțiri (m21*a12, m21*b1) + 2 scăderi = 4 flops
Ab(2,2:3) = Ab(2,2:3) - m21 * Ab(1,2:3);

% Total eliminare: 1 + 4 = 5 flops

% Substituție înapoi:
% x2 = b2'/a22', 1 împărțire = 1 flop
x2 = Ab(2,3) / Ab(2,2);
% x1 = (b1 - a12*x2)/a11, 1 înmulțire + 1 scădere + 1 împărțire = 3 flops
x1 = (Ab(1,3) - Ab(1,2)*x2) / Ab(1,1);

% Total substituție: 1 + 3 = 4 flops
% Total general: 5 + 4 = 9 flops
x = [x1; x2];
disp('Solutia Gauss n=2:');
disp(x);


% Exemplu sistem 3x3: x + 2y + 3z = 1, 5y + 6z = 2, 9z = 3
A = [1 2 3; 0 5 6; 0 0 9];
b = [1; 2; 3];
Ab = [A b]; % Matrice augmentată

% Eliminare: pivot a11 = 1
% m21 = a21/a11 = 0/1, m31 = a31/a11 = 0/1, 2 împărțiri = 2 flops
m21 = Ab(2,1) / Ab(1,1); % 0/1 = 0
m31 = Ab(3,1) / Ab(1,1); % 0/1 = 0
% Linia 2: 3 termeni actualizați, dar m21 = 0, deci 0 înmulțiri/scăderi efective aici
Ab(2,2:4) = Ab(2,2:4) - m21 * Ab(1,2:4); % 3 înmulțiri + 3 scăderi = 6 flops (dacă m21 ≠ 0)
% Linia 3: m31 = 0, la fel
Ab(3,2:4) = Ab(3,2:4) - m31 * Ab(1,2:4); % 3 înmulțiri + 3 scăderi = 6 flops (dacă m31 ≠ 0)
% În acest caz, m21 = m31 = 0, deci nu se modifică liniile; totuși, contorizăm flops standard
% Total pivot 1: 2 + 6 + 6 = 14 flops 

% Pivot a22 = 5
% m32 = a32'/a22' = 0/5, 1 împărțire = 1 flop
m32 = Ab(3,2) / Ab(2,2);
% Linia 3: 2 termeni actualizați, m32 = 0, deci 0 înmulțiri/scăderi efective
Ab(3,3:4) = Ab(3,3:4) - m32 * Ab(2,3:4); % 2 înmulțiri + 2 scăderi = 4 flops (dacă m32 ≠ 0)
% Total pivot 2: 1 + 4 = 5 flops 

% Total eliminare: 14 + 5 = 19 flops

% Substituție înapoi:
% x3 = b3''/a33'' = 3/9, 1 împărțire = 1 flop
x3 = Ab(3,4) / Ab(3,3);
% x2 = (b2' - a23'*x3)/a22' = (2 - 6*x3)/5, 1 înmulțire + 1 scădere + 1 împărțire = 3 flops
x2 = (Ab(2,4) - Ab(2,3)*x3) / Ab(2,2);
% x1 = (b1 - a12*x2 - a13*x3)/a11 = (1 - 2*x2 - 3*x3)/1
% 2 înmulțiri + 2 scăderi + 1 împărțire = 5 flops
x1 = (Ab(1,4) - Ab(1,2)*x2 - Ab(1,3)*x3) / Ab(1,1);

% Total substituție: 1 + 3 + 5 = 9 flops
% Total general estimat: 19 + 9 = 28 flops 

x = [x1; x2; x3];
disp('Solutia Gauss n=3:');
disp(x);
