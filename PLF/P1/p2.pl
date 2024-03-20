% a
%
% Model recursiv:
% my_append(l1...ln, e) =
%	[e], n = 0
%	l1 + my_append(l2...ln), altfel
%
% my_append(L:list, E:number, R:list)
% my_append(i, i, o)

my_append([], E, [E]).
my_append([H|T], E, [H|R]) :-
    my_append(T, E, R).

% Model recursiv:
% my_length(l1...ln) =
%	0, n = 0
%	1 + my_length(l2...ln), altfel

% my_length(L:list, R:number)
% my_length(i, o)

my_length([], 0).
my_length([_|T], R) :-
    my_length(T, RC),
    R is RC + 1.

% Model recursiv:
% inv_list(l1...ln) =
%	[], n = 0
%	my_append(inv_list(l2...ln), l1), altfel
%
% inv_list(L:list, R:list)
% inv_list(i, o)

inv_list([], []).
inv_list([H|T], R) :-
    inv_list(T, RI),
    my_append(RI, H, R).

%Model matematic:
% suma(a1...an, b1...bm, c) =
%	[], n = 0 si m = 0 si c = 0
%	[1], n = 0 si m = 0 si c = 1
%	(b1 + c) + suma([], b2...bm, 0), n = 0 si b1 + c < 10
%	((b1 + c) % 10) + suma([], b2...bm, 1), n = 0 si b1 + c > 10
%	(a1 + b1 + c) + suma(a2...an, b2...bm, 0), a1 + b1 + c < 10
%	((a1 + b1 + c) % 10) + suma(a2...an, b2...bm, 1), a1 + b1 + c > 10
% suma(i, i, i, o)

suma([], [], 0, []).
suma([], [], 1, [1]).
suma([], [HB|TB], C, [HBC|R]) :-
    HBC is (HB + C) mod 10,
    HBC - HB - C =:= 0,
    suma([], TB, 0, R).
suma([], [HB|TB], C, [HBC|R]) :-
    HBC is (HB + C) mod 10,
    HBC - HB - C =\= 0,
    suma([], TB, 1, R).
suma([HA|TA], [HB|TB], C, [HR|R]) :-
    HR is (HA + HB + C) mod 10,
    HR - HA - HB - C =:= 0,
    suma(TA, TB, 0, R).
suma([HA|TA], [HB|TB], C, [HR|R]) :-
    HR is (HA + HB + C) mod 10,
    HR - HA - HB - C =\= 0,
    suma(TA, TB, 1, R).

% Model recursiv:
% sum_lists(a1...an, b1...bm) =
%	a1...an, m = 0
%	b1...bm, n = 0
%	inv_list(suma(inv_list(a1...an), inv_list(b1...bm), 0)), n <= m
%	inv_list(suma(inv_list(b1...bm), inv_list(a1...an), 0)), altfel

% sum_lists(A:list, B:list, R:list)
% sum_lists(i, i, o)
%
%
sum_lists(A, [], A).
sum_lists([], B, B).
sum_lists(A, B, R) :-
    my_length(A, LA),
    my_length(B, LB),
    LA =< LB, !,
    inv_list(A, RA),
    inv_list(B, RB),
    suma(RA, RB, 0, RS),
    inv_list(RS, R).
sum_lists(A, B, R) :-
    inv_list(A, RA),
    inv_list(B, RB),
    suma(RB, RA, 0, RS),
    inv_list(RS, R).


% succesor(L:list, R:list)
% succesor(i, o)

succesor(L, R) :- sum_lists([1], L, R).

% b
% Model recursiv:
% succList(l1...ln, list) =
%	[], n = 0
%       succesor(l1) + succList(l2...ln) daca is_list(l1) = True,
%       l1 + succList(l2...ln) daca is_list(l1) = False
%       succList(L:list, R:list) succList(i, o)

succList([], []).
succList([H|T], [HR|R]) :- is_list(H), !,
    succesor(H, HR),
    succList(T, R).
succList([H|T], [H|R]) :-
    succList(T, R).




