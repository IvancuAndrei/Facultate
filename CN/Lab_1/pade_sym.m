function R = pade_sym(f, m, k, x)
    % Verificăm dacă k este 0. Dacă da, folosim dezvoltarea Taylor
    if k == 0
        % Dacă k == 0, se calculează seria Taylor de ordinul m + 1 pentru funcția f
        R = taylor(f, 'order', m + 1);
    else
        % Inițializăm coeficientii pentru fracția Padé
        c = sym(zeros(1, k)); % coeficienti pentru partea de sus (numărător)
        r = c; % coeficienti pentru partea de jos (denominator)
        d = c; % coeficienti pentru partea din dreapta a sistemului liniar
        
        % Calculăm coeficientii pentru serie Taylor, pentru partea superioară și inferioară
        for i = 0:k-1
            % Calculăm coeficientii pentru partea de sus
            c(i+1) = taylor_coef(f, m + i);  
            % Calculăm coeficientii pentru partea de jos
            r(i+1) = taylor_coef(f, m - i);  
            % Calculăm coeficientii pentru sistemul liniar (partea dreaptă)
            d(i+1) = -taylor_coef(f, m + i + 1); 
        end
        
        % Creăm matricea Toeplitz pentru sistemul liniar
        C = toeplitz(c, r); 
        
        % Rezolvăm sistemul liniar C * b = d
        b = C \ d'; 
        
        % Adăugăm 1 la începutul vectorului b (termenul liber al fracției Padé)
        b = [1; b]; 
        
        % Inițializăm coeficientii pentru numărătorul fracției Padé
        a = sym(zeros(m + 1, 1)); 
        
        % Calculăm coeficientii numărătorului
        for j = 0:m
            for l = 0:min([j, k]) 
                % Adunăm termenii corespunzători din dezvoltarea Taylor și vectorul b
                a(j+1) = a(j+1) + taylor_coef(f, j - l) * b(l + 1);
            end
        end
        
        % Calculăm fracția Padé R(x) = (numărător) / (denominator)
        R = (x.^(0:m) * a) / (x.^(0:k) * b); 
    end
end

% Funcție auxiliară care calculează coeficientul seriei Taylor pentru funcția f
function coef = taylor_coef(f, n)
    syms x;  % Definim variabila simbolică x
    % Calculăm dezvoltarea Taylor a funcției f până la ordinul n + 1
    f_taylor = taylor(f, x, 'Order', n + 1); 
    % Extragem coeficientul de ordinul n din seria Taylor
    coef = feval(symengine, 'coeff', f_taylor, x, n); 
end
