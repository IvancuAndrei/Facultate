function y_interp = natural_cubic_spline(x, y, x_interp)
    % x, y: nodurile de interpolare
    % x_interp: punctele în care se evaluează spline-ul
    % y_interp: valorile interpolate
    
    n = length(x);
    h = diff(x);
    delta = diff(y) ./ h;
    
    % Construim sistemul tridiagonal pentru derivatele a doua (M)
    A = zeros(n);
    B = zeros(n, 1);
    
    % Condiții la limită naturale: M(1) = M(n) = 0
    A(1,1) = 1;
    A(n,n) = 1;
    
    for i = 2:n-1
        A(i,i-1) = h(i-1);
        A(i,i) = 2*(h(i-1) + h(i));
        A(i,i+1) = h(i);
        B(i) = 6*(delta(i) - delta(i-1));
    end
    
    M = A \ B; % Rezolvăm sistemul pentru M
    
    % Evaluăm spline-ul în punctele x_interp
    y_interp = zeros(size(x_interp));
    
    for i = 1:length(x_interp)
        xi = x_interp(i);
        
        % Căutăm intervalul corespunzător
        for j = 1:n-1
            if xi >= x(j) && xi <= x(j+1)
                % Calculăm coeficienții polinomului cubic pe intervalul curent
                a = (M(j+1) - M(j)) / (6 * h(j));
                b = M(j) / 2;
                c = (delta(j) - (h(j) * (2*M(j) + M(j+1))) / 6);
                d = y(j);
                
                % Evaluăm polinomul cubic
                dx = xi - x(j);
                y_interp(i) = a*dx^3 + b*dx^2 + c*dx + d;
                break;
            end
        end
    end
end