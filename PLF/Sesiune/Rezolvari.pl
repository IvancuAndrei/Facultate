f([], -1).
f([H|T],S) :- f(T, S1), aux(H, S, S1).

aux(H, S, S1) :- H>0, S1<H, !, S is H.
aux(_, S, S1) :- S is S1.


aux2(j, v, y):- V > 0, !, k is j, y is k.
aux2(j, v, y):- y is v - 1.

f2(20,-1):-!.
f2(i,y):- j is i + 1, f(j,v), aux2(j, v, y).


aux3(_,S, Y):- S < 1, !, Y is S + 2.
aux3(H,S, Y):- S < 0, !, Y is S + H.
aux3(_,S, Y):- Y is S.

f1([], -1):-!.
f1([H|T],Y):- f1(T,S), aux3(H, S, Y).

p(1).
p(2).
p(3).
q(1).
q(2).
q(3).
r(1).
r(2).
r(3).
s:-!, p(X), q(Y), r(Z), write(X),write(Y), write(Z), nl.


