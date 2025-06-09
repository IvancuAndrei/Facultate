function [sign_bit, exp_bin, exp_dec, significand_int, significand_dec] = analyze_float(num)
    % Verificăm precizia numărului (simplă sau dublă)
    if isa(num, 'single')
        bits = 32;       % Număr total de biți
        exp_bits = 8;    % Număr de biți pentru exponent
        mant_bits = 23;  % Număr de biți pentru mantisă
        bias = 127;      % Bias pentru exponent
        bin_rep = typecast(single(num), 'uint32'); % Convertim la 32 de biți
    else
        bits = 64;
        exp_bits = 11;
        mant_bits = 52;
        bias = 1023;
        bin_rep = typecast(double(num), 'uint64'); % Convertim la 64 de biți
    end

    % Extragem semnul
    sign_bit = bitget(bin_rep, bits);

    % Extragem exponentul
    exp_raw = bitshift(bin_rep, -(mant_bits)); % Obținem exponentul brut
    exp_mask = bitshift(1, exp_bits) - 1; % Creăm un mask pentru a lua doar bitii exponentului
    exp_raw = bitand(exp_raw, exp_mask); % Aplicăm masca
    exp_bin = dec2bin(exp_raw, exp_bits); % Exponentul în binar
    exp_dec = double(exp_raw) - bias; % Exponentul în zecimal

    % Extragem mantisa (fără bitul ascuns)
    mantissa_mask = bitshift(1, mant_bits) - 1;
    mantissa = bitand(bin_rep, mantissa_mask);

    % Adăugăm bitul ascuns (dacă exponentul nu este 0)
    if exp_raw == 0
        significand_int = mantissa; % Subnormal, nu are bit ascuns
        significand_dec = double(significand_int) / bitshift(1, mant_bits);
    else
        significand_int = bitshift(1, mant_bits) + mantissa; % Normal, adăugăm bitul ascuns
        significand_dec = double(significand_int) / bitshift(1, mant_bits);
    end

    % Afișare rezultate
    fprintf('Semn: %d\n', sign_bit);
    fprintf('Exponent (binar): %s\n', exp_bin);
    fprintf('Exponent (zecimal): %d\n', exp_dec);
    fprintf('Semnificant întreg: %d\n', significand_int);
    fprintf('Semnificant în zecimal: %.15f\n', significand_dec);
end
