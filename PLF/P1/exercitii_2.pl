
%exista = true daca l1 = E
%         exista(E, l2...ln)
%         false daca lista e vida


exista(E,[E|_]).
exista(E,[_|T]):- exista(E,T).

%
% diferenta=
%          l1 + diferenta(l2...ln, P), daca l1 nu se afla in P
%          diferenta(l2...ln, P)

diferenta([], L, []).
diferenta([H|T], L, R):-
    exista(H, L),
    !,
    diferenta(T, L, R).
diferenta([H|T], L, [H|R]):- diferenta(T, L, R).






%adauga = [E], daca lista e vida
%               l1+ adauga(E, l2...ln) altfel

adauga(E,[],[E]).
adauga(E, [H|T], [H|Rez]):- adauga(E, T, Rez).


%adauga_par = l1 + adauga_par(l2...ln) daca l1 nu este par
%             l1 + 1 + adauga_par(l2...ln) altfel
%

adauga_par([], []).
adauga_par([H|T], [H, 1|Rez]):- H mod 2 =:= 0,
    adauga_par(T, Rez).
adauga_par([H|T], [H|Rez]):- H mod 2 =:= 1,
    adauga_par(T, Rez).

%divizor_comun =
%              n - m, daca n > m
%              m - n, daca m > n
%              n, daca n = m
%

divizor_comun(X, X, X).
divizor_comun(X, Y, R):- X > Y,
    NX is X - Y,
    divizor_comun(NX, Y, R).
divizor_comun(X, Y, R):- X < Y,
    NY is Y - X,
    divizor_comun(X, NY, R).


multiplu_comun(X, Y, R):-
    divizor_comun(X, Y, R1),
    R is X * Y / R1.

multiplu_lista([], 1).
multiplu_lista([H|T], R) :-
    multiplu_lista(T, RN),
    multiplu_comun(H, RN, R).




inversare_lista([], []).
inversare_lista([H|T], R):-
    inversare_lista(T, R1),
    adauga(H, R1, R).


%
% adunare_lista = (a1 + b1)% 10 + adunare_lista(a2...an, b2...bn, 0)
%                                 daca a1 + b1 < 10
%                 (a1 + b1) % 10 + adunare_lista(a2...an, b2...bn, 1)
%                                 daca a1 + b1 > 10
%                 la fel doar ca cu capture flag
%                 la fel

suma([], [], 0, []).
suma([], [], 1, [1]).
suma([], [HB|TB], C, [(HB + C) mod 10|R]) :-
    HB + C < 10,
    suma([], TB, 0, R).
suma([], [HB|TB], C, [(HB + C) mod 10|R]) :-
    HB + C > 0,
    suma([], TB, 1, R).
suma([HA|TA], [HB|TB], C, [(HA + HB + C) mod 10|R]) :-
    HA + HB + C < 10,
    suma(TA, TB, 0, R).
suma([HA|TA], [HB|TB], C, [(HA + HB + C) mod 10|R]) :-
    HA + HB + C > 10,
    suma(TA, TB, 1, R).

lista_divizori(X, X, [X]).
lista_divizori(X, Y, [Y|Rez]):-
    X >= Y,
    X mod Y =:= 0,
    YN is Y + 1,
    lista_divizori(X, YN, Rez).

lista_divizori(X, Y, Rez):-
    X >= Y,
    X mod Y =\= 0,
    YN is Y + 1,
    lista_divizori(X, YN, Rez).

lista_div(X, R):- lista_divizori(X, 1, R).

adauga_div([], []).
adauga_div([H|T], [H, L| Rez]):-
    lista_div(H, L),
    adauga_div(T, Rez).



my_length([], 0).
my_length([_|T], R):-
   my_length(T, RN),
   R is RN + 1.

insert_list([], _, _, _, []).
insert_list([H|T], E, Pos, C, [H,E|R]) :- Pos =:= C, !,
    NPos is Pos + 1,
    CN is C * 2 + 1,
    insert_list(T, E, NPos, CN, R).
insert_list([H|T], E, Pos, C, [H|R]) :-
    NPos is Pos + 1,
    insert_list(T, E, NPos, C, R).

insertNb(L, E, R) :- insert_list(L, E, 1, 1, R).




