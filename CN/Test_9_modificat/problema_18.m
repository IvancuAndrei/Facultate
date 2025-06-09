% Script de testare pentru analyze_float

% Lista de numere de testat
numbers = [...
    single(1.5), single(-2.75), single(0.0), single(-0.0),...
    single(1e-40), single(Inf), single(-Inf), single(NaN),...
    double(10.625), double(-0.15625), double(0.0), double(-0.0),...
    double(5e-324), double(Inf), double(-Inf), double(NaN)
];

test_names = {...
    'Single: 1.5', 'Single: -2.75', 'Single: +0.0', 'Single: -0.0',...
    'Single: subnormal', 'Single: +Inf', 'Single: -Inf', 'Single: NaN',...
    'Double: 10.625', 'Double: -0.15625', 'Double: +0.0', 'Double: -0.0',...
    'Double: subnormal', 'Double: +Inf', 'Double: -Inf', 'Double: NaN'...
};

fprintf('--- Incepem testarea ---\n');

for i = 1:length(numbers)
    fprintf('\nTest: %s\n', test_names{i});
    try
        [sign_bit, exp_bin, exp_dec, significand_int, significand_dec] = analyze_float(numbers(i));
        
        % Afisare rezultate
        fprintf('Semn: %d\n', sign_bit);
        fprintf('Exponent (binar): %s\n', exp_bin);
        fprintf('Exponent (zecimal): %d\n', exp_dec);
        fprintf('Semnificant întreg: %d\n', significand_int);
        fprintf('Semnificant în zecimal: %.15f\n', significand_dec);
    catch ME
        fprintf('Eroare la testul %s: %s\n', test_names{i}, ME.message);
    end
end

fprintf('\n--- Testare finalizata ---\n');
