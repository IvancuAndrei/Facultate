function [x, iter] = jacob_method(A, b, tol, max_iter)
  n = length(b);
  x = zeros(n, 1);      % Inițializare soluție
  x_new = x;
  D = diag(A);
  R = A - diag(D);

  for iter = 1:max_iter
    x_new = (b - R * x) ./ D;
    if norm(x_new - x, inf) < tol
      break;
    end
    x = x_new;
  end
end

