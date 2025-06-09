function p = hermite_interp(x_nodes, y_nodes, y_prime_nodes, x_eval)
    % x_nodes: nodurile de interpolare
    % y_nodes: valorile funcției în noduri f(x_k)
    % y_prime_nodes: derivatele funcției în noduri f'(x_k)
    % x_eval: punctele în care evaluăm polinomul
    % Returnează valorile polinomului Hermite în x_eval

    m = length(x_nodes) - 1; % Numărul de noduri - 1
    % Construim vectorul de noduri dublate 
    z = zeros(2*(m+1), 1);
    for k = 1:m+1
        z(2*k-1) = x_nodes(k);
        z(2*k) = x_nodes(k);
    end

    % Construim tabelul de diferențe divizate
    f = zeros(2*(m+1), 1);
    for k = 1:m+1
        f(2*k-1) = y_nodes(k); % f(x_k)
        f(2*k) = y_nodes(k);   % f(x_k) (dublat)
    end

    % Calculăm diferențele divizate
    dd = zeros(2*(m+1), 2*(m+1));
    dd(:, 1) = f; % Coloana 0: valorile funcției

    % Prima coloană pentru derivate
    for k = 1:m+1
        dd(2*k-1, 2) = y_prime_nodes(k); % f'(x_k)
        if k < m+1
            dd(2*k, 2) = (dd(2*k+1, 1) - dd(2*k, 1)) / (z(2*k+1) - z(2*k));
        else
            dd(2*k, 2) = y_prime_nodes(k); % Ultimul nod
        end
    end

    % Restul diferențelor divizate
    for j = 3:2*(m+1)
        for i = 1:2*(m+1)-j+1
            dd(i, j) = (dd(i+1, j-1) - dd(i, j-1)) / (z(i+j-1) - z(i));
        end
    end

    % Evaluăm polinomul Hermite în x_eval
    p = zeros(size(x_eval));
    for i = 1:length(x_eval)
        x = x_eval(i);
        % Calculăm valoarea polinomului folosind schema Newton
        val = dd(1, 1);
        prod = 1;
        for k = 2:2*(m+1)
            prod = prod * (x - z(k-1));
            val = val + dd(1, k) * prod;
        end
        p(i) = val;
    end
end