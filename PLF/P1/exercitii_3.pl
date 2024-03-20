%
%fact(E, Rez) = { 1, daca E = 0
%                 fact(E - 1) * E, altfel
%
%fact(E: element, Rez: element)
%fact(i,o)
%

fact(0, 1).
fact(E, Rez):-
    NE is E - 1,
    fact(NE, RezN),
    Rez is RezN * E.


%
%adauga(E, L, Rez) = { [E], daca L vida
%                       l1 + adauga(E, l2...ln, Rez), altfels
%adauga(E: element, L: list, Rez:list)
%adauga(i,i,o)
%

adauga(E,[],[E]).
adauga(E,[H|T] ,[H|Rez]):-
    adauga(E, T, Rez).

%
%member(E, L) =  true daca H = E
%                false altfel
%                member(E, l2..ln)
%
%

member(E, [E|_]):-!.
member(E, [_|T]):-
   member(E, T).


%
%
%invers(L) = [], L vida
%                 invers(l2...ln) + l1, altfel
%
%
%

invers([],[]).
invers([H|T], Rez):-
    invers(T, RezN),
    adauga(H, RezN, Rez).

%concatenare(L1, L2) = L2, daca L1 vida
%                      l1+ concat (l2...ln, L2)


concatenare([], L2, L2).
concatenare([H|T], L2, [H|Rez]):-
    concatenare(T, L2, Rez).
