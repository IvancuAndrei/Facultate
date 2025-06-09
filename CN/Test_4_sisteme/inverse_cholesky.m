function X = inverse_cholesky(A)
    % Inversarea unei matrice simetrice pozitiv definite folosind descompunerea Cholesky
    % Input: A - matrice simetrică pozitiv definită
    % Output: X - inversa matricei A
    
    n = size(A, 1); % Dimensiunea matricei
    
    % Verificăm dacă matricea este simetrică (în limita erorilor numerice)
    if ~isequal(A, A')
        error('Matricea A nu este simetrică');
    end
    
    % Descompunerea Cholesky: A = R' * R, unde R este triunghiulară superioară
    R = chol(A); % R este R-ul din A = R' * R
    
    % Matricea identitate I
    I = eye(n);
    
    % Inițializăm matricea inversă X
    X = zeros(n);
    
    % Rezolvăm pentru fiecare coloană k a inversului: A * X(:,k) = I(:,k)
    for k = 1:n
        % Pasul 1: Rezolvăm R' * y = I(:,k) pentru y (sistem triunghiular inferior)
        y = R' \ I(:,k); % \ folosește substituție înainte (forward substitution)
        
        % Pasul 2: Rezolvăm R * X(:,k) = y pentru X(:,k) (sistem triunghiular superior)
        X(:,k) = R \ y; % \ folosește substituție înapoi (back substitution)
    end
end

