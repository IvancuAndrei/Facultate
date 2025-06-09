function [x, iter] = gauss_seidel_method(A, b, tol, max_iter)
  n = length(b);
  x = zeros(n, 1);      % Inițializare soluție

  for iter = 1:max_iter
    x_old = x;
    for i = 1:n
      x(i) = (b(i) - A(i,1:i-1) * x(1:i-1) - A(i,i+1:n) * x_old(i+1:n)) / A(i,i);
    end
    if norm(x - x_old, inf) < tol
      break;
    end
  end
end

