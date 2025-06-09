function y_interp = linear_spline(x, y, x_interp)
    % x, y: punctele de interpolare (nodurile)
    % x_interp: punctele în care se evaluează spline-ul
    % y_interp: valorile interpolate
    
    n = length(x);
    y_interp = zeros(size(x_interp));
    
    for i = 1:length(x_interp)
        xi = x_interp(i);
        
        % Găsim intervalul corespunzător
        for j = 1:n-1
            if xi >= x(j) && xi <= x(j+1)
                % Interpolare liniară între x(j) și x(j+1)
                t = (xi - x(j)) / (x(j+1) - x(j));
                y_interp(i) = y(j) + t * (y(j+1) - y(j));
                break;
            end
        end
    end
end