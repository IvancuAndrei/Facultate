function x = thomas_pivot(a, b, c, d)
    % Algoritmul Thomas cu pivotare pentru sisteme tridiagonale
    % Input: a (subdiagonala), b (diagonala), c (supradiagonala), d (termenii liberi)
    % Output: x (solutia sistemului)
    
    n = length(b); % Dimensiunea sistemului
    % Inițializare vectori (copii pentru a nu modifica originalul)
    a = [0; a(2:end)]; % Subdiagonala, a(1) = 0
    c = [c(1:end-1); 0]; % Supradiagonala, c(n) = 0
    b = b(:); % Diagonala principală ca vector coloană
    d = d(:); % Termenii liberi ca vector coloană
    
    % Etapa de eliminare (forward elimination) cu pivotare
    for i = 1:n-1
        % Verificăm dacă e necesară pivotarea comparând b(i) cu a(i+1)
        if abs(b(i)) < abs(a(i+1))
            % Interschimbăm liniile i și i+1 pentru stabilitate
            temp = b(i);
            b(i) = b(i+1);
            b(i+1) = temp;
            % Ajustăm și supradiagonala și subdiagonala
            temp = a(i+1);
            a(i+1) = c(i);
            c(i) = temp;
            % Interschimbăm termenii liberi
            temp = d(i);
            d(i) = d(i+1);
            d(i+1) = temp;
        end
        
        % Calculăm factorul de eliminare
        m = a(i+1) / b(i);
        % Actualizăm diagonala principală și termenii liberi
        b(i+1) = b(i+1) - m * c(i);
        d(i+1) = d(i+1) - m * d(i);
    end
    
    % Etapa de substituție înapoi (back substitution)
    % Calculăm ultima variabilă
    x = zeros(n, 1);
    x(n) = d(n) / b(n);
    
    % Calculăm restul variabilelor de la penultima la prima
    for i = n-1:-1:1
        x(i) = (d(i) - c(i) * x(i+1)) / b(i);
    end
end