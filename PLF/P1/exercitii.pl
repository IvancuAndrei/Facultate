%
%factorial = { 1, daca n <= 1
%              n * factorial(n-1), daca n > 1
%
%factorial(n = int, rezultat = int)
%factorial(i, o)
%

factorial(0,1).
factorial(N, R):-  N > 0,
                   N1 is N - 1,
                   factorial(N1, R1),
                   R is R1 * N.

%
%adaug_elem = { [ elem ], daca n = 0
%                l1 + adaug_elem(e, l2...ln), altfel
%
%adaug_elem(elem : int, list, rezultat : list)
%adaug_elem(i,i,o)
%

adaug_elem(E,[],[E]).
adaug_elem(E,[H|T], [H|Rez]):-
    adaug_elem(E, T, Rez).


%
% membru = { true, daca H = elem
%            false, altfel
%            member(elem, T)
%
%membru( list, elem : int)
%membru(i,i)

membru(E, [E|_]) :- !.
membru(E, [_|L]):- membru(E, L).

%
%invers = {  vida, daca  lista = vida
%            invers(l2...ln) + l1, altfel
%
%invers(L : list, R : list)
%invers(i,o)
%

invers([], []).
invers([H|T], R):-
    invers(T, R1),
    adaug_elem(H, R1, R).


%
% pare = { vida, daca lista e vida
%          l1 + pare(l2...ln), daca l1 % 2
%          pare(l2...ln), altfel
%
% pare( L : list, R: list)
% pare( i, o )

pare([], []).
pare([H|T], R):-
    0 is H mod 2,
    pare(T, R1),
    adaug_elem(H, R1, R).

