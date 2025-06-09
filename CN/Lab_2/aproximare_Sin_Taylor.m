function val = aproximare_Sin_Taylor(x)
  % Seria Taylor pentru sin(x): sin(x) = x - x^3/3! + x^5/5! - x^7/7! + ...

  val = 0;          % Suma seriei Taylor pentru sin(x)
  nextTerm = x;     % Primul termen al seriei (x)
  n = 1;            % Variabila pentru controlul exponenților și factorialelor

  % Calculează termenii seriei până când aceștia devin suficient de mici
  while (val + nextTerm) ~= val  % Verifică dacă termenul adăugat schimbă suma
    val = val + nextTerm;        % Adaugă termenul curent la sumă
    nextTerm = -nextTerm * (x^2) / ((n + 1)*(n + 2));  % Calculul următorului termen
    n = n + 2;                   % Crește 'n' pentru următorul exponent
  end
end
