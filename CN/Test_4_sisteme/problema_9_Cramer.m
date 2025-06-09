% Exemplu sistem 2x2: 2x + 3y = 1, 4x + 5y = 2
A = [2 3; 4 5];  % Matricea coeficienților
b = [1; 2];       % Vectorul termenilor liberi

% Calculul det(A): a11*a22 - a12*a21
% 2 înmulțiri (2*5, 3*4) + 1 scădere = 3 flops
detA = A(1,1)*A(2,2) - A(1,2)*A(2,1);

% Calculul det(A1): b1*a22 - a12*b2
% 2 înmulțiri (1*5, 3*2) + 1 scădere = 3 flops
detA1 = b(1)*A(2,2) - A(1,2)*b(2);

% Calculul det(A2): a11*b2 - b1*a21
% 2 înmulțiri (2*2, 1*4) + 1 scădere = 3 flops
detA2 = A(1,1)*b(2) - b(1)*A(2,1);

% Calculul soluțiilor: x1 = detA1/detA, x2 = detA2/detA
% 2 împărțiri = 2 flops
x1 = detA1 / detA;
x2 = detA2 / detA;

% Total flops: 3 + 3 + 3 + 2 = 11 flops
x = [x1; x2];
disp('Solutia Cramer n=2:');
disp(x);

% Exemplu sistem 3x3: x + 2y + 3z = 1, 5y + 6z = 2, 9z = 3
A = [1 2 3; 0 5 6; 0 0 9];
b = [1; 2; 3];

% Calculul det(A) folosind regula lui Sarrus:
% 6 înmulțiri (3 termeni pozitivi, 3 negativi) + 5 adunări/scăderi = 11 flops
detA = (A(1,1)*A(2,2)*A(3,3) + A(1,2)*A(2,3)*A(3,1) + A(1,3)*A(2,1)*A(3,2)) - ...
       (A(1,3)*A(2,2)*A(3,1) + A(1,2)*A(2,1)*A(3,3) + A(1,1)*A(2,3)*A(3,2));

% Calculul det(A1): înlocuim coloana 1 cu b
% 6 înmulțiri + 5 adunări/scăderi = 11 flops
detA1 = (b(1)*A(2,2)*A(3,3) + A(1,2)*A(2,3)*b(3) + A(1,3)*b(2)*A(3,2)) - ...
        (A(1,3)*A(2,2)*b(3) + A(1,2)*b(2)*A(3,3) + b(1)*A(2,3)*A(3,2));

% Calculul det(A2): înlocuim coloana 2 cu b
% 6 înmulțiri + 5 adunări/scăderi = 11 flops
detA2 = (A(1,1)*b(2)*A(3,3) + b(1)*A(2,3)*A(3,1) + A(1,3)*A(2,1)*b(3)) - ...
        (A(1,3)*b(2)*A(3,1) + b(1)*A(2,1)*A(3,3) + A(1,1)*A(2,3)*b(3));

% Calculul det(A3): înlocuim coloana 3 cu b
% 6 înmulțiri + 5 adunări/scăderi = 11 flops
detA3 = (A(1,1)*A(2,2)*b(3) + A(1,2)*b(2)*A(3,1) + b(1)*A(2,1)*A(3,2)) - ...
        (b(1)*A(2,2)*A(3,1) + A(1,2)*A(2,1)*b(3) + A(1,1)*b(2)*A(3,2));

% Calculul soluțiilor: x1 = detA1/detA, x2 = detA2/detA, x3 = detA3/detA
% 3 împărțiri = 3 flops
x1 = detA1 / detA;
x2 = detA2 / detA;
x3 = detA3 / detA;

% Total flops: 11 (detA) + 11 (detA1) + 11 (detA2) + 11 (detA3) + 3 = 47 flops
x = [x1; x2; x3];
disp('Solutia Cramer n=3:');
disp(x);
