function val = aproximare_Cos_Taylor(x)
  % Seria Taylor pentru cos(x): cos(x) = 1 - x^2/2! + x^4/4! - x^6/6! + ...

  val = 0;          % Suma seriei Taylor pentru cos(x)
  nextTerm = 1;     % Primul termen al seriei (1)
  n = 1;            % Variabila pentru controlul exponenților și factorialelor

  % Calculează termenii seriei până când aceștia devin suficient de mici
  while (val + nextTerm) ~= val  % Verifică dacă adăugarea unui nou termen schimbă suma
    val = val + nextTerm;        % Adaugă termenul curent la sumă
    nextTerm = -nextTerm * x^2 / (n * (n + 1));  % Calculul următorului termen din serie
    n = n + 2;                   % Crește 'n' pentru următorul exponent
  end
end
