inserare(L,[],L ).
inserare(L, [H|T], [H|Rez]):-
    inserare(L, T, Rez).

inserare_lista(L, L2, Rez):-
    inserare(L2, L, Rez).


adauga_lista(_, [], _, []).
adauga_lista(E, [H|T], L2 , Rez):-
    H =:= E,
    inserare_lista(L2, RezN, Rez),
    adauga_lista(E, T, L2, RezN).
adauga_lista(E, [H|T], L2 , [H|Rez]):-
             H =\= E,
             adauga_lista(E, T, L2, Rez).


