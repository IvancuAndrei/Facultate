n = 50;
tol = 1e-6;
max_iter = 1000;

% Construim vectorul b
b = ones(n, 1);
b(1) = 4;
b(2) = 2;
b(3) = 2;
b(n-2) = 2;
b(n-1) = 2;
b(n) = 4;

% Construim matricea A
A = zeros(n, n);

% Setăm valorile pe diagonala principală (5)
A(1:n+1:end) = 50;

% Setăm valorile pe diagonalele cu diferență de 3, 5, 7, etc. (±3, ±5, ±7, ...)
for j = 1:2:n
  for i = 1:1:n
      if i+j <= n
        A(i, i+j) = -1;
        A(i+j, i) = -1;
      end
  end
end

% Setăm colțurile (1, n) și (n, 1) la 1
A(1, n) = 1;
A(n, 1) = 1;

% Afișăm matricea A
fprintf("Pornim metoda Jacobi...\n");
[x_jacobi, iter_jacobi] = jacob_method(A, b, tol, max_iter);
fprintf("Jacobi: %d iterații\n", iter_jacobi);

fprintf("Pornim metoda Gauss-Seidel...\n");
[x_gs, iter_gs] = gauss_seidel_method(A, b, tol, max_iter);
fprintf("Gauss-Seidel: %d iterații\n", iter_gs);

fprintf("Pornim metoda SOR (ω = 1.94)...\n");
omega = 1.94;  % Alege valoarea de omega
[x_sor, iter_sor] = sor_method(A, b, omega, tol, max_iter);
fprintf("SOR: %d iterații\n", iter_sor);

% (Doar dacă n este mai mic, ex. < 10000)
x_exact = A \ b;
fprintf("Eroare Jacobi: %e\n", norm(x_jacobi - x_exact, inf));
fprintf("Eroare Gauss-Seidel: %e\n", norm(x_gs - x_exact, inf));
fprintf("Eroare SOR: %e\n", norm(x_sor - x_exact, inf));

