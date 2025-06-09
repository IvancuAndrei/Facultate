% Calcul folosind seria Taylor
sinus_Taylor = ['Folosind seria Taylor pentru sin(pi/3): ', num2str(aproximare_Sin_Taylor(pi/3))];
disp(sinus_Taylor)
disp(['Valoarea reală sin(pi/3): ', num2str(sin(pi/3))]);

cos_Taylor = ['Folosind seria Taylor pentru cos(pi/3): ', num2str(aproximare_Cos_Taylor(pi/3))];
disp(cos_Taylor)
disp(['Valoarea reală cos(pi/3): ', num2str(cos(pi/3))]);

% Calcul pentru 10*pi
val = 10*pi;
sinus_Taylor_10_pi = ['Folosind seria Taylor pentru sin(10*pi): ', num2str(aproximare_Sin_Taylor(val)) ];
disp(sinus_Taylor_10_pi)
disp(['Valoarea reală sin(10*pi): ', num2str(sin(pi*10))]);

% Reducerea unghiului la primul cadran 
% [val_reduced, semn_sin, semn_cos] = reducere_primul_cadran(val);
% sinus_Taylor_10_pi = ['Folosind seria Taylor pentru sin(10*pi): ', num2str(semn_sin * aproximare_Sin_Taylor(val_reduced))];
% disp(sinus_Taylor_10_pi)
% disp(['Valoarea reală sin(10*pi): ', num2str(sin(val))]);

